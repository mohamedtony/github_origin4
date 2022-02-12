import 'package:advertisers/app_core/network/models/TaxSettingsModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/TaxSettingsResponse.dart';
import 'package:advertisers/features/advertiser_details/sheets/urls_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class AdvertisingDetailsController extends GetxController{
  late TextEditingController placeNameController;
  late TextEditingController placeAddressController;


  late TextEditingController couponNumberController;
  late TextEditingController couponNameController;
  late TextEditingController numberOfUseController;
  late TextEditingController storeUrlController;


  bool? showInPlatform = false;

  void switchShowInPlatform (){
    if(showInPlatform == true){
      showInPlatform = false;
    }else{
      showInPlatform = true;
    }
    update();
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
    endAdvertisingDateCoupon = "";
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

  String selectedTimeCounter = '';


  void selectCounter(String? count){
    selectedTimeCounter = "$count";
    update();
  }
  String selectedDiscountPercentage = '';


  void selectDiscountPercentage(String? count){
    selectedDiscountPercentage = "$count";
    update();
  }

  DateRange? dateRange = DateRange(fromDate: "اختر نطاق زمني",toDate: ".........");

  void addDateRange(String? fromDate,toDate){
    dateRange = DateRange(fromDate: fromDate,toDate: toDate) ;
    update();
  }

  String? endAdvertisingDateCoupon;

  void addendAdvertisingDateCoupon(String? endDate){
    endAdvertisingDateCoupon = endDate;
    update();
  }

  String? endAdvertisingDate;

  void addendAdvertisingDate(String? endDate){
    endAdvertisingDate = endDate;
    update();
  }

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




  // late TextEditingController searchController;
  var search='';

  @override
  void onInit() {
    // passIndex;
    placeNameController = TextEditingController();
    placeAddressController = TextEditingController();
    descController=TextEditingController();

    couponNumberController=TextEditingController();
    couponNameController=TextEditingController();
    numberOfUseController=TextEditingController();
    storeUrlController=TextEditingController();



    super.onInit();
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