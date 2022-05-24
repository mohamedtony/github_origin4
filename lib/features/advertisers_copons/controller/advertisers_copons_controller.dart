import 'dart:async';
import 'dart:io';

import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:advertisers/app_core/network/models/GetCouponsFilterModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/models/SelectedNotSelectedFilterAdsType.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/GetAdvertisersCoponsRequest.dart';
import 'package:advertisers/app_core/network/requests/GetMyRequestsModelRequest.dart';
import 'package:advertisers/app_core/network/requests/SelectCoponsRequest.dart';
import 'package:advertisers/app_core/network/responses/CoponsResponse.dart';
import 'package:advertisers/app_core/network/responses/CreateAdvertiseRequestResponse.dart';
import 'package:advertisers/app_core/network/responses/EditCoponsResponse.dart';
import 'package:advertisers/app_core/network/responses/GetCouponsFilterFormResponse.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/features/advertiser_details/sheets/advertising_date_sheet.dart';
import 'package:advertisers/features/advertisers_copons/widgets/activate_deactivate_sheet.dart';
import 'package:advertisers/features/advertisers_copons/widgets/discount_copon_sheet_advertiser.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as myDio;


class AdvertisersCoponsController extends GetxController{

  var myRequestsAsClient=<RequestModel>[].obs;
  var currentIndex=0.obs;
  var indexClicked = (-1).obs;
  // var myRequestAsClient
  List<int>? checkListShare = [];
  var isOpend = false;
  var position = -1;
  List<CoponModelResponse>? coponsResponse;
  late String myToken;
  var isLoadingStatus = false.obs;
  List<String> status=['ايقاف','تنشيط','تعديل','حذف'];
  var registerClientUserResponse=RegisterClientUserResponse().obs;
  List<int>? checkList = [];
  late Repository repo;
  late String token;
String? dropdownValue;
  //---------------------- for discount sheet --------------------------------------------
  late XFile xFile ;
  File? imageFile;
  myDio.MultipartFile? imageCoponMultiPart;
  var imagePathCopon = ''.obs;
  var isDiscountSaveClicked = false.obs;
  TextEditingController? coponNumberController,coponNameController,coponDiscountController,coponUsesController,coponStoreUrlController,coponStoreNameController;
  FocusNode coponNumberNode = FocusNode();
  FocusNode coponNameNode = FocusNode();
  FocusNode coponDiscountNode = FocusNode();
  FocusNode coponUsesNode = FocusNode();
  FocusNode coponStroreUrlNode = FocusNode();
  FocusNode coponStoreNameNode = FocusNode();
  //FocusNode coponUrlNode = FocusNode();
  var coponModel=CoponModelResponse().obs;

  var isLoading = true.obs;
  var isEmpty = false.obs;

  RxList<SelectedNotSelectedFilterAdsType> advertisersTopRated =
      <SelectedNotSelectedFilterAdsType>[].obs;

  RxList<SelectedNotSelectedFilterAdsType> requestsTypes =
      <SelectedNotSelectedFilterAdsType>[].obs;
  var selectedNotSelectedFilterAdsType = SelectedNotSelectedFilterAdsType().obs;
  var selectedSortType = ''.obs;
  var isLoadingGetAdvertisersFromModel = true.obs;
  var isFilterSavedClicked = false.obs;

