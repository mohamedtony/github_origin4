import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/LinkModel.dart';
import 'package:advertisers/app_core/network/models/LocationModel.dart';
import 'package:advertisers/app_core/network/models/RequestDetailsModel.dart';
import 'package:advertisers/app_core/network/models/TaxSettingsModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/TaxSettingsResponse.dart';
import 'package:advertisers/features/advertiser_details/sheets/advertising_date_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/urls_bottom_sheet.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    }else{
      showInPlatform.value = true;
    }
    //update();
  }
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

  /* List<UrlDataType>? urlList = [
     *//*UrlDataType(
       id: 0,
       urlName: "",
       urlTitle: ""
     ),*//*
   ];*/

   List<int>? checkList = [];


   void addRemoveCheckList(id){
     if(checkList!.contains(id)){
       checkList!.remove(id);
     }else{
       checkList!.add(id);
     }
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
      //channelsForList.value.removeWhere((element) => element.id==channels.value[indexCome].id);
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
  //---------------------- for urls page ------------------------------------------------
  RxList<LinkModel> links = <LinkModel>[].obs;
  var numOfLinks = 1.obs;
  var isUrlSaveClicked = false.obs;
  List<TextEditingController> textUrlControllers = [];
  List<TextEditingController> urlControllers = [];

  List<AnimationController> animationControllers = [];
  List<Animation<Offset>> animationTextFields = [];
  List<Animation<Offset>> animationsClose = [];
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

  void removeFromUrlList(LinkModel? item){
    urlList!.remove(item);
    //update();
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
      animationTextFields.removeAt(index);
    }
    if(animationsClose.length>0) {
      animationsClose.removeAt(index);
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

    animationsClose.add(Tween(
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

    mapController = Completer();
    setCustomMapPin();
    markerIcon = await getBytesFromAsset('images/location_icon.png', 70);

    //---------------------- for urls page ------------------------------------------------
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
        Logger().i(value.data!.toJson());
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        selectedCategory.value = requestDetailsModel.value.product_type!;
        selectedAdType.value = requestDetailsModel.value.ads_type!;

        if(value.data?.description!=null) {
          print("descController"+value.data!.description!);
          decriptionText.value = value.data!.description!;
          descController.text = value.data!.description!;
        }
        if(value.data?.links!=null){
          print("descController"+value.data!.links![0].toString());
          urlList.value = value.data!.links!;
        }
        if(value.data?.address!=null){
          placeNameController.text =  value.data!.address!.name!;
            placeAddressController.text = value.data!.address!.address!;
            locationText.value = value.data!.address!.address!;
            locationModel.value = value.data!.address!;
            if(mapController.isCompleted) {
              onMapClicked(position: LatLng(
                  double.parse(locationModel.value.lat!),
                  double.parse(locationModel.value.lng!)));
            }
        }
        Logger().i(value.data!.toJson());
        if(value.data!.channels!=null && value.data!.channels!.isNotEmpty) {
         // channels.value = value.data!.channels!;
          value.data!.channels!.asMap().forEach((index,element) {
            channels.value[index].isTapped.value = true;
          });

        }

        if(value.data?.copon!=null){
          if(value.data?.copon?.image!=null && value.data!.copon!.image!.isNotEmpty)
            imagePathCopon.value = value.data!.copon!.image!;

          if(value.data?.copon?.code!=null && value.data!.copon!.code!.isNotEmpty)
            coponNumberController!.text = value.data!.copon!.code!;

          if(value.data?.copon?.name!=null && value.data!.copon!.name!.isNotEmpty)
            coponNameController!.text = value.data!.copon!.name!;

          if(value.data?.copon?.discount!=null)
            coponDiscountController!.text = value.data!.copon!.discount!.toString();

          if(value.data?.copon?.uses!=null)
            coponUsesController!.text = value.data!.copon!.uses!.toString();

          if(value.data?.copon?.uses!=null)
            endAdvertisingDateCoupon.value = value.data!.copon!.ended_at!.toString();

        }

        if(value.data!.notes!=null && value.data!.notes!.isNotEmpty) {
          noticeController!.text = value.data!.notes!;
          noticeText.value =  value.data!.notes!;
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
  void insertNewLinkFields(BuildContext context){
    if(numOfLinks.value==0){
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

      animationsClose.add(Tween(
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

      animationsClose.add(Tween(
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
  void onSaveUrlsClicked(BuildContext context) {
    if(numOfLinks.value==0){
      Get.back();
    }
    else if(textUrlControllers[numOfLinks.value-1].text.isNotEmpty && urlControllers[numOfLinks.value-1].text.isNotEmpty){
      isUrlSaveClicked.value = true;
      Get.back();
      for(int i=0;i<numOfLinks.value;i++){
        links.add(LinkModel(name: textUrlControllers[i].text,link: urlControllers[i].text));
        urlList.add(LinkModel(name: textUrlControllers[i].text,link: urlControllers[i].text));
      }
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

  }

  void onSelectCoponDate(BuildContext context){
    DateTime selectedDate;
    if(endAdvertisingDateCoupon.isNotEmpty){
      print("myDate"+endAdvertisingDateCoupon.value);
      DateTime endAdvertisingDateCouponDate = DateTime.parse(endAdvertisingDateCoupon.value);
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

  //========================= notice sheet ===============
  //---------------------- for notice sheet --------------------------------------------
  late TextEditingController? noticeController;
  var isNoticeSaveClicked = false.obs;
  var noticeText = ''.obs;
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
    EasyLoading.show();
    //  var myToken  = await storage.read("token");
    await getRequestDetails(/*Get.parameters['requestId']*/145);
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