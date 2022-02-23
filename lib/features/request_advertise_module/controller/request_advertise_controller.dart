import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/FileModel.dart';
import 'package:advertisers/app_core/network/models/LinkModel.dart';
import 'package:advertisers/app_core/network/models/LocationModel.dart';
import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/advertiser_settings_page/widgets/activities_bottom_sheet.dart';
import 'package:advertisers/features/advertiser_settings_page/widgets/location_range_sheet.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/home_page/controller/home_navigation_controller.dart';
import 'package:advertisers/features/home_page/model/SelectedSocialMedia.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/address_bottom_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/advertising_channels_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/attatchements_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/discount_coupon_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/notice_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/send_request_success.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/urls_bottom_sheet.dart';
import 'package:advertisers/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart' as location;
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart' as myDio;
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class RequestAdvertiseController extends GetxController with GetTickerProviderStateMixin{

  //==================================== for date sheet
  var isFlixble = true.obs;
  var isFixed = false.obs;
  var fromAdvertisingDate = '2022-2-10'.obs;

  //----------------------- for request ads == request advertise page---------------
  var isLoadingTypes = true.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<AdTypeModel> ads_types = <AdTypeModel>[].obs;
  String? myToken ;
  int categoryId = -1;
  int adTypeId = -1;
  late TextEditingController descriptionController;

  // -------------------- for channel sheet  --------------------------------------------
  RxList<Channel> channels = <Channel>[].obs;
  List<int> channelsIds = [];
  var isChannelSaveClicked = false.obs;

  // -------------------- for attachement sheet  ----------------------------------------
  RxList<FileModel>  attatechedFilesImageAndVideo =<FileModel>[].obs;
  var isAttachementSaveClicked = false.obs;

  //---------------------- for urls page ------------------------------------------------
  RxList<LinkModel> links = <LinkModel>[].obs;
  var numOfLinks = 1.obs;
  var isUrlSaveClicked = false.obs;
  List<TextEditingController> textUrlControllers = [];
  List<TextEditingController> urlControllers = [];

  List<AnimationController> animationControllers = [];
  List<Animation<Offset>> animationTextFields = [];
  List<Animation<Offset>> animationsClose = [];
  /// Will used to access the Animated list
   GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

 // TextEditingController? textUrlController;
  //TextEditingController? urlController;

//---------------------- for discount sheet --------------------------------------------
  late XFile xFile ;
  File? imageFile;
  myDio.MultipartFile? imageCoponMultiPart;
  var imagePathCopon = ''.obs;
  var isDiscountSaveClicked = false.obs;
  TextEditingController? coponNumberController,coponNameController,coponDiscountController,coponUsesController,coponLinkController;

//---------------------- for notice sheet --------------------------------------------
  TextEditingController? noticeController;
  var isNoticeSaveClicked = false.obs;

  //---------------------- for plan sheet --------------------------------------------
  myDio.MultipartFile? planFile;

  RxList<SelectedSocialMedia> items = <SelectedSocialMedia>[].obs;
  final ImagePicker _picker = ImagePicker();
   List<XFile>? images2;
  XFile? mVideo;
  late final  HomeNavController controller;
  List<String> images=['images/snapshat_icon.png','images/instegram.png',
    'images/twitter.png','images/youtube.png','images/facebook.png','images/whatsup.png',];

  //---------------------- for map sheet ========================
  late TextEditingController placeNameController;
  late TextEditingController placeAddressController;
  late Completer<GoogleMapController> mapController;
  late GoogleMapController googleMapController;
  BitmapDescriptor? pinLocationIcon;

  late Uint8List markerIcon;
  List<myDio.MultipartFile>? imageFideoFiles = [];
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    descriptionController =  TextEditingController();
    placeNameController = TextEditingController();
    placeAddressController = TextEditingController();

     myToken  = await storage.read("token");
    client!.getProductsAndAdsTypes("Bearer "+myToken!).then((value) {
      Logger().i(value.data?.toJson());
      if(value.data!=null&&value.status==200){
        //Get.back();

        if(value.data!=null) {
          if(value.data!.product_types!=null) {
            categories.value = value.data!.product_types!;
            categories.value.insert(0, CategoryModel(id: -1,name: 'نوع المنتج'));

          }
          if(value.data!.ads_types!=null) {
            ads_types.value = value.data!.ads_types!;
            ads_types.value.insert(0, AdTypeModel(id: -1,name: 'نوع الاعلان'));
          }
          if(value.data!.channels!=null) {
            channels.value = value.data!.channels!;
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

     //List<Animation<Offset>> animationsClose = [];
    if(controller.initialized) {
      controller = Get.find<HomeNavController>();
    }
    SelectedSocialMedia selectedSocialMedia =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia);
    SelectedSocialMedia selectedSocialMedia1 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia1);
    SelectedSocialMedia selectedSocialMedia2 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia2);
    SelectedSocialMedia selectedSocialMedia3 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia3);
    SelectedSocialMedia selectedSocialMedia4 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia4);
    SelectedSocialMedia selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    super.onInit();

  }

  void changeTabIndex(int indexCome,bool isTap) {
    if(channels.value[indexCome].isTapped.value==true){
      channels.value[indexCome].isTapped.value=false;
      channelsIds.removeWhere((element) => element==channels.value[indexCome].id);
    }else{
      channels.value[indexCome].isTapped.value=true;
      channelsIds.add(channels.value[indexCome].id!);
    }
  }

  void showMyBottomSheet(BuildContext context,int bottomNumber){
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

          initialChildSize: 0.67,
          expand: false,
          builder: (context, scrollController) {
            if(bottomNumber==2) {
              /*return AdvertisingChannelsPage(
                  scrollController: scrollController);*/
              return LocationRangeBottomSheet(
                  scrollController: scrollController);

            }else if(bottomNumber==3){
              return AttatchementPage(
                  scrollController: scrollController);
            }else if(bottomNumber==4){
              return UrlsPage(
                  scrollController: scrollController);
            }else if(bottomNumber==20){
              return AddressBottomSheet(
                  scrollController: scrollController);
            }
            else if(bottomNumber==21){
              return SendRequestSuccess(
                  scrollController: scrollController);
            }else if(bottomNumber==5){
              return NoticeSheet(
                  scrollController: scrollController);
            }else{
              return DiscountCouponSheet(
                  scrollController: scrollController);
            }
          },
        );
      },
    );
  }