  GetAdvertisersCoponsRequest getMyRequestsModelRequest = GetAdvertisersCoponsRequest(page: 1);
  onDateClickedSaved(BuildContext context) {
    isFilterSavedClicked.value = true;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "تم حفظ البيانات بنجاح !",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
        )));
    Get.back();
    isLoading.value = true;
    List<String>? sortByStrings = [];
    advertisersTopRated.forEach((element) {
      if (element.isSelected.isTrue) {
        sortByStrings.add(element.key!);
      }
    });

    Logger().i(GetAdvertisersCoponsRequest(
        filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
        store_name: selectedSortType.value!="اختر متجر"?selectedSortType.value:null,
        )
        .toJson());
    getMyRequestsModelRequest = GetAdvertisersCoponsRequest(
      filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
      store_name: selectedSortType.value!="اختر متجر"?selectedSortType.value:null,    );
    if(tabId==1) {
      advertiserCoponspagingController.refresh();
    }else{
      appCoponspagingController.refresh();
    }
    //pagingController.refresh();
    //refreshController.resetNoData();
    //getRequestsData(isRefresh: true);
  }

  void onReturnClicked(BuildContext context) {
    isFilterSavedClicked.value = false;
    advertisersTopRated.value.forEach((element) {
      element.isSelected.value = false;
    });
    //selectedUserLocations.value = [];
    searchAdvertiserController.text = '';
    selectedNotSelectedFilterAdsType.value = SelectedNotSelectedFilterAdsType();
    //fromDate1.value = "";
    //toDate1.value = "";
    selectedSortType.value = '';
    getMyRequestsModelRequest = GetAdvertisersCoponsRequest(page: 1,);
    if(tabId==1) {
      lastPage = -1;
      advertiserCoponspagingController.refresh();
    }else{
      lastPageApp = -1;
      appCoponspagingController.refresh();
    }
    Get.back();
  }

  void addAndRemoveOtherFromCheckList(id){
    if(checkList!.contains(id)){
      checkList!.clear();
    }else{
      checkList!.clear();
      checkList!.add(id);
      update();
    }

    update();
  }




  int tabId = 1;
  void passIndex(newIndex){
    tabId = newIndex;
    /*if(newIndex==1) {
      advertiserCoponspagingController.refresh();
    }else{
      appCoponspagingController.refresh();
    }*/
    update();
  }

  void changeStatus(bool isOpend,int position) {
    this.isOpend = isOpend;
    this.position = position;
    update();
  }

  void likeCopon(int? id) {
    client!.likeCopon(id!,"Bearer "+myToken).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        // Get.back();
        print("token liked");
        Logger().i(value.data.toString());
      }
    });
  }

  void disLike(int? id) {
    client!.dislikeCopon(id!,"Bearer "+myToken).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        // Get.back();
        print("token disliked");
        Logger().i(value.data.toString());
      }
    });
  }



  GlobalKey<FormState> searchFormKey=GlobalKey<FormState>();
  late TextEditingController searchController;
  late TextEditingController searchAdvertiserController;
  var search='';
  int lastPage = -1;
  int lastPageApp = -1;
  @override
  void onInit() {
    // passIndex;
    coponNumberController=  TextEditingController();
    coponNameController=  TextEditingController();
    coponDiscountController=  TextEditingController();
    coponUsesController=  TextEditingController();
    coponStoreUrlController=  TextEditingController();
    coponStoreNameController=  TextEditingController();
    repo=Repository();
    token =storage.read("token");
    searchController=TextEditingController();
    searchAdvertiserController =TextEditingController();
   // getRequestsData();
    super.onInit();
  }
  final PagingController<int, CoponModelResponse> advertiserCoponspagingController = PagingController(firstPageKey: 1);

  Future<List<CoponModelResponse>> getCopons(
      {/*String brandId, String catgegoryId,*/ int? pageKey}) async {
    String myToken = await storage.read("token");
    getMyRequestsModelRequest.page = pageKey!;
    Logger().i(getMyRequestsModelRequest.toJson());
    CoponsResponse response = await client!.getClientsCopons(getMyRequestsModelRequest.toJson(),"Bearer " + myToken);
    final completer = Completer<List<CoponModelResponse>>();
    List<CoponModelResponse> notifications = [];
    if(response.data!=null && response.data!.isNotEmpty) {
      notifications = response.data!;
    }
    if(response.pagination?.last_page!=null){
      lastPage = response.pagination!.last_page!;
    }
    completer.complete(notifications);
    return completer.future;
    // return topSellingList;
  }

  // Call this when the user pull down the screen
  Future<void> loadDataForACopons() async {
    getMyRequestsModelRequest = GetAdvertisersCoponsRequest(page: 1);
    advertiserCoponspagingController.itemList=[];
    fetchAdvertiserCoponsPage(1);
  }

  var getAdsFilterForm = GetCouponsFilterModel().obs;
  Future<void> getCoponsFilterForm(BuildContext context) async {
    print("here");
    String myToken = await storage.read("token");
    client!.getCoupounsShopsFilterForm("Bearer " + myToken).then((value) {
      if (value.status == 200 && value.data != null) {
        getAdsFilterForm.value = value.data!;
        getAdsFilterForm.value.stores?.insert(0,'اختر متجر');
        advertisersTopRated.value = [];
        isLoadingGetAdvertisersFromModel.value = false;
        getAdsFilterForm.value.filters?.entries.forEach((element) {
          advertisersTopRated.add(
              SelectedNotSelectedFilterAdsType(
                name: element.value,
                key: element.key,
              ));
        });
      } else {
        isLoadingGetAdvertisersFromModel.value = false;
      }
    });
  }


  Future<void> fetchAdvertiserCoponsPage(int pageKey) async {
    myToken = await storage.read("token");
    print("hhhhhhhhhhhhhhhhhhhhhhhhpageKey= "+pageKey.toString());
    print("hhhhhhhhhhhhhhhhhhhhhhhh="+myToken);
    try {
      getMyRequestsModelRequest.page = pageKey;
      List<CoponModelResponse> newItems = await getCopons(pageKey: pageKey);
/*
      bool isLastPage = newItems.isEmpty;
      if (isLastPage) {
        print("isLast = " + isLastPage.toString());
        advertiserCoponspagingController.appendLastPage(newItems);
        // pagingController. = "tony";
      } else {
        //final nextPageKey = pageKey + newItems.length;
        int nextPageKey = ++pageKey;
        print("nextPageKey=" + nextPageKey.toString());
        advertiserCoponspagingController.appendPage(newItems, nextPageKey);
      }
*/

      if (lastPage==pageKey) {
        advertiserCoponspagingController.appendLastPage(newItems);
      } else {
        int nextPageKey = ++pageKey;
        advertiserCoponspagingController.appendPage(newItems, nextPageKey);
      }
      // print("first=" + newItems.first.Code.toString());
      //print("last=" + newItems.last.Code.toString());


    } catch (error) {
      advertiserCoponspagingController.error = error;
    }
  }

  final PagingController<int, CoponModelResponse> appCoponspagingController = PagingController(firstPageKey: 1);

  Future<List<CoponModelResponse>> getAppCopons(
      {/*String brandId, String catgegoryId,*/ int? pageKey}) async {
    String myToken = await storage.read("token");

    getMyRequestsModelRequest.page = 1;
    Logger().i(getMyRequestsModelRequest.toJson());
    CoponsResponse response = await client!.getAppCopons(getMyRequestsModelRequest.toJson(),"Bearer " + myToken);

    final completer = Completer<List<CoponModelResponse>>();
    List<CoponModelResponse> notifications = [];
    if(response.data!=null && response.data!.isNotEmpty) {
      notifications = response.data!;
    }
    if(response.pagination?.last_page!=null) {
      lastPageApp = response.pagination!.last_page!;
    }
    completer.complete(notifications);
    return completer.future;
    // return topSellingList;
  }

  Future<void> fetchAppCoponsPage(int pageKey) async {
    myToken = await storage.read("token");
    print("hhhhhhhhhhhhhhhhhhhhhhhhpageKey= "+pageKey.toString());
    print("hhhhhhhhhhhhhhhhhhhhhhhh="+myToken);
    try {
      List<CoponModelResponse> newItems = await getAppCopons(pageKey: pageKey);

    //  bool isLastPage = newItems.isEmpty;
      if (lastPageApp==pageKey) {
        //print("isLast = " + isLastPage.toString());
        appCoponspagingController.appendLastPage(newItems);
        // pagingController. = "tony";
      } else {
        //final nextPageKey = pageKey + newItems.length;
        int nextPageKey = ++pageKey;
        print("nextPageKey=" + nextPageKey.toString());
        appCoponspagingController.appendPage(newItems, nextPageKey);
      }
      // print("first=" + newItems.first.Code.toString());
      //print("last=" + newItems.last.Code.toString());


    } catch (error) {
      appCoponspagingController.error = error;
    }
  }

  String? validatePhone(String phone){
    if (phone.isEmpty){
      return 'حقل الادخال فارغ';
    }
    return null;
  }



  void checkSearch(){
    final isValid=searchFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    searchFormKey.currentState!.save();
    // loginClient();
  }

  int currentPage = 1;

  late int totalPages=0;

  //List<RequestModel> myRequests = [];

  final RefreshController refreshController =
  RefreshController(initialRefresh: true);
  Future<bool> getRequestsData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    EasyLoading.show();
    repo.get<MyRequestsResponse>(
        path: 'myrequests?archive=1',
        fromJson: (json) => MyRequestsResponse.fromJson(json),
        json: {"token": "Bearer $token"},//"Bearer  $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if (isRefresh) {
            myRequestsAsClient.value = res.data?.requests??[];
          }else{
            myRequestsAsClient.addAll(res.data?.requests??[]);
          }

          currentPage++;

          totalPages = res.data?.pagination?.total??0;

          // print(response.body);
          //setState(() {});
          update();
          return true;

        },
        onError: (err, res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          return false;
        });

    return false;
  }
  bool isNumericUsingRegularExpression(String string) {
    final numericRegex =
    RegExp(r'^-?(([0-9]*)|(([0-9]*)))$');

    return numericRegex.hasMatch(string);
  }
  bool isUrlUsingRegularExpression(String string) {
    final numericRegex =
    RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');

    return numericRegex.hasMatch(string);
  }
  // 2. compress file and get file.
  Future<File> compressFile(File file) async {
    final filePath = file.absolute.path;
    // Create output file path
    // eg:- "Volume/VM/abcd_out.jpeg""/"
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    //final lastIndex = filePath.lastIndexOf("/");
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, outPath,
      quality: 50,
    );
    print("myLength= " + file.lengthSync().toString());
    print("myLength= " +result!.lengthSync().toString());
    return result;
  }
  void _openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 0);

    if(pickedFile!=null){
      xFile = pickedFile;
      imageFile = File(xFile.path);
      imagePathCopon.value =xFile.path;
      print("pickedMFile"+(imageFile!.lengthSync()).toString());
      compressFile(imageFile!).then((value) async {
        print("pickedMFile"+(value.lengthSync()).toString());
        imageFile = File(value.path);
        imageCoponMultiPart= await myDio.MultipartFile.fromFile(value.path,
            filename: value.path
                .split(Platform.pathSeparator)
                .last);
      });

    }
    /* setState(() {
      imageFile = pickedFile!;
    });*/


    Navigator.pop(context);
  }
  void showToast(msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
  //================================== dicount sheet ==========================================
  var endAdvertisingDateCoupon = ''.obs;
  void addendAdvertisingDateCoupon(String? endDate){
    endAdvertisingDateCoupon.value = endDate!;
  }
  Future<void> showChoiceImageDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("إختر",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openGallery(context);
                },
                title: Text("معرض الصور"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openCamera(context);
                },
                title: Text("الكاميرا"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }
  void _openCamera(BuildContext context) async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    /* setState(() {
      imageFile = pickedFile!;
    });*/
    if(pickedFile!=null){
      xFile = pickedFile;
      imageFile = File(xFile.path);
      imagePathCopon.value = xFile.path;
      compressFile(imageFile!).then((value) async {
        print("pickedMFile"+(value.lengthSync()).toString());
        imageFile = File(value.path);
        imageCoponMultiPart = await myDio.MultipartFile.fromFile(value.path,
            filename: value.path
                .split(Platform.pathSeparator)
                .last);
      });
    }
    Navigator.pop(context);
  }
  void onDiscountCoponSaveClicked(BuildContext context) {

    if(imagePathCopon.value.isEmpty){
      showToast("من فضلك قم بإدخال صورة كوبون الخصم !");
      showChoiceImageDialog(context);
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }
    else if(coponNumberController?.text!=null && coponNumberController!.text.isEmpty){
      showToast("من فضلك قم بإدخال رقم كوبون الخصم !");
      coponNumberNode.requestFocus();
      return;
    }/*else if(!isNumericUsingRegularExpression(coponNumberController!.text)){
      showToast("من فضلك قم بإدخال رقم كوبون صحيح !");
      coponNumberNode.requestFocus();
      return;
    }*/else if(coponNameController?.text!=null && coponNameController!.text.isEmpty){
      showToast("من فضلك قم بإدخال اسم كوبون الخصم !");
      coponNameNode.requestFocus();
      return;
    }
    else if(coponDiscountController?.text!=null && coponDiscountController!.text.isEmpty){
      showToast("من فضلك قم بإدخال نسبة الخصم!");
      coponDiscountNode.requestFocus();
      return;
    }else if(!isNumericUsingRegularExpression(coponDiscountController!.text)){
      showToast("من فضلك قم بإدخال نسبة خصم صحيحة!");
      coponDiscountNode.requestFocus();
      return;
    }else if(coponUsesController?.text!=null && coponUsesController!.text.isEmpty){
      showToast("من فضلك قم بإدخال عدد إستخدامات الكوبون !");
      coponUsesNode.requestFocus();
      return;
    }else if(!isNumericUsingRegularExpression(coponUsesController!.text)){
      showToast("من فضلك قم بإدخال عدد إستخدامات الكوبون بشكل صحيح!");
      coponUsesNode.requestFocus();
      return;
    }else if(coponStoreUrlController?.text!=null && coponStoreUrlController!.text.isEmpty){
      showToast("من فضلك قم بإدخال رابط المتجر !");
      coponStroreUrlNode.requestFocus();
      return;
    }else if(!isUrlUsingRegularExpression(coponStoreUrlController!.text)){
      showToast("من فضلك قم بإدخال رابط المتجر المتجر بشكل صحيح!");
      coponStroreUrlNode.requestFocus();
      return;
    }else if(coponStoreUrlController?.text!=null && coponStoreNameController!.text.isEmpty){
      showToast("من فضلك قم بإدخال اسم المتجر !");
      coponStoreNameNode.requestFocus();
      return;
    }else if(endAdvertisingDateCoupon!=null && endAdvertisingDateCoupon.isEmpty){
      showToast("من فضلك قم بإدخال تاريخ إنتهاء الكوبون !");
      onSelectCoponDate(context);
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    } else{
      if(coponDiscountController?.text!=null && coponDiscountController!.text.isNotEmpty){
        //int.parse(coponDiscountController!.text);
        if(int.parse(coponDiscountController!.text)>100){
          showToast("من فضلك قم بإدخال نسبة خصم لا تتعدى 100 %!");
          coponDiscountNode.requestFocus();
          return;
        }else if(int.parse(coponDiscountController!.text)<0){
          showToast("من فضلك قم بإدخال نسبة خصم صحيحة!");
          coponDiscountNode.requestFocus();
          return;
        }
      }
/*      if(endAdvertisingDateCoupon.isNotEmpty&& fromDate.value.isNotEmpty){
        try{
          fromDate.value = fromDate.value.replaceAll(" ", "");
          print("myDate"+fromDate.value);
          print("myDate"+endAdvertisingDateCoupon.value);
          DateTime endAdvertisingDateCouponDate = DateTime.parse(endAdvertisingDateCoupon.value);
          DateTime fromDateAdvertise = DateTime.parse(fromDate.value);
          if(endAdvertisingDateCouponDate.isBefore(fromDateAdvertise)){
            showToast("لا يجب ان يكون تاريخ انتهاء الكوبون قبل بداية الاعلان");
            //onSelectCoponDate(context);
            FocusManager.instance.primaryFocus?.unfocus();
            return;
          }
        }catch(e){

        }
      }*/

      isDiscountSaveClicked.value = true;
      coponModel.value = CoponModelResponse(id: coponModel.value.id,image: imagePathCopon.value,code: coponNumberController?.text,name: coponNameController?.text,discount: int.parse(coponDiscountController!.text),uses: int.parse(coponUsesController!.text),link: coponStoreUrlController!.text,store_name:coponStoreNameController!.text,ended_at: endAdvertisingDateCoupon.value,);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم حفظ بيانات الكوبون بنجاح !",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
      Get.back();
    }

  }

  void onSelectCoponDate(BuildContext context){
    DateTime selectedDate;
    if(endAdvertisingDateCoupon.isNotEmpty){
      print("myDate"+endAdvertisingDateCoupon.value);
      DateTime endAdvertisingDateCouponDate ;
      try{
        endAdvertisingDateCouponDate = DateTime.parse(endAdvertisingDateCoupon.value);
      }catch(e){
        endAdvertisingDateCouponDate = DateTime.now();
      }

      selectedDate = endAdvertisingDateCouponDate;
    }else{
      selectedDate = (DateTime.now()).add( Duration(days: 1));
    }


    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialEntryMode:
          DatePickerEntryMode.calendarOnly,
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: ( DateTime.now()).add( Duration(days: 600)));
      // if (picked != null && picked != selectedDate)
      if (picked != null && picked != selectedDate)
      {
        addendAdvertisingDateCoupon(dateFormat.format(picked));
        // controller.endAdvertisingDate = dateFormat.format(picked);
      }
      // selectedDate = picked;

    }

    _selectDate(context);
  }
  void onEditRequestClicked(BuildContext context,int coponId) {
    if(imagePathCopon.value.isEmpty){
      showToast("من فضلك قم بإدخال صورة كوبون الخصم !");
      showChoiceImageDialog(context);
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }
    else if(coponNumberController?.text!=null && coponNumberController!.text.isEmpty){
      showToast("من فضلك قم بإدخال رقم كوبون الخصم !");
      coponNumberNode.requestFocus();
      return;
    }/*else if(!isNumericUsingRegularExpression(coponNumberController!.text)){
      showToast("من فضلك قم بإدخال رقم كوبون صحيح !");
      coponNumberNode.requestFocus();
      return;
    }*/else if(coponNameController?.text!=null && coponNameController!.text.isEmpty){
      showToast("من فضلك قم بإدخال اسم كوبون الخصم !");
      coponNameNode.requestFocus();
      return;
    }
    else if(coponDiscountController?.text!=null && coponDiscountController!.text.isEmpty){
      showToast("من فضلك قم بإدخال نسبة الخصم!");
      coponDiscountNode.requestFocus();
      return;
    }else if(!isNumericUsingRegularExpression(coponDiscountController!.text)){
      showToast("من فضلك قم بإدخال نسبة خصم صحيحة!");
      coponDiscountNode.requestFocus();
      return;
    }else if(coponUsesController?.text!=null && coponUsesController!.text.isEmpty){
      showToast("من فضلك قم بإدخال عدد إستخدامات الكوبون !");
      coponUsesNode.requestFocus();
      return;
    }else if(!isNumericUsingRegularExpression(coponUsesController!.text)){
      showToast("من فضلك قم بإدخال عدد إستخدامات الكوبون بشكل صحيح!");
      coponUsesNode.requestFocus();
      return;
    }else if(coponStoreUrlController?.text!=null && coponStoreUrlController!.text.isEmpty){
      showToast("من فضلك قم بإدخال رابط المتجر !");
      coponStroreUrlNode.requestFocus();
      return;
    }else if(!isUrlUsingRegularExpression(coponStoreUrlController!.text)){
      showToast("من فضلك قم بإدخال رابط المتجر المتجر بشكل صحيح!");
      coponStroreUrlNode.requestFocus();
      return;
    }else if(coponStoreUrlController?.text!=null && coponStoreNameController!.text.isEmpty){
      showToast("من فضلك قم بإدخال اسم المتجر !");
      coponStoreNameNode.requestFocus();
      return;
    }else if(endAdvertisingDateCoupon!=null && endAdvertisingDateCoupon.isEmpty){
      showToast("من فضلك قم بإدخال تاريخ إنتهاء الكوبون !");
      onSelectCoponDate(context);
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    } else{
      if(coponDiscountController?.text!=null && coponDiscountController!.text.isNotEmpty) {
        //int.parse(coponDiscountController!.text);
        if (int.parse(coponDiscountController!.text) > 100) {
          showToast("من فضلك قم بإدخال نسبة خصم لا تتعدى 100 %!");
          coponDiscountNode.requestFocus();
          return;
        } else if (int.parse(coponDiscountController!.text) < 0) {
          showToast("من فضلك قم بإدخال نسبة خصم صحيحة!");
          coponDiscountNode.requestFocus();
          return;
        }
      }}

    LoadingDailog().showLoading(context);
    Map<String, dynamic> mymap = {
    // "_method":"PUT",
      "token": "Bearer " + myToken,
      "image": imageCoponMultiPart,
      "code": coponNumberController?.text,
      "name": coponNameController?.text,
      "discount":
      coponDiscountController?.text!=null&&coponDiscountController!.text.isNotEmpty?int.parse(coponDiscountController!.text):null,
      "uses": coponUsesController?.text!=null&&coponUsesController!.text.isNotEmpty?int.parse(coponUsesController!.text):null,
      "link": coponStoreUrlController?.text!=null&&coponStoreUrlController!.text.isNotEmpty?coponStoreUrlController!.text:null,
      "ended_at": endAdvertisingDateCoupon.value,
      "store_name": coponStoreNameController?.text!=null&&coponStoreNameController!.text.isNotEmpty?coponStoreNameController!.text:null,

    };
    Logger().i("mymap"+mymap.toString());
    Repository repo = Repository();
    print("coponId=$coponId");
    repo.postWithImageMultipart<EditCoponsResponse>(
        path: 'copons/${coponId}/edit',
        fromJson: (json) => EditCoponsResponse.fromJson(json),
        json: mymap,
        onSuccess: (res) async {
          //Navigator.of(context).pop();
          Get.back();
          if(res.data!=null){
            Logger().i(res.toJson());
          }
          imageCoponMultiPart = null;
          advertiserCoponspagingController.refresh();
          if (res.message != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('${res.message}', style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Arabic-Regular'),),
            ));
          }
          Navigator.of(context).pop();
          /* Navigator.of(context).pop();
            Get.delete<RequestAdvertiseController>();
            Get.delete<FindAdvertiseController>();*/
          //Get.offAllNamed('/Home');
        },
        onError: (err, res) {
          //Navigator.of(context).pop();
          Get.back();
          Logger().i(err);
        });

    /*String json = jsonEncode(mymap);
    Logger().i(json);*/

