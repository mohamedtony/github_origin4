import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/GetStopProfileResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class AdvertiserAccountStatusController extends GetxController {
  late TextEditingController caseController;
  late TextEditingController messageController;
  late Repository repo;
  List<int>? checkList = [];
  var textMessage=''.obs;
  var status='0'.obs;
  var from=''.obs;
  var to=''.obs;
  var getStopProfileResponse=GetStopProfileResponse().obs;
  var ranges=[].obs;
  void addRemoveCheckList(id) {
    if (checkList!.contains(id)) {
      checkList!.remove(id);
    } else {
      checkList!.add(id);
    }
    update();
  }


 var isChecked = false.obs;

  void changeChecked() {
    if (isChecked.value == false) {
      isChecked.value = true;
    } else {
      isChecked.value = false;
    }
    update();
  }


  GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  late TextEditingController searchController;
  var search = '';

  @override
  void onInit() {
    repo = Repository();
    messageController=TextEditingController();
    caseController=TextEditingController();
    // passIndex;
    getStopProfile();
    searchController = TextEditingController();
    super.onInit();
  }

  String? validatePhone(String phone) {
    if (phone.isEmpty) {
      return 'حقل الادخال فارغ';
    }
    return null;
  }


  void checkSearch() {
    final isValid = searchFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    searchFormKey.currentState!.save();
    // loginClient();
  }


   getStopProfile() {
  EasyLoading.show();


  repo.get<GetStopProfileResponse>(
      path: 'profile/stop',
      fromJson: (json) => GetStopProfileResponse.fromJson(json),
      json: {"token": "Bearer  156|EQUdZIpAmMfekHG0ZO1GQpkAdCtglYF9xj8vNo36"},
      onSuccess: (res) {
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        getStopProfileResponse.value.data = res.data!;
        status.value=res.data!.settings?.stop_account??'0';
        ranges.value=res.data!.reasons??[];
        textMessage.value=res.data!.settings?.stop_text??'';
        from.value=res.data!.settings?.stop_from.toString()??'';
        to.value=res.data!.settings?.stop_to.toString()??'';
        getStopProfileResponse.value.data = res.data!;

        update();
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
      });
}

  postStopProfile() {
    EasyLoading.show();


    repo.postWithImageMultipart<GetStopProfileResponse>(
        path: 'profile/stop',
        fromJson: (json) => GetStopProfileResponse.fromJson(json),
        json: {"token": "Bearer  156|EQUdZIpAmMfekHG0ZO1GQpkAdCtglYF9xj8vNo36",
        "stop_account":"1" ,
          "stop_reason_id":"1",
          "stop_from":from.value,
          "stop_to":to.value,
          "stop_text":messageController.text
        },
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "نجاح",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
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
        });
  }
     @override
  void onClose() {
    searchController.dispose();

    super.onClose();
  }
}


