import 'dart:io';

import 'package:advertisers/app_core/network/models/GetAdvertisersModel.dart';
import 'package:advertisers/app_core/network/requests/GetAdvertisersRequest.dart';
import 'package:advertisers/main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class FindAdvertiseController extends GetxController {
  var isLoading = true.obs;
  var isEmpty = false.obs;
  RxList<GetAdvertisersModel> advertisersModel = <GetAdvertisersModel>[].obs;
  String?  myToken;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    myToken = await storage.read("token");
    client!.getAdvertisers("Bearer "+myToken!,GetAdvertisersRequest()).then((value){
      if(value.status==200 && value.data!=null && value.data!.isNotEmpty){
        isLoading.value = false;
        isEmpty.value = false;
        advertisersModel.value = value.data!;
      }else{
        isLoading.value = false;
        isEmpty.value = true;
      }
    });

    super.onInit();
  }
}
