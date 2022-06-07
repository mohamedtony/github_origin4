import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:advertisers/app_core/network/models/FileModel.dart';
import 'package:advertisers/app_core/network/models/LinkModel.dart';
import 'package:advertisers/app_core/network/models/LocationModel.dart';
import 'package:advertisers/app_core/network/models/RequestDetailsModel.dart';
import 'package:advertisers/app_core/network/models/TaxSettingsModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/CreateAdvertiseRequestResponse.dart';
import 'package:advertisers/app_core/network/responses/TaxSettingsResponse.dart';
import 'package:advertisers/features/advertiser_details/sheets/advertising_date_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/urls_bottom_sheet.dart';
import 'package:advertisers/features/advertising_story_details/vimo_video/quality_links.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'dart:ui' as ui;
import 'package:location/location.dart' as location;
import 'package:dio/dio.dart' as myDio;
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';
import '../../../main.dart';


class AdvertisingDetailsController extends GetxController with GetTickerProviderStateMixin{

  late TextEditingController couponNumberController;
  late TextEditingController couponNameController;
  late TextEditingController numberOfUseController;
  late TextEditingController storeUrlController;


 // bool? showInPlatform = false;
  String?  myToken;
  // -------------------- for channel sheet  --------------------------------------------
  RxList<Channel> channels = <Channel>[].obs;
  RxList<Channel> channelsForList = <Channel>[].obs;
  List<int> channelsIds = [];
  var isChannelSaveClicked = false.obs;
  //================= for product type dropdown =====================
  var isLoadingTypes = true.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<AdTypeModel> ads_types = <AdTypeModel>[].obs;
  var selectedCategory = CategoryModel().obs;
  var selectedAdType = AdTypeModel().obs;

  int categoryId = -1;
  int adTypeId = -1;
  var showInPlatform = false.obs;
  void switchShowInPlatform (){
    if(showInPlatform.isTrue){
      showInPlatform.value = false;
      endAdvertisingDate.value = '';
    }else{
      showInPlatform.value = true;
    }
  }

  String? dateType;
  // -------------------- for attachement sheet  ----------------------------------------
  RxList<FileModel>  attatechedFilesImageAndVideo =<FileModel>[].obs;
  var isAttachementSaveClicked = false.obs;
  List<myDio.MultipartFile>? imageFideoFiles = [];
  List<File> imageFideoRealFiles = [];
  final ImagePicker _picker = ImagePicker();
  List<XFile>? images2;
  XFile? mVideo;
  late TextEditingController selectedCounterController;
//---------------------- for discount sheet --------------------------------------------
  late XFile xFile ;
  File? imageFile;
  myDio.MultipartFile? imageCoponMultiPart;
  var imagePathCopon = ''.obs;
  var isDiscountSaveClicked = false.obs;
  TextEditingController? coponNumberController,coponNameController,coponDiscountController,coponUsesController,coponLinkController;
  FocusNode coponNumberNode = FocusNode();
  FocusNode coponNameNode = FocusNode();
  FocusNode coponDiscountNode = FocusNode();
  FocusNode coponUsesNode = FocusNode();
  FocusNode coponUrlNode = FocusNode();
  //FocusNode coponUrlNode = FocusNode();
  var coponModel=CoponModelResponse().obs;

  bool isVideo = false;

  final ImagePicker picker = ImagePicker();

  XFile? _selectedImage;


  List<XFileType> attachedImagesList = [];
  List<XFile> multiImageVideoList = [];

  bool get hasSelectedImage => _selectedImage != null;
  XFile? pickedXFile;
  XFile get selectedImage => _selectedImage!;

  removeSelectedImage() {
    _selectedImage = null;
  }

  getImageToAttachedList({@required bool? fromGallery}) async {
    pickedXFile =
    await picker.pickImage(
        source: fromGallery! ? ImageSource.gallery : ImageSource.camera,imageQuality: 20 );
    attachedImagesList.add(
        XFileType(
            file: XFile(pickedXFile!.path),
            isVideo: 0
        )
        );
    update();
  }

  getImageListToAttachedList({@required bool? fromGallery}) async {
    multiImageVideoList.clear();
    multiImageVideoList =
    (await picker.pickMultiImage())!;

    for (var element in multiImageVideoList) {
      attachedImagesList.add(XFileType(
          file: XFile(element!.path),
          isVideo: 0
      ));
    }
    multiImageVideoList.clear();
   // update();
  }

  void deleteCoupon(){
    removeSelectedImage();
    couponNumberController.text = "";
    couponNameController.text = "";
    numberOfUseController.text = "";
    storeUrlController.text = "";
    endAdvertisingDateCoupon.value = "";
    selectedDiscountPercentage = "";
   // update();
  }

  void deleteFromAttachedImagesList(XFileType? xItem){
    attachedImagesList.remove(xItem);
    //update();
  }

  getImage({@required bool? fromGallery}) async {
    pickedXFile = await picker.pickImage(
        source: fromGallery! ? ImageSource.gallery : ImageSource.camera,imageQuality: 20 );
    if (pickedXFile != null) {
      _selectedImage = XFile(pickedXFile!.path);
      // controller.setStateBehavior();
    }
    // hasSelectedImage.;
    print('xXx Original Image: $_selectedImage');
    return _selectedImage;
  }

void setStateBehavior(){
  update();
}

  late TextEditingController descController;
  late TextEditingController noticsController;
  var decriptionText = ''.obs;
  var locationText = ''.obs;
/*  String selectedTimeCounter = '';


  void selectCounter(String? count){
    selectedTimeCounter = "$count";
    update();
  }*/
  String selectedDiscountPercentage = '';


  void selectDiscountPercentage(String? count){
    selectedDiscountPercentage = "$count";
    //update();
  }

   List<int>? checkList = [];


   void addRemoveCheckList(id){
     Channel? channel = channelsForList.value.firstWhereOrNull((element) => element.id==id);
     if(channel!=null){
       //int index = channelsForList.indexWhere((element) => channel.id==element.id);
       channelsForList.removeWhere((element) => element.id==id);
       int index = channels.indexWhere((element) => element.id==id);
       channels[index].isTapped.value = false;
       channelsIds.removeWhere((element) => element==id);
     }
     /*if(channelsForList.value.contains(id)){
       checkList!.remove(id);
     }else{
       checkList!.add(id);
     }*/
    // update();
   }

  bool isChecked = false;
  void changeChecked(){
    if(isChecked == false){
      isChecked = true;
    }else{
      isChecked = false;
    }
   // update();
  }