/*  Future<void> pickImages() async {
    images2 = await _picker.pickMultiImage();
    print("imagemm"+images2.toString());
  }*/

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

  //================================== attatchement sheet ===============================
  void deleteImage(int index){
    attatechedFilesImageAndVideo.removeAt(index);
    imageFideoFiles?.removeAt(index);
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
    XFile? imageFromFamera = await _picker.pickImage(source: ImageSource.camera);
    if(imageFromFamera!=null){
      print("imagemm"+images2.toString());
      attatechedFilesImageAndVideo.add(
          FileModel(
              file:File(imageFromFamera.path),
              isVideo:false
          )
      );
      var mFile = await myDio.MultipartFile.fromFileSync(imageFromFamera.path,
          filename: imageFromFamera.path
              .split(Platform.pathSeparator)
              .last);
      imageFideoFiles?.add(mFile);
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

    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    result?.files.forEach((element) {
      print("exte= "+element.extension!);
    });
    if (result != null) {
      //List<File> files = result.paths.map((path) => File(path!)).toList();
      result.files.forEach((element) async {
        print("exte= "+element.extension!);
        if(element.extension=="mp4"){
          attatechedFilesImageAndVideo.add(
              FileModel(
                  file:File(element.path!),
                  isVideo:true
              )
          );
          var mFile = await myDio.MultipartFile.fromFileSync(element.path!,
              filename: element.path!
                  .split(Platform.pathSeparator)
                  .last);
          imageFideoFiles?.add(mFile);
        }else if(element.extension?.toLowerCase()=="jpg"||element.extension?.toLowerCase()=='png'){
          attatechedFilesImageAndVideo.add(
              FileModel(
                  file:File(element.path!),
                  isVideo:false
              )
          );
          var mFile = await myDio.MultipartFile.fromFileSync(element.path!,
              filename: element.path!
                  .split(Platform.pathSeparator)
                  .last);
          imageFideoFiles?.add(mFile);
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

  Future<void> pickImages() async {
    images2 = await _picker.pickMultiImage();
    if(images2!=null && images2!.isNotEmpty){
      print("imagemm"+images2.toString());
      //attatechedFilesImageAndVideo.value=[];
      images2?.forEach((element) async {
        attatechedFilesImageAndVideo.add(
          FileModel(
              file:File(element.path),
               isVideo:false
          )
        );
        var mFile = await myDio.MultipartFile.fromFileSync(element.path,
            filename: element.path
                .split(Platform.pathSeparator)
                .last);
        imageFideoFiles?.add(mFile);
      });
    }

  }

  Future<void> getVideoToAttachedList({@required bool? fromGallery}) async {
    mVideo =
    await _picker.pickVideo(
      source: fromGallery! ? ImageSource.gallery : ImageSource.camera,);
    attatechedFilesImageAndVideo.add(FileModel(
        file: File(mVideo!.path),
        isVideo: true
    ));
    var mFile = await myDio.MultipartFile.fromFileSync(mVideo!.path,
        filename: mVideo!.path
            .split(Platform.pathSeparator)
            .last);
    imageFideoFiles?.add(mFile);
  }
  void onSaveAttachmentClicked(BuildContext context) {
    Logger().i(attatechedFilesImageAndVideo);
    isAttachementSaveClicked.value = true;
    Get.back();
    if(attatechedFilesImageAndVideo.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("تم حفظ المرفقات بنجاح !", style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'Arabic-Regular'),),
      ));
    }
    /*Logger().i("categoryId= ",categoryId);
    Logger().i("typeId= ",adTypeId);*/
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
        links.add(LinkModel(title: textUrlControllers[0].text,link: urlControllers[0].text));
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

//================================== dicount sheet ==========================================
  Future<void> showChoiceImageDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("Choose option",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openGallery(context);
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openCamera(context);
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }
  void _openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      xFile = pickedFile;
      imageFile = File(xFile.path);
      imagePathCopon.value =xFile.path;
    }
    /* setState(() {
      imageFile = pickedFile!;
    });*/
    imageCoponMultiPart= await myDio.MultipartFile.fromFileSync(xFile.path,
        filename: xFile.path
            .split(Platform.pathSeparator)
            .last);

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
      imageCoponMultiPart =  await myDio.MultipartFile.fromFileSync(xFile.path,
          filename: xFile.path
              .split(Platform.pathSeparator)
              .last);
    }
    Navigator.pop(context);
  }
  void onDiscountCoponSaveClicked(BuildContext context) {

    if(imagePathCopon.value.isEmpty){
      showToast("من فضلك قم بإدخال صورة كوبون الخصم !");
    return;
    }
    else if(coponNumberController?.text!=null && coponNumberController!.text.isEmpty){
      showToast("من فضلك قم بإدخال رقم كوبون الخصم !");
      return;
    }else if(coponNameController?.text!=null && coponNameController!.text.isEmpty){
      showToast("من فضلك قم بإدخال اسم كوبون الخصم !");
      return;
    }
    else if(coponDiscountController?.text!=null && coponDiscountController!.text.isEmpty){
      showToast("من فضلك قم بإدخال نسبة الخصم!");
      return;
    }else if(coponUsesController?.text!=null && coponUsesController!.text.isEmpty){
      showToast("من فضلك قم بإدخال عدد إستخدامات الكوبون !");
      return;
    }else if(coponLinkController?.text!=null && coponLinkController!.text.isEmpty){
      showToast("من فضلك قم بإدخال رابط المتجر !");
      return;
    }else if(endAdvertisingDateCoupon!=null && endAdvertisingDateCoupon.isEmpty){
      showToast("من فضلك قم بإدخال تاريخ إنتهاء الكوبون !");
      return;
    }else{
      isDiscountSaveClicked.value = true;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم حفظ بيانات الكوبون بنجاح !",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
      Get.back();
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
  var selectedTimeCounter = ''.obs;


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

  void onNoticeSavedClicked(BuildContext context) {
    if(noticeController?.text!=null && noticeController!.text.isEmpty){
      showToast("من فضلك يرجى إضافة ملاحظة !");
      return;
    }
    isNoticeSaveClicked.value = true;
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم حفظ الملاحظة بنجاح !",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
    Get.back();
  }
  var isLocationClickedSaved = false.obs;
  LocationModel locationModel = LocationModel();
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
    locationModel= LocationModel(name: placeNameController.text,address: placeAddressController.text,lat: latLng!.latitude,lng: latLng!.longitude);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم حفظ تفاصيل العنوان بنجاح!",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
    Get.back();
  }

  onPlanClicked(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
       //planFile = File(result.files.single.path!);
       var mFile = await myDio.MultipartFile.fromFileSync(result.files.single.path!,
           filename: result.files.single.path!
               .split(Platform.pathSeparator)
               .last);
       //imageFideoFiles?.add(mFile);
       planFile = mFile;
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("تم حفظ ملف خطة الاعلان!",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));

    } else {
      // User canceled the picker
    }
  }
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

