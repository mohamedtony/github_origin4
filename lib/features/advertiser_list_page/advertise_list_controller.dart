import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/AccountSettingRulesResponse.dart';
import 'package:advertisers/app_core/network/responses/EmployeesRulesResponse.dart';
import 'package:advertisers/app_core/network/responses/GalleryRulesResponse.dart';
import 'package:advertisers/app_core/network/responses/MangeAdvertisersAccountsRulesResponse.dart';
import 'package:advertisers/app_core/network/responses/MyAdsRulesResponse.dart';
import 'package:advertisers/app_core/network/responses/OrdersRulesResponse.dart';
import 'package:advertisers/app_core/network/responses/ReportsRulesResponse.dart';
import 'package:advertisers/app_core/network/responses/SubscriptionsRulesResponse.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertiseListController extends GetxController with GetSingleTickerProviderStateMixin {
  var isOpend = false;
  var position = -1;
  var tabIndex = 0.obs;
  String? myToken;
  int? ownerId;
  var roleType = ''.obs;
  var clientProfileModel = ClientProfileModel().obs;
  late Repository repo;
  bool showEmployees=true;
  bool showSettings=true;
  bool showAdsRequests=true;
  bool showMyAds=true;
  bool showGallery=true;
  bool showReports=true;
  bool showSubscriptions=true;
  bool showEmployeesManagement=true;
  void changeIndex(int position) {
    this.tabIndex.value = position;

  }

  void changeStatus(bool isOpend,int position) {
    this.isOpend = isOpend;
    this.position = position;
    update();
  }

   late TabController controller;

  @override
  Future<void> onInit() async {
    repo=Repository();
    ownerId =   storage.read("ownerid");
    myToken  = await storage.read("token");
    checkEmployeesRules();
    checkAccountSettingRules();
    checkAdsRequestsRules();
    checkMyAdsRules();
    checkGalleryRules();
    checkReportsRules();
    checkSubscriptionsRules();
    checkEmployeesManagementRules();
    super.onInit();
    controller = TabController(vsync: this, length: 3);//Bearer 172|bArU5eQ7MZSTtD4CKY2Wwtvn2onzJlVrG643Vob6

  }

  /// check rules
  void checkEmployeesRules () async {
    EasyLoading.show();
    Map<String, dynamic> mymap = {
      "token":  "Bearer ${storage.read("token")}",
      "key": "employees",
      "owner_id":"${storage.read("ownerid")}",
    };

    repo.postWithImageMultipart<EmployeesRulesResponse>(
        path: 'employee/check_roles',
        fromJson: (json) => EmployeesRulesResponse.fromJson(json),
        json: mymap,
        onSuccess: (res) async {

          if(res.status==200){
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            if(res.data!.show==null||res.data!.show==false){
              showEmployees= false;
            }else{
              showEmployees= res.data!.show!;
            }
            print("showEmployees $showEmployees");
            update();

          }else{
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            // Get.snackbar(
            //   " خطأ ${res.status}",
            //   res.message.toString(),
            //   icon: const Icon(Icons.person, color: Colors.red),
            //   backgroundColor: Colors.yellow,
            //   snackPosition: SnackPosition.BOTTOM,);
          }
          update();
        },
        onError: (err, res) {
          Get.snackbar(
            " خطأ ${res.status}",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          Logger().i(err);
        });
  }

  /// check settings rules
  void checkAccountSettingRules () async {
    EasyLoading.show();
    Map<String, dynamic> mymap = {
      "token":  "Bearer ${storage.read("token")}",
      "key": "settings",
      "owner_id":"${storage.read("ownerid")}",
    };

    repo.postWithImageMultipart<AccountSettingRulesResponse>(
        path: 'employee/check_roles',
        fromJson: (json) => AccountSettingRulesResponse.fromJson(json),
        json: mymap,
        onSuccess: (res) async {

          if(res.status==200){
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            if(res.data!.show==null||res.data!.show==false){
              showSettings= false;
            }else{
              showSettings= res.data!.show!;
            }
            print("showSettings $showSettings");
            update();

          }else{
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            // Get.snackbar(
            //   " خطأ ${res.status}",
            //   res.message.toString(),
            //   icon: const Icon(Icons.person, color: Colors.red),
            //   backgroundColor: Colors.yellow,
            //   snackPosition: SnackPosition.BOTTOM,);
          }
          update();
        },
        onError: (err, res) {
          Get.snackbar(
            " خطأ ${res.status}",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          Logger().i(err);
        });
  }

  /// check ads_requests rules myads
  void checkAdsRequestsRules () async {
    EasyLoading.show();
    Map<String, dynamic> mymap = {
      "token":  "Bearer ${storage.read("token")}",
      "key": "ads_requests",
      "owner_id":"${storage.read("ownerid")}",
    };

    repo.postWithImageMultipart<OrdersRulesResponse>(
        path: 'employee/check_roles',
        fromJson: (json) => OrdersRulesResponse.fromJson(json),
        json: mymap,
        onSuccess: (res) async {

          if(res.status==200){
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            if(res.data!.showAll==null||res.data!.showAll==false){
              showAdsRequests= false;
            }else{
              showAdsRequests= res.data!.showAll!;
            }
            print("showAdsRequests $showAdsRequests");
            update();

          }else{
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            // Get.snackbar(
            //   " خطأ ${res.status}",
            //   res.message.toString(),
            //   icon: const Icon(Icons.person, color: Colors.red),
            //   backgroundColor: Colors.yellow,
            //   snackPosition: SnackPosition.BOTTOM,);
          }
          update();
        },
        onError: (err, res) {
          Get.snackbar(
            " خطأ ${res.status}",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          Logger().i(err);
        });
  }

  /// check myads rules
  void checkMyAdsRules () async {
    EasyLoading.show();
    Map<String, dynamic> mymap = {
      "token":  "Bearer ${storage.read("token")}",
      "key": "myads",
      "owner_id":"${storage.read("ownerid")}",
    };

    repo.postWithImageMultipart<MyAdsRulesResponse>(
        path: 'employee/check_roles',
        fromJson: (json) => MyAdsRulesResponse.fromJson(json),
        json: mymap,
        onSuccess: (res) async {

          if(res.status==200){
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            if(res.data!.show==null||res.data!.show==false){
              showMyAds= false;
            }else{
              showMyAds= res.data!.show!;
            }
            print("showMyAds $showMyAds");
            update();

          }else{
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            // Get.snackbar(
            //   " خطأ ${res.status}",
            //   res.message.toString(),
            //   icon: const Icon(Icons.person, color: Colors.red),
            //   backgroundColor: Colors.yellow,
            //   snackPosition: SnackPosition.BOTTOM,);
          }
          update();
        },
        onError: (err, res) {
          Get.snackbar(
            " خطأ ${res.status}",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          Logger().i(err);
        });
  }

  /// check gallery rules
  void checkGalleryRules () async {
    EasyLoading.show();
    Map<String, dynamic> mymap = {
      "token":  "Bearer ${storage.read("token")}",
      "key": "gallery",
      "owner_id":"${storage.read("ownerid")}",
    };

    repo.postWithImageMultipart<GalleryRulesResponse>(
        path: 'employee/check_roles',
        fromJson: (json) => GalleryRulesResponse.fromJson(json),
        json: mymap,
        onSuccess: (res) async {

          if(res.status==200){
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            if(res.data!.show==null||res.data!.show==false){
              showGallery= false;
            }else{
              showGallery= res.data!.show!;
            }
            print("showGallery $showGallery");
            update();

          }else{
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            // Get.snackbar(
            //   " خطأ ${res.status}",
            //   res.message.toString(),
            //   icon: const Icon(Icons.person, color: Colors.red),
            //   backgroundColor: Colors.yellow,
            //   snackPosition: SnackPosition.BOTTOM,);
          }
          update();
        },
        onError: (err, res) {
          Get.snackbar(
            " خطأ ${res.status}",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          Logger().i(err);
        });
  }

  /// check reports rules subscriptions
  void checkReportsRules () async {
    EasyLoading.show();
    Map<String, dynamic> mymap = {
      "token":  "Bearer ${storage.read("token")}",
      "key": "reports",
      "owner_id":"${storage.read("ownerid")}",
    };

    repo.postWithImageMultipart<ReportsRulesResponse>(
        path: 'employee/check_roles',
        fromJson: (json) => ReportsRulesResponse.fromJson(json),
        json: mymap,
        onSuccess: (res) async {

          if(res.status==200){
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            if(res.data!.show==null||res.data!.show==false){
              showReports= false;
            }else{
              showReports= res.data!.show!;
            }
            print("showReports $showReports");
            update();

          }else{
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            // Get.snackbar(
            //   " خطأ ${res.status}",
            //   res.message.toString(),
            //   icon: const Icon(Icons.person, color: Colors.red),
            //   backgroundColor: Colors.yellow,
            //   snackPosition: SnackPosition.BOTTOM,);
          }
          update();
        },
        onError: (err, res) {
          Get.snackbar(
            " خطأ ${res.status}",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          Logger().i(err);
        });
  }

  /// check subscriptions rules
  void checkSubscriptionsRules () async {
    EasyLoading.show();
    Map<String, dynamic> mymap = {
      "token":  "Bearer ${storage.read("token")}",
      "key": "subscriptions",
      "owner_id":"${storage.read("ownerid")}",
    };

    repo.postWithImageMultipart<SubscriptionsRulesResponse>(
        path: 'employee/check_roles',
        fromJson: (json) => SubscriptionsRulesResponse.fromJson(json),
        json: mymap,
        onSuccess: (res) async {

          if(res.status==200){
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            if(res.data!.show==null||res.data!.show==false){
              showSubscriptions= false;
            }else{
              showSubscriptions= res.data!.show!;
            }
            print("showSubscriptions $showSubscriptions");
            update();

          }else{
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            // Get.snackbar(
            //   " خطأ ${res.status}",
            //   res.message.toString(),
            //   icon: const Icon(Icons.person, color: Colors.red),
            //   backgroundColor: Colors.yellow,
            //   snackPosition: SnackPosition.BOTTOM,);
          }
          update();
        },
        onError: (err, res) {
          Get.snackbar(
            " خطأ ${res.status}",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          Logger().i(err);
        });
  }

  /// check employees management rules
  void checkEmployeesManagementRules () async {
    EasyLoading.show();
    Map<String, dynamic> mymap = {
      "token":  "Bearer ${storage.read("token")}",
      "key": "employees_managment",
      "owner_id":"${storage.read("ownerid")}",
    };

    repo.postWithImageMultipart<MangeAdvertisersAccountsRulesResponse>(
        path: 'employee/check_roles',
        fromJson: (json) => MangeAdvertisersAccountsRulesResponse.fromJson(json),
        json: mymap,
        onSuccess: (res) async {

          if(res.status==200){
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            if(res.data!.show==null||res.data!.show==false){
              showEmployeesManagement= false;
            }else{
              showEmployeesManagement= res.data!.show!;
            }
            print("showEmployeesManagement $showEmployeesManagement");
            update();

          }else{
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            // Get.snackbar(
            //   " خطأ ${res.status}",
            //   res.message.toString(),
            //   icon: const Icon(Icons.person, color: Colors.red),
            //   backgroundColor: Colors.yellow,
            //   snackPosition: SnackPosition.BOTTOM,);
          }
          update();
        },
        onError: (err, res) {
          Get.snackbar(
            " خطأ ${res.status}",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          Logger().i(err);
        });
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
   /* Get.dialog(
        Dialog(
          child: Container(
            height: 100.0,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitThreeBounce(color: Colors.blue, size: 40,),
                new Text("من فضلك انتظر ....!",style: TextStyle(color: AppColors.advertiseNameColor,fontSize: 24.0,fontFamily: 'Arabic-Regular',fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        )
    );*/
    EasyLoading.show();
  //  var myToken  = await storage.read("token");
    client!.getMyProfile("Bearer "+myToken!).then((value) {
      Logger().i(value.data?.toJson());
      if(value.data!=null&&value.status==200){
       // Get.back();
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        if(value.data!=null) {
          clientProfileModel.value = value.data!;
        }
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}