  var isFlixble = true.obs;
  var isFixed = false.obs;
  var fromAdvertisingDate = '2022-2-10'.obs;
  var dateRange = DateRange().obs;
  var fromDate = ''.obs;
  var toDate = ''.obs;
  var isDateSaveClicked  = false.obs;
  void addDateRange(String? fromDate,toDate){
    dateRange.value = DateRange(fromDate: fromDate,toDate: toDate) ;
    this.fromDate.value = fromDate!;
    this.toDate.value = toDate!;
    //endAdvertisingDate.value = toDate;
  }
  var selectedTimeCounter = '1'.obs;


  void selectCounter(String? count){
    selectedTimeCounter.value = "$count";
  }
  var endAdvertisingDateCoupon = ''.obs;
  var endAdvertisingDate = ''.obs;
  void addendAdvertisingDate(String? endDate){
    endAdvertisingDate.value = endDate!;
  }
  void addAdvertisingFromDate(String? fromDate){
    fromAdvertisingDate.value = fromDate!;
    this.fromDate.value = fromDate;
  }
  void addendAdvertisingDateCoupon(String? endDate){
    endAdvertisingDateCoupon.value = endDate!;
  }
  void onDateClickedSaved(BuildContext context) {

    print("savedClicked");
    print("repeated= "+selectedTimeCounter.toString());
    try{
      if(isFlixble.isTrue){
        if((dateRange.value.fromDate ==null || (dateRange.value.fromDate!=null && dateRange.value.fromDate!.isEmpty))){
          showToast("من فضلك يرجى إختيار تاريخ الاعلان !");
          return;
        }else if( dateRange.value.toDate == null || (dateRange.value.toDate!=null && dateRange.value.toDate!.isEmpty)){
          showToast("من فضلك يرجى إختيار  تاريخ الاعلان !");
          return;
        }
      }
      if(isFixed.isTrue && fromAdvertisingDate.value=='2022-2-10'){
        showToast("من فضلك يرجى إختيار تاريخ الاعلان !");
        return;
      }else if(isFlixble.isTrue && (selectedCounterController.text.isEmpty)){
        showToast("من فضلك يرجى إدخال عدد مرات الاعلان !");
        return;
      }else if(isFlixble.isTrue &&  (selectedCounterController.text.isNotEmpty && !isNumericUsingRegularExpression(selectedCounterController.text))){
        showToast("من فضلك يرجى إدخال عدد مرات الاعلان بشكل صحيح !");
        return;
      }else if(isFlixble.isTrue && (selectedCounterController.text.isNotEmpty && int.parse(selectedCounterController.text)<=0)){
        showToast("من فضلك يرجى إدخال عدد مرات الاعلان بشكل صحيح !");
        return;
      }else if(showInPlatform.isTrue && endAdvertisingDate.isEmpty){
        showToast("من فضلك يرجى إختيار تاريخ انتهاء مدة العرض فى المنصة!");
        return;
      }else{
        if(endAdvertisingDateCoupon.isNotEmpty&& fromDate.value.isNotEmpty){
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
        }
        print("after_return");
        if(isFlixble.isTrue) {
          dateType ="flixible";
        }else{
          dateType ="fixed";
        }
        isDateSaveClicked.value = true;

        if(isFixed.isTrue) {
          selectedTimeCounter.value = "1";
        }

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("تم حفظ تاريخ الاعلان بنجاح !",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));

        Navigator.pop(context);
      }}catch(e){
      print(e);
    }
  }

  void onSelectedDateEndedAtPlateform(BuildContext context){
    DateTime selectedDate;
    if(endAdvertisingDate.isNotEmpty){
      print("myDate"+endAdvertisingDate.value);
      DateTime endAdvertisingDateCouponDate = DateTime.parse(endAdvertisingDate.value);
      selectedDate = endAdvertisingDateCouponDate;
    }else{
      selectedDate = (DateTime.now()).add( Duration(days: 1));
    }
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate:selectedDate,
          firstDate: (DateTime.now()),
          lastDate:
          (DateTime.now()).add(const Duration(days: 600)));
      // if (picked != null && picked != selectedDate)
      if (picked != null && picked != selectedDate) {
        addendAdvertisingDate(dateFormat.format(picked));
        // controller.endAdvertisingDate = dateFormat.format(picked);
      }
      // selectedDate = picked;
    }

    _selectDate(context);
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

  // late TextEditingController searchController;
  var search='';

  void changeTabIndex(int indexCome,bool isTap) {
    print("incomIndex= "+indexCome.toString());
    if(channels.value[indexCome].isTapped.value==true){
      channels.value[indexCome].isTapped.value=false;
     // channelsIds.removeWhere((element) => element==channels.value[indexCome].id);
     // channels.value.removeWhere((element) => element.id == channels.value[indexCome].id);
      channelsForList.removeWhere((element) => element.id==channels.value[indexCome].id);
      channelsIds.removeWhere((element) => element==channels.value[indexCome].id);
    }else{
      channels.value[indexCome].isTapped.value=true;
      channelsIds.add(channels.value[indexCome].id!);
      Channel? channel = channelsForList.value.firstWhereOrNull((element) => element.id==channels.value[indexCome].id,);
      if(channel == null){
        channelsForList.add(channels.value[indexCome]);
      }
    }
  }

  void onSaveChannelsClicked(BuildContext context) {
    Logger().i(channelsIds);
    Logger().i("categoryId= ",categoryId);
    Logger().i("typeId= ",adTypeId);
    Get.back();
    if(channelsIds.isNotEmpty) {
      isChannelSaveClicked.value = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("تم حفظ قنوات الاعلان بنجاح !", style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'Arabic-Regular'),),
      ));
    }
  }
  //---------------------- for urls page ------------------------------------------------
  RxList<LinkModel> links = <LinkModel>[].obs;
  var numOfLinks = 0.obs;
  var isUrlSaveClicked = false.obs;
  List<TextEditingController> textUrlControllers = [];
  List<TextEditingController> urlControllers = [];

  List<AnimationController> animationControllers = <AnimationController>[].obs;
  RxList<Animation<Offset>> animationTextFields = <Animation<Offset>>[].obs;
  RxList<Animation<Offset>> animationsClose = <Animation<Offset>>[].obs;
  RxList<LinkModel> urlList = <LinkModel>[].obs;

 /* void addToUrlList(){
    urlList!.add(
        UrlDataType(
            id: urlList!.length + 1,
            urlTitle: "",
            urlName: ""
        )
    );
    update();
  }*/

  void removeFromUrlList(LinkModel? item,int? index){
    print("mIndex=>$index");
    urlList.value.remove(item!);

    print("mIndex=>${urlList.length}");
    deleteLink(index!);
   // update();
  }
  void deleteLink(int index) {
    print(index);
    if(links.value.length>0) {
      links.value.removeAt(index);
    }
    if(textUrlControllers.length>0) {
      textUrlControllers.removeAt(index);
    }
    if(urlControllers.length>0) {
      urlControllers.removeAt(index);
    }
    if(animationControllers.length>0) {
      animationControllers.removeAt(index);
    }
    if(animationTextFields.length>0) {
      animationTextFields.value.removeAt(index);
    }
    if(animationsClose.value.length>0) {
      animationsClose.value.removeAt(index);
    }
    numOfLinks.value --;
    /* List<TextEditingController> textUrlControllers = [];
    List<TextEditingController> urlControllers = [];

    List<AnimationController> animationControllers = [];
    List<Animation<Offset>> animationTextFields = [];
    List<Animation<Offset>> animationsClose = [];*/
  }
  void disposeAnimation() {
    animationControllers.add(AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    ));

    animationTextFields.add(Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.2, 0.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: animationControllers[0],
      ),
    ));

    animationsClose.value.add(Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent:  animationControllers[0],
      ),
    ));
  }

  //---------------------- for map sheet ========================
  late TextEditingController placeNameController;
  late TextEditingController placeAddressController;
  late Completer<GoogleMapController> mapController;
  late GoogleMapController googleMapController;
  BitmapDescriptor? pinLocationIcon;
  late Uint8List markerIcon;
  @override
  Future<void> onInit() async {
    // passIndex;
    placeNameController = TextEditingController();
    placeAddressController = TextEditingController();
    descController=TextEditingController();

    couponNumberController=TextEditingController();
    couponNameController=TextEditingController();
    numberOfUseController=TextEditingController();
    storeUrlController=TextEditingController();
    coponNumberController=  TextEditingController();
    coponNameController=  TextEditingController();
    coponDiscountController=  TextEditingController();
    coponUsesController=  TextEditingController();
    coponLinkController=  TextEditingController();
    noticeController = TextEditingController();
    selectedCounterController = TextEditingController(text: '1');

    myToken  = await storage.read("token");
    mapController = Completer();
    setCustomMapPin();
    markerIcon = await getBytesFromAsset('images/location_icon.png', 70);

    //---------------------- for urls page ------------------------------------------------
    /*textUrlControllers.add(TextEditingController());
    urlControllers.add(TextEditingController());
    animationControllers.add(AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    ));

    animationTextFields.add(Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.2, 0.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: animationControllers[0],
      ),
    ));

    animationsClose.add(Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent:  animationControllers[0],
      ),
    ));
*/
    super.onInit();
    //if( Get.parameters['requestId']!=null) {

   // }
    EasyLoading.show();
    //  var myToken  = await storage.read("token");
    client!.getProductsAndAdsTypes("Bearer "+myToken!).then((value) async {
      if(value.data!=null) {
        Logger().i(value.data?.toJson());
      }
      if(value.data!=null&&value.status==200){
        //Get.back();

        if(value.data!=null) {
          if(value.data!.product_types!=null) {
            categories.value = value.data!.product_types!;
            categories.value.insert(0, CategoryModel(id: -1,name: 'اختر'));

          }
          if(value.data!.ads_types!=null) {
            ads_types.value = value.data!.ads_types!;
            ads_types.value.insert(0, AdTypeModel(id: -1,name: 'اختر'));
          }
          if(value.data!.channels!=null && value.data!.channels!.isNotEmpty) {
            channels.value = value.data!.channels!;
            //channelsForList.value = value.data!.channels!;
            /*value.data!.channels!.asMap().forEach((index,element) {
              channels.value[index].isTapped.value = true;
            });*/
            if(Get.parameters['requestId']!=null && Get.parameters['requestId']!.isNotEmpty) {
              await getRequestDetails(int.parse(Get.parameters['requestId']!));
            }

          }
        }
        isLoadingTypes.value = false;
      }
    });

  }
  Future<void> deleteLinkApi(LinkModel linkModel,int index,int? link_id) async {
    print("MyId"+link_id.toString());
    EasyLoading.show();
   // myToken = await storage.read("token");
    client!.deleteLink(requestDetailsModel.value.id, link_id, "Bearer $myToken").then((value){
      if(value.status!=null && value.status==200 ){
        print("deleteSucess");
        removeFromUrlList(linkModel,index);
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
      }
    });
  }
  var requestDetailsModel = RequestDetailsModel().obs;
  Future<void> getRequestDetails(int? parameter) async {
    print("MyId"+parameter.toString());
    //myToken = await storage.read("token");
    client!.getRequestDetail(parameter, "Bearer $myToken").then((value){
      if(value.status==200 && (value.data)!=null){
        requestDetailsModel.value = value.data!;
        Logger().i(value.data!.toJson());
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        if((requestDetailsModel.value.product_type)!=null) {
          selectedCategory.value = requestDetailsModel.value.product_type!;
        }
        if((selectedCategory.value.id)!=null) {
          categoryId = selectedCategory.value.id!;
        }
        if((requestDetailsModel.value.ads_type)!=null){
          selectedAdType.value = requestDetailsModel.value.ads_type!;
          adTypeId= selectedAdType.value.id!;
        }

        if((value.data?.date_type)!=null) {
          dateType = value.data?.date_type;
          if(value.data?.date_type=="fixed"){
             isFixed.value = true;
             isFlixble.value = false;
          }else{
            isFixed.value = false;
            isFlixble.value = true;
          }
        }
        if((value.data?.description)!=null && value.data!.description!.isNotEmpty) {
          print("descController"+value.data!.description!);
          decriptionText.value = value.data!.description!;
          descController.text = value.data!.description!;
        }
        if((value.data?.links)!=null && (value.data?.links?.length)!=null && (value.data?.links!.length)! > 0){
          //print("descController"+value.data!.links![0].toString());
          urlList.value = value.data!.links!;
          numOfLinks.value = value.data!.links!.length;

          value.data?.links?.asMap().forEach((index,element) {
            textUrlControllers.add(TextEditingController(text: element.name));
            urlControllers.add(TextEditingController(text: element.link));
            animationControllers.add(AnimationController(
              vsync: this,
              duration: const Duration(milliseconds: 200),
            ));

            animationTextFields.add(Tween(
              begin: const Offset(0.0, 0.0),
              end: const Offset(0.2, 0.0),
            ).animate(
              CurvedAnimation(
                curve: Curves.decelerate,
                parent: animationControllers[index],
              ),
            ));

            animationsClose.value.add(Tween(
              begin: const Offset(0.0, 0.0),
              end: const Offset(1.0, 0.0),
            ).animate(
              CurvedAnimation(
                curve: Curves.decelerate,
                parent:  animationControllers[index],
              ),
            ));
          });


         // numOfLinks.value=1;
         /* value.data!.links?.forEach((element) {
            textUrlControllers.add(TextEditingController(text: element.name));
            urlControllers.add(TextEditingController(text: element.link));
            animationControllers.add(AnimationController(
              vsync: this,
              duration: const Duration(milliseconds: 200),
            ));

            animationTextFields.add(Tween(
              begin: const Offset(0.0, 0.0),
              end: const Offset(0.2, 0.0),
            ).animate(
              CurvedAnimation(
                curve: Curves.decelerate,
                parent: animationControllers[0],
              ),
            ));

            animationsClose.value.add(Tween(
              begin: const Offset(0.0, 0.0),
              end: const Offset(1.0, 0.0),
            ).animate(
              CurvedAnimation(
                curve: Curves.decelerate,
                parent:  animationControllers[0],
              ),
            ));
          });*/


          /*value.data?.links?.asMap().forEach((index,element) {
            if(index==0){
              textUrlControllers.add(TextEditingController(text: element.name));
              urlControllers.add(TextEditingController(text: element.link));
            }else {
              insertNewLinkFields(textUrl: element.name, url: element.link);
            }
          });*/

        }
        if((value.data?.address)!=null){
          if((value.data?.address?.name)!=null && (value.data!.address!.name!.isNotEmpty)) {
            placeNameController.text = value.data!.address!.name!;
          }
          if((value.data?.address?.address)!=null && (value.data!.address!.address!.isNotEmpty)) {
            placeAddressController.text = value.data!.address!.address!;
            locationText.value = value.data!.address!.address!;
          }
          if((value.data?.address?.address)!=null && (value.data!.address!.address!.isNotEmpty)) {
            placeAddressController.text = value.data!.address!.address!;
          }

            locationModel.value = value.data!.address!;

          if(locationModel.value.lng!=null && locationModel.value.lat!=null) {
            if (mapController.isCompleted) {
              onMapClicked(position: LatLng(
                  double.parse(locationModel.value.lat!),
                  double.parse(locationModel.value.lng!)));
            }
          }
        }
        if(value.data!=null){
          Logger().i(value.data!.toJson());
        }

        if((value.data?.channels)!=null && (value.data?.channels?.length)!=null && (value.data!.channels!.length) >0 &&value.data!.channels!.isNotEmpty) {
          channelsForList.value = value.data!.channels!;
          value.data!.channels!.forEach((element) {
            channelsIds.add(element.id!);
          });
         // List<Channel> tempChannels = [];
          value.data?.channels?.forEach((element) {
            int? ind = channels.indexWhere((element2) => element2.id == element.id);
            print(" ind= "+ind.toString()+" "+channels.length.toString());
            if(ind!=null && ind>=0){
              channels.value[ind].isTapped.value = true;
            }
          });

        }

        if(value.data?.copon!=null){
          if((value.data?.copon?.image)!=null && value.data!.copon!.image!.isNotEmpty) {
            imagePathCopon.value = value.data!.copon!.image!;
          }

          if((value.data?.copon?.code)!=null && value.data!.copon!.code!.isNotEmpty) {
            coponNumberController!.text = value.data!.copon!.code!;
          }

          if((value.data?.copon?.name)!=null && value.data!.copon!.name!.isNotEmpty) {
            coponNameController!.text = value.data!.copon!.name!;
          }

          if((value.data?.copon?.discount)!=null) {
            coponDiscountController!.text =
                value.data!.copon!.discount!.toString();
          }

          if((value.data?.copon?.uses)!=null ) {
            coponUsesController!.text = value.data!.copon!.uses!.toString();
          }

          if((value.data?.copon?.ended_at)!=null && value.data!.copon!.ended_at!.isNotEmpty) {
            endAdvertisingDateCoupon.value =
                value.data!.copon!.ended_at!.toString();
          }

          if((value.data?.copon?.link)!=null && value.data!.copon!.link!.isNotEmpty) {
            coponLinkController!.text = value.data!.copon!.link!.toString();
          }


        }

        if((value.data?.notes)!=null && value.data!.notes!.isNotEmpty) {
          noticeController!.text = value.data!.notes!;
          noticeText.value =  value.data!.notes!;
        }
        if((value.data?.started_at)!=null && value.data!.started_at!.isNotEmpty){
          fromDate.value = value.data!.started_at!;
          dateRange.value.fromDate = value.data!.started_at!;
          fromAdvertisingDate.value = value.data!.started_at!;
        }
        if((value.data?.ended_at)!=null && value.data!.ended_at!.isNotEmpty){
          toDate.value = value.data!.ended_at!;
          dateRange.value.toDate = value.data!.ended_at!;
        }
        if(value.data?.attachments!=null && value.data!.attachments!.isNotEmpty){
          value.data?.attachments?.forEach((element) async {
            //element.type="video";
            if(element.type=="video" && element.video_id!=null) {

            /*  final fileName = await VideoThumbnail.thumbnailFile(
                  video: '_qualityValue',
                  thumbnailPath: (await getTemporaryDirectory()).path,
            imageFormat: ImageFormat.PNG,
            maxHeight: 64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
            quality: 75,
            );*/


              QualityLinks _quality = QualityLinks(element.video_id);

              //Initializing video controllers when receiving data from Vimeo
              _quality.getQualitiesSync("advertiser",id:element.id).then((value) async {
                String _qualityValue = value[value.lastKey()];
                print("url=" + _qualityValue.toString());

                /*attatechedFilesImageAndVideo.add(FileModel(
                    urlVideoLink: _qualityValue,link: element.path,
                    isVideo: element.type == "image" ? false : true));

                Map<String, dynamic> mymap3={
                  "videLinkes": attatechedFilesImageAndVideo,
                };

                FlutterBackgroundService().invoke("setAsForeground",mymap3);


                final fileName = await VideoThumbnail.thumbnailFile(
                    video: _qualityValue,
                    thumbnailPath: (await getTemporaryDirectory()).path,
                imageFormat: ImageFormat.PNG,
                maxHeight: 64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
                quality: 75,
                );

                attatechedFilesImageAndVideo.add(FileModel(
                    urlVideoLink: fileName,link: element.path,
                    isVideo: element.type == "image" ? false : true));*/
              });
            }else{
              attatechedFilesImageAndVideo.add(
                  FileModel(link: element.path,
                  isVideo: element.type == "image" ? false : true,
                    type:"net",
                    id: element.id
                  ));
            }
          });

        }

        if((value.data?.copon)!=null && (value.data?.copon?.code)!=null ){
          coponModel.value = value.data!.copon!;
        }

        if((value.data?.repeat_count)!=null){
          selectedTimeCounter.value = value.data!.repeat_count!.toString();
          selectedCounterController.text = value.data!.repeat_count!.toString();
        }
      }else{
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
      }
    });
  }

  String? validatePhone(String phone){
    if (phone.isEmpty){

    }
    return null;
  }