/*  getMyLocation() async{
    Address address;
    Location location = new Location();
    LocationData _locationData;
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        final snackBar = SnackBar(
          content: Text(AppLocalization.of(context).enableLocation),
          action: SnackBarAction(
            label: AppLocalization.of(context).retry,
            onPressed: () {
              getMyLocation();
            },
          ),
        );
        globalKey.currentState.showSnackBar(snackBar);
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDetermineMyLocation();
            });
        return;
      }
    } else if (_permissionGranted == PermissionStatus.deniedForever) {
      final snackBar = SnackBar(
        content: Text(AppLocalization.of(context).deniedForEver),
      );
      globalKey.currentState.showSnackBar(snackBar);
      return;
    }

    _locationData = await location.getLocation();
    myLoc = LatLng(_locationData?.latitude, _locationData?.longitude);
    //searchNearby(null,null,myLoc.latitude,myLoc.longitude);

    kGooglePlex = new CameraPosition(
      target: LatLng(myLoc.latitude, myLoc.longitude),
      zoom: zoom,
    );
    final coordinates = new Coordinates(myLoc.latitude, myLoc.longitude);
    await Geocoder.local
        . findAddressesFromCoordinates(coordinates)
        .then((value) {
      address = value.first;
    });


    // location is a LatLng object
    Timer(Duration(milliseconds: 500), () {
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(kGooglePlex));
    });

    if(type=="mylocation"){
      Navigator.pop(context);
      marker.clear();
      var point = Marker(
        markerId: MarkerId("3"),
        position: LatLng(myLoc.latitude, myLoc.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
      marker.add(point);
    }

    // print("address1ID${addressID} - ${ type}");
    if(type=="mylocation" && addressID!=0){
      print("addressID${addressID}");
      addAddressPageMobx.editAddressMethod(
          context: context,
          request: EditAddressRequest(
            parameters: ["all"],
            type: "user",
            locationId: addressID,
            apiToken: account.getAccount.apiToken,
            description: null,
            isDefaultAddress: true,
            location: LocationModel(
                address: address.addressLine,
                latitude: myLoc.latitude,
                longitude: myLoc.longitude),
          ));
    }else{
      addAddressPageMobx.addAddressMethod(
          context: context,
          request: AddAddressesRequest(
            parameters: ["all"],
            type: "user",
            apiToken: account.getAccount.apiToken,
            description: null,
            isDefaultAddress: true,
            location: LocationModel(
                address: address.addressLine,
                latitude: myLoc.latitude,
                longitude: myLoc.longitude),
          ));
    }
//    geo.Geolocator().getCurrentPosition(desiredAccuracy: geo.LocationAccuracy.high).then((value){
//      myLoc =  LatLng(value?.latitude,value?.longitude);
//    });

  }*/
  //------------------------------------ for select date sheet --------------------------------
  /*DateRange? dateRange = DateRange(fromDate: "اختر نطاق زمني",toDate: ".........");

  void addDateRange(String? fromDate,toDate){
    dateRange = DateRange(fromDate: fromDate,toDate: toDate) ;
    update();
  }
*/


/*  String? endAdvertisingDate;

  void addendAdvertisingDate(String? endDate){
    endAdvertisingDate = endDate;
    update();
  }*/

}
