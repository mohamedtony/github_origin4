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
import 'package:advertisers/features/request_advertise_module/view/widgets/advertising_date_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/attatchements_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/discount_coupon_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/notice_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/send_request_success.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/urls_bottom_sheet.dart';
import 'package:advertisers/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart' as location;
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart' as myDio;
import 'package:video_compress/video_compress.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class RequestAdvertiseController extends GetxController with GetTickerProviderStateMixin{

  //==================================== for date sheet
  var isFlixble = true.obs;
  var isFixed = false.obs;
  var fromAdvertisingDate = '2022-2-10'.obs;
   late TextEditingController selectedCounterController;
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
  var showInPlatform = false.obs;
  // -------------------- for attachement sheet  ----------------------------------------
  RxList<FileModel>  attatechedFilesImageAndVideo =<FileModel>[].obs;
  var isAttachementSaveClicked = false.obs;
  List<myDio.MultipartFile>? imageFideoFiles = [];
  List<String>? imageFideoFilesPathStr = [];
  List<File> imageFideoRealFiles = [];
  final ImagePicker _picker = ImagePicker();
  List<XFile>? images2;
  XFile? mVideo;

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
  FocusNode coponNumberNode = FocusNode();
  FocusNode coponNameNode = FocusNode();
  FocusNode coponDiscountNode = FocusNode();
  FocusNode coponUsesNode = FocusNode();
  FocusNode coponUrlNode = FocusNode();
  //FocusNode coponUrlNode = FocusNode();
//---------------------- for notice sheet --------------------------------------------
  TextEditingController? noticeController;
  var isNoticeSaveClicked = false.obs;

  //---------------------- for plan sheet --------------------------------------------
  myDio.MultipartFile? planFile;

  RxList<SelectedSocialMedia> items = <SelectedSocialMedia>[].obs;



  late HomeNavController controller;
  List<String> images=['images/snapshat_icon.png','images/instegram.png',
    'images/twitter.png','images/youtube.png','images/facebook.png','images/whatsup.png',];

  //---------------------- for map sheet ========================
  late TextEditingController placeNameController;
  late TextEditingController placeAddressController;
  late Completer<GoogleMapController> mapController;
  late GoogleMapController googleMapController;
  BitmapDescriptor? pinLocationIcon;
  late Uint8List markerIcon;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    descriptionController =  TextEditingController();
    placeNameController = TextEditingController();
    placeAddressController = TextEditingController();
    selectedCounterController = TextEditingController(text: '1');

    print("isPlateformmm= "+showInPlatform.value.toString());
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
    }else{
      controller = Get.find<HomeNavController>();
    }
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
   /* Logger().i(channelsIds);
    Logger().i("categoryId= ",categoryId);
    Logger().i("typeId= ",adTypeId);*/
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
    imageFideoRealFiles.removeAt(index);
    imageFideoFilesPathStr?.removeAt(index);
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
              isVideo:false
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
                  isVideo:true
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
                  isVideo:false
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
               isVideo:false
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
        isVideo: true
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
      for(int i=0;i<numOfLinks.value;i++){
        if(!isUrlUsingRegularExpression(urlControllers[i].text)){
          showToast("من فضلك يجب ادخال رابط بشكل صحيح");
          return;
        }
        links.add(LinkModel(name: textUrlControllers[i].text,link: urlControllers[i].text));
      }
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم حفظ الروابط بنجاح !",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
    }else{
      for(int i=0;i<numOfLinks.value;i++){

      }
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
          firstDate:( DateTime.now()),
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
  var selectedTimeCounter = "1".obs;


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
      if(dateRange.value.fromDate==null){
        showToast("من فضلك يرجى إختيار تاريخ الاعلان !");
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
      isDateSaveClicked.value = true;
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

  onPlanClicked(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowedExtensions: ['pdf', 'doc'],type: FileType.custom);

    if (result != null) {
       //planFile = File(result.files.single.path!);
       var mFile = await myDio.MultipartFile.fromFile(result.files.single.path!,
           filename: result.files.single.path!
               .split(Platform.pathSeparator)
               .last);
       //imageFideoFiles?.add(mFile);
       planFile = mFile;
      // compressFile(File(result.files.single.path!));
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("تم حفظ ملف خطة الاعلان!",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));

    } else {
      // User canceled the picker
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
    locationModel= LocationModel(name: placeNameController.text,address: placeAddressController.text,lat: latLng!.latitude.toString(),lng: latLng!.longitude.toString());
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم حفظ تفاصيل العنوان بنجاح!",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
    Get.back();
  }

  void switchShowInPlatform (){
    print("kkk"+showInPlatform.value.toString());
    if(showInPlatform.isTrue){
      showInPlatform.value = false;
      endAdvertisingDate.value = '';
    }else{
      showInPlatform.value = true;
    }
    print("kkk"+showInPlatform.value.toString());
    //update();
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
@override
  void onClose() {
    // TODO: implement onClose
   coponNumberNode.dispose();
   coponNameNode.dispose();;
   coponDiscountNode.dispose();
   coponUsesNode.dispose();
   coponUrlNode.dispose();
    super.onClose();
  }
}