//================================== url sheet ==========================================
  void insertNewLinkFields({String? textUrl,String? url}){
    if(numOfLinks.value==0){
      textUrlControllers.add(TextEditingController(text: textUrl ));
      urlControllers.add(TextEditingController(text: url));
      animationControllers.add(AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      ));

      animationTextFields.add(Tween(
        begin: const Offset(0.0, 0.0),
        end: const Offset(0.2, 0.0),
      ).animate(
        CurvedAnimation(
          curve: Curves.decelerate,
          parent: animationControllers[numOfLinks.value],
        ),
      ));

      animationsClose.value.add(Tween(
        begin: const Offset(0.0, 0.0),
        end: const Offset(1.0, 0.0),
      ).animate(
        CurvedAnimation(
          curve: Curves.decelerate,
          parent:  animationControllers[numOfLinks.value],
        ),
      ));
      numOfLinks.value ++;
    }
    else if(textUrlControllers[numOfLinks.value-1].text.isNotEmpty && urlControllers[numOfLinks.value-1].text.isNotEmpty){
      textUrlControllers.add(TextEditingController());
      urlControllers.add(TextEditingController());
      animationControllers.add(AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      ));

      animationTextFields.add(Tween(
        begin: const Offset(0.0, 0.0),
        end: const Offset(0.2, 0.0),
      ).animate(
        CurvedAnimation(
          curve: Curves.decelerate,
          parent: animationControllers[numOfLinks.value],
        ),
      ));

      animationsClose.value.add(Tween(
        begin: const Offset(0.0, 0.0),
        end: const Offset(1.0, 0.0),
      ).animate(
        CurvedAnimation(
          curve: Curves.decelerate,
          parent:  animationControllers[numOfLinks.value],
        ),
      ));
      numOfLinks.value ++;
    }else{
      Fluttertoast.showToast(
        msg: 'يجب ملئ كافة العناصر اولا !',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.6),
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }
  void onSaveUrlsClicked(BuildContext context,String type) {
    if(numOfLinks.value==0){
      Get.back();
    }
    else if(textUrlControllers[numOfLinks.value-1].text.isNotEmpty && urlControllers[numOfLinks.value-1].text.isNotEmpty){
      isUrlSaveClicked.value = true;
      //Get.back();
      urlList.value = [];
      links.value = [];
      for(int i=0;i<numOfLinks.value;i++){
        links.add(LinkModel(name: textUrlControllers[i].text,link: urlControllers[i].text));
        urlList.add(LinkModel(name: textUrlControllers[i].text,link: urlControllers[i].text));
      }
      onEditRequestClicked(context,type);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم حفظ الروابط بنجاح !",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
    }else{
      Fluttertoast.showToast(
        msg: 'يجب ملئ كافة العناصر اولا !',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.6),
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }


  //===================== for location sheet =================
  LatLng? latLng;
  Future<void> onMapClicked({LatLng? position}) async {
    latLng = position;
    addMarker(position);
  }
  var marker = new Set<Marker>().obs;
  double? lastMarkerColor;
  double? currentMarkerColor;
  Future addMarker(LatLng? onValue) async{
    marker.clear();
    var point = Marker(
      markerId: MarkerId("2"),
      position: onValue!,
      draggable: false,
      icon: BitmapDescriptor.fromBytes(markerIcon),
    );
    marker.add(point);
    Timer(Duration(milliseconds: 500), () async {
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: onValue,zoom: 16.5,bearing: 11.0,tilt: 16.0)));
    });
  }
  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 5),
        'images/location_icon.png');
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  getLocation() async {
    location.Location myLocation = new location.Location();

    bool _serviceEnabled;
    location.PermissionStatus _permissionGranted;
    location.LocationData _locationData;

    _serviceEnabled = await myLocation.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await myLocation.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await myLocation.hasPermission();
    if (_permissionGranted == location.PermissionStatus.denied) {
      _permissionGranted = await myLocation.requestPermission();
      if (_permissionGranted != location.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await myLocation.getLocation();
    print("myLocation${_locationData.latitude}");
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(_locationData.latitude!, _locationData.longitude!),zoom: 15),
      ),
    );
  }
  var isLocationClickedSaved = false.obs;
  var locationModel = LocationModel().obs;
  void onLocationClickedSaved (BuildContext context) {
    if(placeNameController.text!=null && placeNameController.text.isEmpty){
      showToast("من فضلك يرجى إضافة اسم المكان !");
      return;
    } else if(placeAddressController.text!=null && placeAddressController.text.isEmpty){
      showToast("من فضلك يرجى إضافة عنوان المكان !");
      return;
    }else if(latLng==null){
      showToast("من فضلك يرجى إختيار عنوان من الخريطة !");
      return;
    }
    isLocationClickedSaved.value = true;
    locationModel.value = LocationModel(name: placeNameController.text,address: placeAddressController.text,lat: latLng!.latitude.toString(),lng: latLng!.longitude.toString());
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم حفظ تفاصيل العنوان بنجاح!",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
    Get.back();
  }
