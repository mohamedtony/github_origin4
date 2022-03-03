import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/RequestDetailsModel.dart';
import 'package:advertisers/app_core/network/models/TaxSettingsModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/TaxSettingsResponse.dart';
import 'package:advertisers/features/advertiser_details/sheets/urls_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../../main.dart';


class AdvertisingDetailsController extends GetxController{
  late TextEditingController placeNameController;
  late TextEditingController placeAddressController;


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
    }else{
      showInPlatform.value = true;
    }
    //update();
  }

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


  getVideoToAttachedList({@required bool? fromGallery}) async {
    pickedXFile =
    await picker.pickVideo(
        source: fromGallery! ? ImageSource.gallery : ImageSource.camera,);
    attachedImagesList.add(XFileType(
        file: XFile(pickedXFile!.path),
        isVideo: 1
    ));
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
    update();
  }

  void deleteCoupon(){
    removeSelectedImage();
    couponNumberController.text = "";
    couponNameController.text = "";
    numberOfUseController.text = "";
    storeUrlController.text = "";
    endAdvertisingDateCoupon.value = "";
    selectedDiscountPercentage = "";
    update();
  }

  void deleteFromAttachedImagesList(XFileType? xItem){
    attachedImagesList.remove(xItem);
    update();
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

/*  String selectedTimeCounter = '';


  void selectCounter(String? count){
    selectedTimeCounter = "$count";
    update();
  }*/
  String selectedDiscountPercentage = '';


  void selectDiscountPercentage(String? count){
    selectedDiscountPercentage = "$count";
    update();
  }

/*
  DateRange? dateRange = DateRange(fromDate: "اختر نطاق زمني",toDate: ".........");

  void addDateRange(String? fromDate,toDate){
    dateRange = DateRange(fromDate: fromDate,toDate: toDate) ;
    update();
  }
*/

/*  String? endAdvertisingDateCoupon;

  void addendAdvertisingDateCoupon(String? endDate){
    endAdvertisingDateCoupon = endDate;
    update();
  }*/
/*
  String? endAdvertisingDate;

  void addendAdvertisingDate(String? endDate){
    endAdvertisingDate = endDate;
    update();
  }*/

   List<UrlDataType>? urlList = [
     UrlDataType(
       id: 0,
       urlName: "",
       urlTitle: ""
     ),
   ];

  void addToUrlList(){
    urlList!.add(
        UrlDataType(
            id: urlList!.length + 1,
            urlTitle: "",
            urlName: ""
        )
    );
    update();
  }

  void removeFromUrlList(UrlDataType? item){
    urlList!.remove(item);
    update();
  }



   List<int>? checkList = [];


   void addRemoveCheckList(id){
     if(checkList!.contains(id)){
       checkList!.remove(id);
     }else{
       checkList!.add(id);
     }
     update();
   }

  bool isChecked = false;
  void changeChecked(){
    if(isChecked == false){
      isChecked = true;
    }else{
      isChecked = false;
    }
    update();
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

    if(isFlixble.isTrue){
      if(dateRange.value.fromDate==null){
        showToast("من فضلك يرجى إختيار تاريخ الاعلان !");
        return;
      }
    }
    if(isFixed.isTrue && fromAdvertisingDate.value=='2022-2-10'){
      showToast("من فضلك يرجى إختيار تاريخ الاعلان !");
      return;
    }else if(selectedTimeCounter.value.isEmpty){
      showToast("من فضلك يرجى إختيار عدد مرات الاعلان !");
      return;
    }else{
      isDateSaveClicked.value = true;
      Navigator.pop(context);
    }
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
      channelsForList.value.removeWhere((element) => element.id==channels.value[indexCome].id);
    }else{
      channels.value[indexCome].isTapped.value=true;
      channelsIds.add(channels.value[indexCome].id!);
      Channel? channel = channelsForList.value.firstWhereOrNull((element) => element.id==channels.value[indexCome].id,);
      if(channel == null){
        channelsForList.value.add(channels.value[indexCome]);
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

    myToken  = await storage.read("token");
    client!.getProductsAndAdsTypes("Bearer "+myToken!).then((value) {
      Logger().i(value.data?.toJson());
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
            channelsForList.value = value.data!.channels!;
            /*value.data!.channels!.asMap().forEach((index,element) {
              channels.value[index].isTapped.value = true;
            });*/

          }
        }
        isLoadingTypes.value =false;
      }
    });

    super.onInit();
    //if( Get.parameters['requestId']!=null) {
      EasyLoading.show();
      //  var myToken  = await storage.read("token");
      await getRequestDetails(/*Get.parameters['requestId']*/145);
   // }
  }
  var requestDetailsModel = RequestDetailsModel().obs;
  Future<void> getRequestDetails(int? parameter) async {
    print("MyId"+parameter.toString());
    myToken = await storage.read("token");
    client!.getRequestDetail(145/*+myToken!*/,/*int.parse(parameter!)*/"Bearer 1126|jTxjuJcosyJTaHllWcikzq81KkNFyXXlP0DtWhiC").then((value){
      if(value.status==200 && value.data!=null){
        requestDetailsModel.value = value.data!;
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        selectedCategory.value = requestDetailsModel.value.product_type!;
        //selectedAdType.value = requestDetailsModel.value.a!;

        if(value.data?.description!=null) {
          descController.text = value.data!.description!;
        }
        Logger().i(value.data!.toJson());
        if(value.data!.channels!=null && value.data!.channels!.isNotEmpty) {
         // channels.value = value.data!.channels!;
          value.data!.channels!.asMap().forEach((index,element) {
            channels.value[index].isTapped.value = true;
          });

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





  @override
  void onClose() {
    descController.dispose();

    super.onClose();
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