/*    String json = jsonEncode(mymap);
    final formData = myDio.FormData.fromMap(

        mymap
    );*/

/*    Map<String, dynamic> mymap = {
      "token": "Bearer " + myToken!,
      "advertiser_id": selectedAdvertiseId,
      "product_category_id": requestAdvertiseController.categoryId,
      "description": requestAdvertiseController.descriptionController.text,
      "ads_type_id": requestAdvertiseController.adTypeId,
      "date_type":
      requestAdvertiseController.isFlixble.isTrue ? "flexible" : "fixed",
      "started_at": requestAdvertiseController.fromDate.value,
      "ended_at": requestAdvertiseController.isFlixble.isTrue
          ? requestAdvertiseController.toDate.value
          : null,
      "offer_ended_at":
      requestAdvertiseController.endAdvertisingDate.value.isNotEmpty
          ? requestAdvertiseController.endAdvertisingDate.value
          : null,
      "repeat_count":
      int.parse(requestAdvertiseController.selectedTimeCounter.value),
      "channels[]": requestAdvertiseController.channelsIds,
      "attachments[]": requestAdvertiseController.imageFideoFiles!.isNotEmpty ? requestAdvertiseController.imageFideoFiles : null,
      "links": requestAdvertiseController.links.value.isNotEmpty
          ? requestAdvertiseController.links.value
          : null,
      "location[name]": requestAdvertiseController.locationModel.name,
      "location[address]": requestAdvertiseController.locationModel.address,
      "location[lat]": requestAdvertiseController.locationModel.lat,
      "location[lng]": requestAdvertiseController.locationModel.lng,
      "copon[image]": requestAdvertiseController.imageCoponMultiPart,
      "copon[code]": requestAdvertiseController.coponNumberController?.text,
      "copon[name]": requestAdvertiseController.coponNameController?.text,
      "copon[discount]":
      requestAdvertiseController.coponDiscountController?.text,
      "copon[uses]": requestAdvertiseController.coponUsesController?.text,
      "copon[link]": requestAdvertiseController.coponLinkController?.text,
      "copon[ended_at]": requestAdvertiseController.endAdvertisingDateCoupon,
      "notes": requestAdvertiseController.noticeController?.text,
      "plan_file": requestAdvertiseController.planFile
    };

    client!.createAdvertiseRequest("application/json","Bearer "+myToken!,advertiser_id: mymap['advertiser_id'],ended_at: mymap['ended_at'],started_at: mymap['started_at'],product_category_id: mymap['product_category_id'],ads_type_id: mymap['ads_type_id'],channelsIdes: mymap['channels[]'],date_type: mymap['date_type'],description: mymap['description'],links: mymap['links'],
      offer_ended_at: mymap['offer_ended_at'],repeat_count: mymap['repeat_count'],attachments: requestAdvertiseController.attatechedFilesImageAndVideo.value.map((e) => e.file!).toList(),).then((value){
      print('mStatus ${value.status}');
      print('mStatus ${value.message}');
      Logger().i(value.data!.toJson());
    });*/

  }
  onActivateClicked(BuildContext context,int id) async {
   // Navigator.of(context).pop();
    Get.back();
    LoadingDailog().showLoading(context);
    myToken = await storage.read("token");
    client!.select_copons(SelectCoponsRequest(copons: [id]), "Bearer "+myToken).then((value){
      Get.back();
      appCoponspagingController.refresh();
      Fluttertoast.showToast(
        msg: 'تم تفعيل الكوبون بنجاح !',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    // Logger().i(value.toJson());
     //Navigator.pop(context);
    });
  }

  onDeActivateClicked(BuildContext context,int id) async {
    //Navigator.of(context).pop();
    Get.back();
    LoadingDailog().showLoading(context);
    myToken = await storage.read("token");
    client!.deselect_copons(SelectCoponsRequest(copons: [id]), "Bearer "+myToken).then((value){
      Get.back();
      appCoponspagingController.refresh();
      Fluttertoast.showToast(
        msg: 'تم تعطيل الكوبون بنجاح !',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0,
      );

     // Logger().i(value.toJson());
      //Navigator.pop(context);
    });
  }

  void showBottomSheetForRequest2(BuildContext context,CoponModelResponse coponModelResponse){
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      //barrierColor: Colors.white,
      /*shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,*/
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          //maxChildSize: 0.8,
          //minChildSize: 100.0,
          //maxChildSize: 0.9,
          initialChildSize: 0.4,
          expand: false,
          builder: (context, scrollController) {
            return ActivateDeactivateSheet(
              scrollController: scrollController,
              coponModelResponse: coponModelResponse,
            );
          },
        );
      },
    );
  }
  void showBottomSheetForRequest(BuildContext context,{CoponModelResponse? coponModelResponse,String? from}){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          //maxChildSize: 0.8,
          //minChildSize: 100.0,
          //maxChildSize: 0.9,
          initialChildSize: 0.67,
          expand: false,
          builder: (context, scrollController) {
            return DiscountCouponSheet(
              scrollController: scrollController,
              coponId: coponModelResponse?.id,
              from:from
            );
          },
        );
      },
    );
  }

  @override
  void onClose() {
    searchController.dispose();

    super.onClose();
  }

  void onAddRequestClicked(BuildContext context) {

    if(imagePathCopon.value.isEmpty){
      showToast("من فضلك قم بإدخال صورة كوبون الخصم !");
      showChoiceImageDialog(context);
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }
    else if(coponNumberController?.text!=null && coponNumberController!.text.isEmpty){
      showToast("من فضلك قم بإدخال رقم كوبون الخصم !");
      coponNumberNode.requestFocus();
      return;
    }/*else if(!isNumericUsingRegularExpression(coponNumberController!.text)){
      showToast("من فضلك قم بإدخال رقم كوبون صحيح !");
      coponNumberNode.requestFocus();
      return;
    }*/else if(coponNameController?.text!=null && coponNameController!.text.isEmpty){
      showToast("من فضلك قم بإدخال اسم كوبون الخصم !");
      coponNameNode.requestFocus();
      return;
    }
    else if(coponDiscountController?.text!=null && coponDiscountController!.text.isEmpty){
      showToast("من فضلك قم بإدخال نسبة الخصم!");
      coponDiscountNode.requestFocus();
      return;
    }else if(!isNumericUsingRegularExpression(coponDiscountController!.text)){
      showToast("من فضلك قم بإدخال نسبة خصم صحيحة!");
      coponDiscountNode.requestFocus();
      return;
    }else if(coponUsesController?.text!=null && coponUsesController!.text.isEmpty){
      showToast("من فضلك قم بإدخال عدد إستخدامات الكوبون !");
      coponUsesNode.requestFocus();
      return;
    }else if(!isNumericUsingRegularExpression(coponUsesController!.text)){
      showToast("من فضلك قم بإدخال عدد إستخدامات الكوبون بشكل صحيح!");
      coponUsesNode.requestFocus();
      return;
    }else if(coponStoreUrlController?.text!=null && coponStoreUrlController!.text.isEmpty){
      showToast("من فضلك قم بإدخال رابط المتجر !");
      coponStroreUrlNode.requestFocus();
      return;
    }else if(!isUrlUsingRegularExpression(coponStoreUrlController!.text)){
      showToast("من فضلك قم بإدخال رابط المتجر المتجر بشكل صحيح!");
      coponStroreUrlNode.requestFocus();
      return;
    }else if(coponStoreUrlController?.text!=null && coponStoreNameController!.text.isEmpty){
      showToast("من فضلك قم بإدخال اسم المتجر !");
      coponStoreNameNode.requestFocus();
      return;
    }else if(endAdvertisingDateCoupon!=null && endAdvertisingDateCoupon.isEmpty){
      showToast("من فضلك قم بإدخال تاريخ إنتهاء الكوبون !");
      onSelectCoponDate(context);
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    } else{
      if(coponDiscountController?.text!=null && coponDiscountController!.text.isNotEmpty) {
        //int.parse(coponDiscountController!.text);
        if (int.parse(coponDiscountController!.text) > 100) {
          showToast("من فضلك قم بإدخال نسبة خصم لا تتعدى 100 %!");
          coponDiscountNode.requestFocus();
          return;
        } else if (int.parse(coponDiscountController!.text) < 0) {
          showToast("من فضلك قم بإدخال نسبة خصم صحيحة!");
          coponDiscountNode.requestFocus();
          return;
        }
      }}

    LoadingDailog().showLoading(context);

    Map<String, dynamic> mymap = {
      // "_method":"PUT",
      "token": "Bearer " + myToken,
      "image": imageCoponMultiPart,
      "code": coponNumberController?.text,
      "name": coponNameController?.text,
      "discount":
      coponDiscountController?.text!=null&&coponDiscountController!.text.isNotEmpty?int.parse(coponDiscountController!.text):null,
      "uses": coponUsesController?.text!=null&&coponUsesController!.text.isNotEmpty?int.parse(coponUsesController!.text):null,
      "link": coponStoreUrlController?.text!=null&&coponStoreUrlController!.text.isNotEmpty?coponStoreUrlController!.text:null,
      "ended_at": endAdvertisingDateCoupon.value,
      "store_name": coponStoreNameController?.text!=null&&coponStoreNameController!.text.isNotEmpty?coponStoreNameController!.text:null,

    };
    Logger().i("mymap"+mymap.toString());
    Repository repo = Repository();
    repo.postWithImageMultipart<EditCoponsResponse>(
        path: 'copons',
        fromJson: (json) => EditCoponsResponse.fromJson(json),
        json: mymap,
        onSuccess: (res) async {
          //Navigator.of(context).pop();
          Get.back();
          if(res.data!=null){
            Logger().i(res.toJson());
          }
          position = -1;
          imageCoponMultiPart = null;
          advertiserCoponspagingController.refresh();
          if (res.message != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('${res.message}', style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Arabic-Regular'),),
            ));
          }
          Navigator.of(context).pop();
          /* Navigator.of(context).pop();
            Get.delete<RequestAdvertiseController>();
            Get.delete<FindAdvertiseController>();*/
          //Get.offAllNamed('/Home');
        },
        onError: (err, res) {
          //Navigator.of(context).pop();
          Get.back();
          Logger().i(err);
        });

  }

  void deleteCopon(BuildContext context, int? id) {
    Get.back();
    LoadingDailog().showLoading(context);
    client!.deleteCopon(id!,"Bearer "+myToken).then((value) {
      print("token");
      //Logger().i(value.status.toString());
      if(value.status==200){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('تم حذف الكوبون بنجاح !', style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Arabic-Regular'),),
        ));
        advertiserCoponspagingController.refresh();

        print("token deleted");
        //Logger().i(value.data.toString());
        Get.back();
      }
    });
  }

  void changeCoponsStatus(BuildContext context, int id) {
    LoadingDailog().showLoading(context);
    client!.changeStatus(id,"Bearer "+myToken).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('تم تغيير حالة الكوبون بنجاح !', style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Arabic-Regular'),),
        ));
        advertiserCoponspagingController.refresh();
        Get.back();
        print("token deleted");
        Logger().i(value.data.toString());
      }
    });
  }

  void shareLink(int? id) {
    client!.shareCopon(id!,"Bearer "+myToken!).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        // Get.back();
        print("token shared");
        Logger().i(value.data.toString());
      }
    });
  }

  void seenCopon(int? id){
    client!.seenCopon(id,"Bearer "+myToken!).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        // Get.back();
        print("copon seen ${id}");
        Logger().i(value.data.toString());
      }
    });
  }
}


class UpperTabItem {
  int? id;
  String? title;
  UpperTabItem({
    this.id,
    this.title
  });
}

List<UpperTabItem>? upperTabItems = [
  UpperTabItem(
      id: 0,
      title: "كوبونات المنصة"
  ),
  UpperTabItem(
      id: 1,
      title: "كوبونات المتاجر"
  ),
];


