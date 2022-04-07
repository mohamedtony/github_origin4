import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/ReasonModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/GetCancelReasonsResponse.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RejectRequestResponse.dart';
import 'package:advertisers/app_core/network/responses/ShowAddsListResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyAddsController extends GetxController{

  var addsList=<AddModel>[].obs;
  var currentIndex=0.obs;
  var reasons=<ReasonModel>[].obs;
  var reasonDataModel=ReasonDataModel().obs;
   final _verticalGroupValue=''.obs;
 // late ValueNotifier<String> _verticalGroupValue;
  // var myRequestAsClient
   List<int>? checkListShare = [];
   var registerClientUserResponse=RegisterClientUserResponse().obs;
   TextEditingController reasonController=TextEditingController();
  void addAndRemoveOtherFromCheckListShare(id){
    if(checkListShare!.contains(id)){
      checkListShare!.clear();
    }else{
      checkListShare!.clear();
      checkListShare!.add(id);
      update();
    }

    update();
  }
  List<int>? checkListFunctions = [];


  void openSingleItemFromCheckListFunctions(id){
    checkListShare!.clear();
    checkListFunctions!.clear();
    checkListFunctions!.add(id);
    update();
  }


  void closeSingleItemFromCheckListFunctions(id){
    checkListShare!.clear();
    checkListFunctions!.clear();
    // checkListFunctions!.add(id);
    update();
  }




  void addAndRemoveOtherFromCheckListFunctions(id){
    if(checkListFunctions!.contains(id)){
      checkListFunctions!.clear();
    }else{
      checkListFunctions!.clear();
      checkListFunctions!.add(id);
      update();
    }
    update();
  }




  int tabId = 1;
  void passIndex(newIndex){
    tabId = newIndex;
    update();
  }





  GlobalKey<FormState> searchFormKey=GlobalKey<FormState>();
  late TextEditingController searchController;
  var search='';
 late Repository repo;
 late String token;
  @override
  void onInit() {
    // passIndex;
    repo=Repository();
    token =storage.read("token");
    searchController=TextEditingController();
    getRequestsData();
    super.onInit();
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
  }


  int currentPage = 1;

  late int totalPages=0;

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
    repo.get<ShowAddsListResponse>(
        path: 'ads',
        fromJson: (json) => ShowAddsListResponse.fromJson(json),
         json: {"token": "Bearer $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if (isRefresh) {
            addsList.value = res.data??[];
              }else{
            addsList.addAll(res.data??[]);
              }
              currentPage++;
              totalPages = res.pagination?.total??0;

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

  void refuseRequest({required int requestId}) {
    EasyLoading.show();
    Repository repo = Repository();

    repo.postWithImageMultipart<RegisterClientUserResponse>(
        path: 'requests/$requestId/reject',
        fromJson: (json) => RegisterClientUserResponse.fromJson(json),
        json: {
          "token": "Bearer $token",
          "reason": reasonController.text,
        },
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          registerClientUserResponse.value = res;

          //Get.toNamed('/chooseBakaPage');
        },
        onError: (err, res) {

          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            err.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });
  }
  void cancelRequest({required int requestId}) {
    EasyLoading.show();
    Repository repo = Repository();

    repo.postWithImageMultipart<RegisterClientUserResponse>(
        path: 'requests/$requestId/cancel',
        fromJson: (json) => RegisterClientUserResponse.fromJson(json),
        json: {
          "token": "Bearer $token",
          "reason": _verticalGroupValue.value,
        },
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          // registerClientUserResponse.value = res;
          Get.snackbar(
            "نجاح",
            "تم الالغاء بنجاح",
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          //Get.toNamed('/chooseBakaPage');
        },
        onError: (err, res) {

          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            err.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });
  }

  void getClientConfirm({required int requestId}) {
    EasyLoading.show();
    Repository repo = Repository();

    repo.get<RejectRequestResponse>(
        path: 'requests/$requestId/confirm',
        fromJson: (json) => RejectRequestResponse.fromJson(json),
        json: {
          "token": "Bearer $token",
        },
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          reasonDataModel.value = res.data!;

          //Get.toNamed('/chooseBakaPage');
        },
        onError: (err, res) {

          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            err.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });
  }
  void getClientConfirmBill({required int requestId}) {
    EasyLoading.show();
    Repository repo = Repository();

    repo.get<RejectRequestResponse>(
        path: 'requests/$requestId/bill_confirm',
        fromJson: (json) => RejectRequestResponse.fromJson(json),
        json: {
          "token": "Bearer $token",
        },
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "نجاح",
            "تم بنجاح",
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);

          //Get.toNamed('/chooseBakaPage');
        },
        onError: (err, res) {

          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            err.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });
  }
  void getClientCancelReasons({required int requestId,context}) {
    EasyLoading.show();
    Repository repo = Repository();

    repo.get<GetCancelReasonsResponse>(
        path: 'requests/$requestId/cancel_reasons',
        fromJson: (json) => GetCancelReasonsResponse.fromJson(json),
        json: {
          "token": "Bearer $token",
        },
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

         reasons.value=res.data??[];
         List<String> reasonStr=[];
         for(ReasonModel res in reasons){
           reasonStr.add(res.reason!);
         }
          //Get.toNamed('/chooseBakaPage');
          update();
           Alert(
              context: context,
              //type: AlertType.warning,
              title: "الغاء الطلب",
              content:SizedBox(
              height: 300,
              child: ListView(
              children: [

               Obx(()=> RadioGroup<String>.builder(
                groupValue: _verticalGroupValue.value,
                onChanged: (values) {
                  _verticalGroupValue.value= values! ;
                  // update();
                },textStyle: TextStyle(color: Colors.deepOrange,decorationColor: Colors.red),
         // activeColor: Colors.red,
                  spacebetween: 50,
          items: reasonStr,
          itemBuilder: (item) => RadioButtonBuilder(
          item.toString(),
          ),
          direction: Axis.vertical,
         // ),
              )),
          ],
          ),
          ),
          // desc: "Flutter is more awesome with RFlutter Alert.",
          buttons: [
          DialogButton(
          child: Text(
          "حفظ",
          style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
           cancelRequest(requestId: requestId);
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
          ),
          DialogButton(
          child: Text(
          "رجوع",
          style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
          Color.fromRGBO(116, 116, 191, 1.0),
          Color.fromRGBO(52, 138, 199, 1.0)
          ]),
          )
          ],
          ).show();
        },
        onError: (err, res) {

          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            err.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });
  }
  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
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
      title: "طلباتي"
  ),
  UpperTabItem(
      id: 1,
      title: "أرشيف طلباتي"
  ),
];


