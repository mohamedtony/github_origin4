import 'dart:io';

import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/LinkModel.dart';
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
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class RequestAdvertiseController extends GetxController with GetTickerProviderStateMixin{

  //----------------------- for request ads == request advertise page---------------
  var isLoadingTypes = true.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<AdTypeModel> ads_types = <AdTypeModel>[].obs;
  String? myToken ;
  int categoryId = -1;
  int adTypeId = -1;
  TextEditingController? descriptionController;

  // -------------------- for channel sheet  --------------------------------------------
  RxList<Channel> channels = <Channel>[].obs;
  List<int> channelsIds = [];

  // -------------------- for attachement sheet  ----------------------------------------
  var realImages =[].obs;
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

 // TextEditingController? textUrlController;
  //TextEditingController? urlController;

//---------------------- for discount sheet --------------------------------------------
  late XFile xFile ;
  File? imageFile;
  var imagePath = ''.obs;


  RxList<SelectedSocialMedia> items = <SelectedSocialMedia>[].obs;
  final ImagePicker _picker = ImagePicker();
   List<XFile>? images2;
  late final  HomeNavController controller;
  List<String> images=['images/snapshat_icon.png','images/instegram.png',
    'images/twitter.png','images/youtube.png','images/facebook.png','images/whatsup.png',];
  @override
  Future<void> onInit() async {
    // TODO: implement onInit

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
     descriptionController =  TextEditingController();


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
     controller = Get.find<HomeNavController>();
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

  void onSaveChannelsClicked() {
    Logger().i(channelsIds);
    Logger().i("categoryId= ",categoryId);
    Logger().i("typeId= ",adTypeId);
  }

  //================================== attatchement sheet ===============================
  void deleteImage(int index){
    realImages.removeAt(index);
  }
  Future<void> pickImages() async {
    images2 = await _picker.pickMultiImage();
    if(images2!=null && images2!.isNotEmpty){
      print("imagemm"+images2.toString());
      realImages.value=[];
      images2?.forEach((element) {
        realImages.add(File(element.path));
      });
    }

  }
  void onSaveAttachmentClicked(BuildContext context) {
    Logger().i(realImages);
    isAttachementSaveClicked.value = true;
    Get.back();
    if(realImages.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم حفظ المرفقات بنجاح !")));
    }
    /*Logger().i("categoryId= ",categoryId);
    Logger().i("typeId= ",adTypeId);*/
  }

//================================== url sheet ==========================================
 void insertNewLinkFields(BuildContext context){
    if(textUrlControllers[numOfLinks.value-1].text.isNotEmpty && urlControllers[numOfLinks.value-1].text.isNotEmpty){
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
    if(textUrlControllers[numOfLinks.value-1].text.isNotEmpty && urlControllers[numOfLinks.value-1].text.isNotEmpty){
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
      imagePath.value =xFile.path;
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
      imagePath.value =xFile.path;
    }
    Navigator.pop(context);
  }


  DateRange? dateRange = DateRange(fromDate: "اختر نطاق زمني",toDate: ".........");

  void addDateRange(String? fromDate,toDate){
    dateRange = DateRange(fromDate: fromDate,toDate: toDate) ;
    update();
  }

  var endAdvertisingDateCoupon = ''.obs;

  void addendAdvertisingDateCoupon(String? endDate){
    endAdvertisingDateCoupon.value = endDate!;
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


/*  String? endAdvertisingDate;

  void addendAdvertisingDate(String? endDate){
    endAdvertisingDate = endDate;
    update();
  }*/

}