//================================== dicount sheet ==========================================
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
        imageCoponMultiPart = await myDio.MultipartFile.fromFile(value.path,
            filename: value.path
                .split(Platform.pathSeparator)
                .last);
      });
    }
    Navigator.pop(context);
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
    }else if(coponLinkController?.text!=null && coponLinkController!.text.isEmpty){
      showToast("من فضلك قم بإدخال رابط المتجر !");
      coponUrlNode.requestFocus();
      return;
    }else if(!isUrlUsingRegularExpression(coponLinkController!.text)){
      showToast("من فضلك قم بإدخال رابط المتجر المتجر بشكل صحيح!");
      coponUrlNode.requestFocus();
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
      if(endAdvertisingDateCoupon.isNotEmpty&& fromDate.value.isNotEmpty){
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
      }

      isDiscountSaveClicked.value = true;
      coponModel.value = CoponModelResponse(id: coponModel.value.id,image: imagePathCopon.value,code: coponNumberController?.text,name: coponNameController?.text,discount: int.parse(coponDiscountController!.text),uses: int.parse(coponUsesController!.text),link: coponLinkController!.text,ended_at: endAdvertisingDateCoupon.value,);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم حفظ بيانات الكوبون بنجاح !",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
      Get.back();
    }

  }
  /*void onDiscountCoponSaveClicked(BuildContext context) {

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
    }else if(coponNameController?.text!=null && coponNameController!.text.isEmpty){
      showToast("من فضلك قم بإدخال اسم كوبون الخصم !");
      coponNameNode.requestFocus();
      return;
    }
    else if(coponDiscountController?.text!=null && coponDiscountController!.text.isEmpty){
      showToast("من فضلك قم بإدخال نسبة الخصم!");
      coponDiscountNode.requestFocus();
      return;
    }else if(coponUsesController?.text!=null && coponUsesController!.text.isEmpty){
      showToast("من فضلك قم بإدخال عدد إستخدامات الكوبون !");
      coponUsesNode.requestFocus();
      return;
    }else if(coponLinkController?.text!=null && coponLinkController!.text.isEmpty){
      showToast("من فضلك قم بإدخال رابط المتجر !");
      coponUrlNode.requestFocus();
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
        }else if(int.parse(coponDiscountController!.text)<100){
          showToast("من فضلك قم بإدخال نسبة خصم صحيحة!");
          coponDiscountNode.requestFocus();
          return;
        }
      }
      if(endAdvertisingDateCoupon.isNotEmpty&& fromDate.value.isNotEmpty){
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
      }

      isDiscountSaveClicked.value = true;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم حفظ بيانات الكوبون بنجاح !",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
      Get.back();
    }

  }*/

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
          firstDate:selectedDate,
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



  //================================== attatchement sheet ===============================
  void deleteImage(int index){
    if(attatechedFilesImageAndVideo[index]!=null){
      if(attatechedFilesImageAndVideo[index].type=="gallery"){
        attatechedFilesImageAndVideo.removeAt(index);
        imageFideoFiles?.removeAt(index);
        imageFideoRealFiles.removeAt(index);
        imageFideoFilesPathStr?.removeAt(index);
      }else{
        deleteFileApi(index,attatechedFilesImageAndVideo[index].id);
      }
    }

  }
  Future<void> deleteFileApi(int index,int? file_id) async {
    print("MyId"+file_id.toString());
    EasyLoading.show();
    // myToken = await storage.read("token");
    client!.deleteFile(requestDetailsModel.value.id, file_id, "Bearer $myToken").then((value){
      if(value.status!=null && value.status==200 ){
        print("deleteSucess");
        attatechedFilesImageAndVideo.removeAt(index);
        //imageFideoFiles?.removeAt(index);
        //imageFideoRealFiles.removeAt(index);
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
      }
    });
  }

  Future<void> showChoiceImageOrVideoDialogForAttatchement(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("إختر",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: () async {
                  Navigator.pop(context);
                  await pickImagesOrVideos();
                },
                title: Text("معرض الصور"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: () async {
                  //getVideoToAttachedList(fromGallery: false) ;
                  Navigator.pop(context);
                  await showChoiceCamera(context);

                },
                title: Text("الكاميرا"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }
  Future<void> showChoiceCamera(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("إختر",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: () async {
                  Navigator.pop(context);
                  takeImage();
                },
                title: Text("صورة"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: ()async{
                  //getVideoToAttachedList(fromGallery: false) ;
                  Navigator.pop(context);
                  await getVideoToAttachedList(fromGallery: false);

                },
                title: Text("فيديو"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }
  Future<void> showChoiceImageDialogForAttatchement(BuildContext context)
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
                  Navigator.pop(context);
                  pickImages();

                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  Navigator.pop(context);
                  takeImage();

                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }


  Future<void> takeImage() async {
    XFile? imageFromFamera = await _picker.pickImage(source: ImageSource.camera,);
    if(imageFromFamera!=null){
      print("imagemm"+images2.toString());
      File file = File(imageFromFamera.path);
      attatechedFilesImageAndVideo.add(
          FileModel(
              file:file,
              isVideo:false,
              type:"gallery"
          )
      );
      await compressFile(file).then((value) async {
        var mFile =  await myDio.MultipartFile.fromFile(value.path,
            filename: value.path
                .split(Platform.pathSeparator)
                .last);
        imageFideoFiles?.add(mFile);
        imageFideoFilesPathStr?.add(value.path);
        imageFideoRealFiles.add(value);
      });
    }

  }

  Future<void> pickImagesOrVideos() async {
/*    XFile? imageFromFamera = await _picker.pickImage(source: ImageSource.camera);
    if(imageFromFamera!=null){
      print("imagemm"+images2.toString());
      attatechedFilesImageAndVideo.add(
          FileModel(
              file:File(imageFromFamera.path),
              isVideo:false
          )
      );
    }*/

    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom,allowMultiple: true,allowCompression: true,allowedExtensions: ['mp4','mov','m4v','jpg','jpeg','png']);

    result?.files.forEach((element) {
      print("exte= "+element.extension!);
      print("size= "+element.size.toString()+" ");
    });
    if (result != null) {
      //List<File> files = result.paths.map((path) => File(path!)).toList();
      result.files.forEach((element) async {
        print("exte= "+element.extension!);
        if(element.extension?.toLowerCase()=="mp4" || element.extension?.toLowerCase()=="mov" || element.extension?.toLowerCase()=="m4v"){
          File videoFile = File(element.path!);
          attatechedFilesImageAndVideo.add(
              FileModel(
                  file:videoFile,
                  isVideo:true,
                  type:"gallery"
              )
          );
          var mFile =  await myDio.MultipartFile.fromFile(videoFile.path,
              filename: videoFile.path
                  .split(Platform.pathSeparator)
                  .last);
          imageFideoFiles?.add(mFile);
          imageFideoFilesPathStr?.add(videoFile.path);
          imageFideoRealFiles.add(videoFile);
          /*print("videoLength= "+videoFile.lengthSync().toString());
           await compressVideo(videoFile).then((value) async {
            print("videoLengthIn= "+value.lengthSync().toString());
            var mFile =  await myDio.MultipartFile.fromFile(value.path,
                filename: value.path
                    .split(Platform.pathSeparator)
                    .last);
            imageFideoFiles?.add(mFile);
          });*/

        }else if(element.extension?.toLowerCase()=="jpg"||element.extension?.toLowerCase()=='png'||element.extension?.toLowerCase()=='jpeg'){
          attatechedFilesImageAndVideo.add(
              FileModel(
                  file:File(element.path!),
                  isVideo:false,
                  type:"gallery"
              )
          );
          compressFile(File(element.path!)).then((value) async {
            var mFile =  await myDio.MultipartFile.fromFile(value.path,
                filename: value.path
                    .split(Platform.pathSeparator)
                    .last);
            imageFideoFiles?.add(mFile);
            imageFideoFilesPathStr?.add(value.path);
            imageFideoRealFiles.add(value);
          });
        }
      });
      /*files.forEach((element) {
        element.ex
        attatechedFilesImageAndVideo.add(
            FileModel(
                file:File(element.path),
                isVideo:false
            )
        );
      });*/
    } else {
      // User canceled the picker
    }

  }
  Future<File> compressVideo(File file) async {
    MediaInfo? mediaInfo = await VideoCompress.compressVideo(
      file.path,
      quality: VideoQuality.LowQuality,
      deleteOrigin: false, // It's false by default
    );
    return mediaInfo!.file!;
  }
  Future<void> pickImages() async {
    images2 = await _picker.pickMultiImage();
    if(images2!=null && images2!.isNotEmpty){
      print("imagemm"+images2.toString());
      //attatechedFilesImageAndVideo.value=[];

      images2?.forEach((element) async {
        File file = File(element.path);
        attatechedFilesImageAndVideo.add(
            FileModel(
                file:file,
                isVideo:false,
                type:"gallery"
            )
        );
        compressFile(file).then((value) async {
          var mFile =  await myDio.MultipartFile.fromFile(value.path,
              filename: value.path
                  .split(Platform.pathSeparator)
                  .last);
          imageFideoFiles?.add(mFile);
          imageFideoFilesPathStr?.add(value.path);
          imageFideoRealFiles?.add(value);
        });
      });
    }

  }

  Future<void> getVideoToAttachedList({@required bool? fromGallery}) async {
    mVideo =
    await _picker.pickVideo(
      source: fromGallery! ? ImageSource.gallery : ImageSource.camera,);
    File videoFile= File(mVideo!.path);
    attatechedFilesImageAndVideo.add(FileModel(
        file: videoFile,
        isVideo: true,
        type:"gallery"
    ));
    var mFile =  await myDio.MultipartFile.fromFile(videoFile.path,
        filename: videoFile.path
            .split(Platform.pathSeparator)
            .last);
    imageFideoFiles?.add(mFile);
    imageFideoFilesPathStr?.add(videoFile.path);
    imageFideoRealFiles?.add(videoFile);
    /*print("videoLength= "+videoFile.lengthSync().toString());
     compressVideo(videoFile).then((value) async {
      print("videoLengthIn= "+value.lengthSync().toString());
      var mFile =  await myDio.MultipartFile.fromFile(value.path,
          filename: value.path
              .split(Platform.pathSeparator)
              .last);
      imageFideoFiles?.add(mFile);
    });*/
  }
  void onSaveAttachmentClicked(BuildContext context) {
    Logger().i(attatechedFilesImageAndVideo);
    isAttachementSaveClicked.value = true;
    Get.back();
    onEditRequestClicked(context,'');
    /*if(attatechedFilesImageAndVideo.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("تم حفظ المرفقات بنجاح !", style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'Arabic-Regular'),),
      ));
    }*/
  }
  //========================= notice sheet ===============
  //---------------------- for notice sheet --------------------------------------------
  late TextEditingController? noticeController;
  var isNoticeSaveClicked = false.obs;
  var isDescSaveClicked = false.obs;
  var noticeText = ''.obs;
  var addressText = ''.obs;

  void onNoticeSavedClicked(BuildContext context) {
    if(noticeController?.text!=null && noticeController!.text.isEmpty){
      showToast("من فضلك يرجى إضافة ملاحظة !");
      return;
    }
    isNoticeSaveClicked.value = true;
    noticeText.value = noticeController!.text;
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم حفظ الملاحظة بنجاح !",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
    Get.back();
  }
  @override
  void onClose() {
    descController.dispose();
    print("onCloseCalled");
    Get.delete<AdvertisingDetailsController>();
    super.onClose();
  }

  Future<void> resetClicked(BuildContext context) async {
    if(Get.parameters['requestId']!=null && Get.parameters['requestId']!.isNotEmpty){
      EasyLoading.show();
      //  var myToken  = await storage.read("token");
      await getRequestDetails(int.parse(Get.parameters['requestId']!));
    }

  }

  void onEditRequestClicked(BuildContext context,String type) {

      if (selectedCategory.value.id == -1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "يجب اختيار نوع المنتج !",
              style: TextStyle(
                  color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
            )));
        return;
      } else if (selectedAdType.value.id == -1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "يجب اختيار نوع الاعلان !",
              style: TextStyle(
                  color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
            )));
        return;
      } else if (descController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "يجب إضافة وصف للاعلان !",
              style: TextStyle(
                  color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
            )));
        return;
      } else if (fromDate.value.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "يجب إضافة تاريخ بداية الاعلان !",
              style: TextStyle(
                  color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
            )));
        return;
      } else if (isFlixble.isTrue && toDate.value.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "يجب إضافة تاريخ نهاية الاعلان !",
              style: TextStyle(
                  color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
            )));
        return;
      } else if(showInPlatform.isTrue && endAdvertisingDate.isEmpty){
        showToast("من فضلك يرجى إختيار تاريخ انتهاء مدة العرض فى المنصة!");
        onSelectedDateEndedAtPlateform(context);
        return;
      }else if (channelsIds.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "يجب إختيار قنوات الاعلان !",
              style: TextStyle(
                  color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
            )));
        return;
      } /*else if (selectedAdvertiseId == -1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "يجب إختيار المعلن !",
              style: TextStyle(
                  color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
            )));
        return;
      }*/
      //var file = await MultipartFile(requestAdvertiseController.attatechedFilesImageAndVideo[0].file, filename: "mmm");
      LoadingDailog().showLoading(context);
/*     List<myDio.MultipartFile>? _files = [];

     requestAdvertiseController.attatechedFilesImageAndVideo.value.forEach((element) async {
          if(element.file!=null && element.file!.path.isNotEmpty) {
            print("inFor");
            var mFile = await myDio.MultipartFile.fromFile(element.file!.path,
                filename: element.file!
                    .path
                    .split(Platform.pathSeparator)
                    .last);
            _files.add(mFile);
          }
    });*/
/*    myDio.MultipartFile? imageCopon;
    if(requestAdvertiseController.imagePath.value.isNotEmpty) {
      imageCopon = await myDio.MultipartFile.fromFile(
          requestAdvertiseController.imagePath.value,
          filename: requestAdvertiseController.imagePath.value
              .split(Platform.pathSeparator)
              .last);
    }

    myDio.MultipartFile? planFile;
    if (requestAdvertiseController.planFile?.path != null && requestAdvertiseController.planFile!.path.isNotEmpty) {
      planFile = await myDio.MultipartFile.fromFile(
          requestAdvertiseController.planFile!.path,
          filename: requestAdvertiseController.planFile!.path
              .split(Platform.pathSeparator)
              .last);
    }*/

      /*if(imageFideoFiles!=null && requestAdvertiseController.imageFideoFiles!.isEmpty){
        print("myFilesEmpty");
      }else{
        print("videosNum"+requestAdvertiseController.imageFideoFiles!.length.toString());
      }*/
/*    requestAdvertiseController.attatechedFilesImageAndVideo.forEach((element) async {
       compressVideo(element.file!).then((value) async {
        print("videoLengthIn= "+value.lengthSync().toString());
        var mFile =  await myDio.MultipartFile.fromFile(value.path,
            filename: value.path
                .split(Platform.pathSeparator)
                .last);
        requestAdvertiseController.imageFideoFiles?.add(mFile);
      });
    });*/
      //_parseInBackground();
      print("offer_ended_at"+endAdvertisingDate.value);

      Map<String, dynamic> mymap = {
        "_method":"put",
        "token": "Bearer " + myToken!,
        "advertiser_id": requestDetailsModel.value.advertiser?.id!=null?requestDetailsModel.value.advertiser?.id:null,
        "product_category_id": selectedCategory.value.id,
        "description": descController.text,
        "ads_type_id": selectedAdType.value.id,
        "date_type": isFlixble.isTrue ? "flexible" : "fixed",
        "started_at": fromDate.value,
        "ended_at": isFlixble.isTrue
            ? toDate.value
            : null,
        "offer_ended_at": endAdvertisingDate.value.isNotEmpty
            ? endAdvertisingDate.value
            : null,
        "repeat_count":isFlixble.isTrue?
        int.parse(selectedTimeCounter.value):1,
        "channels[]": channelsIds,
        //"attachments[]": imageFideoFiles!.isNotEmpty ? imageFideoFiles : null,
        /*     "links[][title]": requestAdvertiseController.links.value.isNotEmpty
          ? requestAdvertiseController.links.value.map((e) => e.title).toList()
          : null,
      "links[][link]": requestAdvertiseController.links.value.isNotEmpty
          ? requestAdvertiseController.links.value.map((e) => e.link).toList()
          : null,*/
        "location[name]": locationModel.value.name,
        "location[address]": locationModel.value.address,
        "location[lat]": locationModel.value.lat,
        "location[lng]": locationModel.value.lng,
        "copon[image]": imageCoponMultiPart,
        "copon[code]": coponNumberController?.text,
        "copon[name]": coponNameController?.text,
        "copon[discount]":
        coponDiscountController?.text!=null&&coponDiscountController!.text.isNotEmpty?int.parse(coponDiscountController!.text):null,
        "copon[uses]": coponUsesController?.text!=null&&coponUsesController!.text.isNotEmpty?int.parse(coponUsesController!.text):null,
        "copon[link]": coponLinkController?.text!=null&&coponLinkController!.text.isNotEmpty?coponLinkController!.text:null,
        "copon[ended_at]": endAdvertisingDateCoupon.value,
        "notes": noticeController?.text,
        //"plan_file": planFile,
        "inline":showInPlatform.isTrue?1:0
      };
      Map<String, dynamic> mymap2={};
      if(links.value.isNotEmpty){
        for (var value1 in links.value) {
          mymap2={
            "links[${links.value.indexOf(value1)}][title]":"${value1.name}",
            "links[${links.value.indexOf(value1)}][link]":"${value1.link}"
          };
          if(mymap2.isNotEmpty) {
            mymap.addAll(mymap2);
          }
        }
      }
      Logger().i("mymap"+mymap.toString());
      Repository repo = Repository();
      repo.putWithImageMultipart<CreateAdvertiseRequestResponse>(
          path: 'requests/${requestDetailsModel.value.id}',
          fromJson: (json) => CreateAdvertiseRequestResponse.fromJson(json),
          json: mymap,
          onSuccess: (res) async {
            //Navigator.of(context).pop();
           // Get.back();
          /*  if (res.message != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('تم تعديل طلبك بنجاح !', style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Arabic-Regular'),),
              ));
            }*/
            if(res.data!=null){
              if(imageFideoFilesPathStr!=null && imageFideoFilesPathStr!.isNotEmpty && res.data?.id!=null){
                onUploadFiles(res.data!.id!);
              }

              Logger().i(res.data!.toJson());
              if(type=="url"){
                if(Get.parameters['requestId']!=null && Get.parameters['requestId']!.isNotEmpty) {
                  await getRequestDetails(int.parse(Get.parameters['requestId']!));
                }
              }
            }
            Navigator.of(context).pop();
          },
          onError: (err, res) {
            //Navigator.of(context).pop();
            Get.back();
            Logger().i(err);
          });
    }
  List<String>? imageFideoFilesPathStr = [];
  Future<void> onUploadFiles( int ads_request_id) async {

    Map<String, dynamic> mymap3={
      "token": "Bearer " + myToken!,
      "ads_request_id":ads_request_id,
      "attachments[]": imageFideoFilesPathStr!.isNotEmpty ? imageFideoFilesPathStr: null,
    };
    Logger().i("mymap"+mymap3.toString());
    imageFideoFiles = [];
    imageFideoFilesPathStr = [];
    imageFideoRealFiles = [];
    FlutterBackgroundService().invoke("setAsForeground",mymap3);
  }

  void onDecriptionSavedClicked(BuildContext context) {
    if(descController.text!=null && descController.text.isEmpty){
      showToast("من فضلك يرجى إضافة وصف الاعلان !");
      return;
    }
    isDescSaveClicked.value = true;
    decriptionText.value = descController.text;
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم حفظ الوصف بنجاح !",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
    Get.back();
  }

  void insertNewLinkFieldsFromSheet() {
    urlList.asMap().forEach((index,element) {
      /*if(index==0){
            requestAdvertiseController.textUrlControllers.add(TextEditingController(text: element.name));
            requestAdvertiseController.urlControllers.add(TextEditingController(text: element.link));
          }else {
            requestAdvertiseController.insertNewLinkFields(textUrl: element.name, url: element.link);
          }*/
      textUrlControllers.add(TextEditingController(text: element.name));
      urlControllers.add(TextEditingController(text: element.link));
      animationControllers.add(AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      ));

      animationTextFields.add(Tween(
        begin: const Offset(0.0, 0.0),
        end: const Offset(0.2, 0.0),
      ).animate(
        CurvedAnimation(
          curve: Curves.decelerate,
          parent: animationControllers[numOfLinks.value],
        ),
      ));

      animationsClose.value.add(Tween(
        begin: const Offset(0.0, 0.0),
        end: const Offset(1.0, 0.0),
      ).animate(
        CurvedAnimation(
          curve: Curves.decelerate,
          parent:  animationControllers[numOfLinks.value],
        ),
      ));
      numOfLinks.value ++;
    });
  }



}


class DateRange {
  String? fromDate,toDate;
  DateRange({this.fromDate,this.toDate});
}


class XFileType{
  XFile? file;
  int? isVideo;
  XFileType({this.file,this.isVideo});
}