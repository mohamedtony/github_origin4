import 'dart:io';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/ChannelsAndAreasResponse.dart';
import 'package:advertisers/app_core/network/responses/ChannelsResponse.dart';
import 'package:advertisers/app_core/network/responses/FormChannelsAndAreas.dart';
import 'package:advertisers/features/add_advertiser_channel/add_advertiser_channel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:advertisers/shared/loading_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart' as dio;
import 'package:logger/logger.dart';

import '../../../main.dart';

class AddAdvertiserChannelController extends GetxController {
  static dio.MultipartFile? photo;
  var choosedChannel=''.obs;
  var clientProfileModel = ClientProfileModel().obs;
  var channelId=0.obs;
  var flag = false.obs;
  var isEnabled=false.obs;
  var isAreaEnabled = true.obs;
  var isCountryEnabled = true.obs;
  var isLoading = true.obs;
  var isLoadingLocation = true.obs;
  //location range
  RxList<Country> countriesForLocationSheet = <Country>[].obs;
  RxList<Area> areasForLocationSheet = <Area>[].obs;
  RxList<Channel> basicChannels=<Channel>[].obs;
  RxList<Area> channelsAreas=<Area>[].obs;
  var savedFile=File(' ').obs;
  var imageBase641=''.obs;
  var selectedRange = '0'.obs;
 late TextEditingController accountNameController;
  late TextEditingController linkController;
  var selectedMenPercentage = '0'.obs;
  var selectedWomenPercentage = '0'.obs;
  var selectedBoysPercentage = '0'.obs;
  var selectedGirlsPercentage = '0'.obs;
  var linkMes = ''.obs;
  var country = Country().obs;
  var area = Area().obs;
  var areas=[].obs;
  // var areasIds=[].obs;
  // var countriesIds=[].obs;
  var countries=<Country>[].obs;
  late String token;
  late Repository repo;
  RxList<dynamic> selectedUserLocations = <dynamic>[].obs;
  GlobalKey<FormState> addAdvertiserChannelControllerKeyForm = GlobalKey<FormState>(debugLabel: 'addAdvertiserChannelControllerKeyForm');
 @override
 void onInit() {
   repo=Repository();
   token =storage.read("token");
   accountNameController=TextEditingController();
   linkController=TextEditingController();
   getBasicChannelsForm();
   //getChannelsAreas();
   // client!.getCountries().then((value) {
   //   if (value.data != null) {
   //     countries.value = value.data!;
   //     print(value.data![0].name);
   //     Logger().i(value.data);
   //     update();
   //   }
   // });
   // client!.getCountries().then((value){
   //   if(value.data!=null){
   //     countries.value = value.data!;
   //     countries.value.forEach((element) {
   //       Logger().i(element.toJson());
   //     });
   //     Country? countryIn = countries.firstWhereOrNull((element) => element.id==clientProfileModel.value.country_id);
   //     if(countryIn!=null){
   //       country.value = countryIn;
   //       if(countryIn.areas!=null) {
   //         areas.value = countryIn.areas!;
   //         Area? areaIn = countryIn.areas?.firstWhereOrNull((
   //             element) => element.id == clientProfileModel.value.area_id);
   //
   //         if(areaIn!=null){
   //           print("areaIn"+areaIn.name!);
   //           area.value = areaIn;
   //         }else{
   //           area.value = countryIn.areas![1];
   //         }
   //       }
   //     }else{
   //       countryIn = countries.value[1];
   //       if(countryIn.areas!=null) {
   //         areas.value = countryIn.areas!;
   //         Area? areaIn = countryIn.areas?.firstWhereOrNull((
   //             element) => element.id == clientProfileModel.value.area_id);
   //
   //         if(areaIn!=null){
   //           print("areaIn"+areaIn.name!);
   //           area.value = areaIn;
   //         }else{
   //           area.value = countryIn.areas![1];
   //         }
   //       }
   //     }
   //   }
   // });

   client!.getCountries().then((value){
     isLoadingLocation.value = false;
     if(value.data!=null){
       countriesForLocationSheet.value = value.data!;
       countriesForLocationSheet.forEach((element) {
         Logger().i(element.toJson());
       });
       if(countriesForLocationSheet[0].areas!=null&&countriesForLocationSheet[0].areas!.isNotEmpty) {
         areasForLocationSheet.value =
         countriesForLocationSheet[0].areas!;

       }
       countriesForLocationSheet.insert(0, Country(id: -2,name: '???? ??????????'));
       countriesForLocationSheet.insert(0, Country(id: -1,name: '????????'));
       Area? areaIn = areasForLocationSheet.firstWhereOrNull((
           element) => element.id == -1);
       if(areaIn==null) {
         areasForLocationSheet.insert(0, Area(id: -2, name: '???? ??????????????'));
        // areasForLocationSheet.insert(0, Area(id: -2, name: ''));
         areasForLocationSheet.insert(0, Area(id: -1, name: '????????'));
       }
/*        Country? countryIn = countriesForLocationSheet.firstWhereOrNull((element) => element.id==clientProfileModel.value.country_id);
        if(countryIn!=null){
          countryForLocationSheet.value = countryIn;
          if(countryIn.areas!=null) {
            areas.value = countryIn.areas!;
            areas.insert(0, Area(id: -1,name: '??????????????'));
            Area? areaIn = countryIn.areas?.firstWhereOrNull((
                element) => element.id == clientProfileModel.value.area_id);

            if(areaIn!=null){
              print("areaIn"+areaIn.name!);
              area.value = areaIn;
            }else{
              area.value = countryIn.areas![1];
            }
          }
        }else{
          countryIn = countriesForLocationSheet.value[2];
          countryForLocationSheet.value = countryIn;
          if(countryIn.areas!=null) {
            areas.value = countryIn.areas!;
            Area? areaIn = countryIn.areas?.firstWhereOrNull((
                element) => element.id == clientProfileModel.value.area_id);

            if(areaIn!=null){
              print("areaIn"+areaIn.name!);
              areaForLocationSheet.value = areaIn;
            }else{
              areaForLocationSheet.value = countryIn.areas![1];
            }
          }
        }*/
     }
   });
   super.onInit();
 }


  String? validateAccountName(String name){
    if (name.length<5){
      return '?????? ???????????? ???? ?????? 5 ????????';
    }
      return null;


  }
  String? validateLink(String link){
    String pattern =
        r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:??????,.;]*)?)';
    RegExp regExp = RegExp(pattern);
    if (link.isEmpty) {
      return linkMes.value="?????? ?????????? ????????";
    } else if (!(regExp.hasMatch(link))) {
      return linkMes.value="?????????? ???????? ?????? ???? ???????? ???? www";
    } else {
      return linkMes.value='';
    }


  }
  List<int>? checkList = [];
  List<int>? checkCitiesCountriesIds = [];
  List <CitiesCountries> citiesCountriesController = [

  ];

  void addToList (item){
    if(!checkCitiesCountriesIds!.contains(item.id)){
      checkCitiesCountriesIds!.add(item.id);
      citiesCountriesController.add(CitiesCountries(id: item.id,name: item.name));
    }
    update();
  }

  void removeFromList (item){
    citiesCountriesController.remove(item);
    update();
  }

  void addRemoveCheckList(id){
    if(checkList!.contains(id)){
      checkList!.remove(id);
    }else{
      checkList!.add(id);
    }
    update();
  }

  void removeCountryOrArea(dynamic countryOrArea) {
    selectedUserLocations.removeWhere((element) =>element==countryOrArea);
    if(selectedUserLocations.length==0){
      isCountryEnabled.value = true;
      isAreaEnabled.value = true;
    }
  }

  void changeCountry(Country? c) {
    if(c!=null && c.id==-2) {
      isAreaEnabled.value = false;
      selectedUserLocations.value = [];
      countriesForLocationSheet.forEach((countryForLocationSheet) {
        Country? categoryModel = selectedUserLocations.firstWhereOrNull((element) => element.id==c.id);
        if(categoryModel==null && countryForLocationSheet.id!=-1&& countryForLocationSheet.id!=-2 && countryForLocationSheet.type!="country_category"){
          selectedUserLocations.add(countryForLocationSheet);
          //update();
        }
      });
    }else{
      if(c!=null && c.id!=-1) {
        if (selectedUserLocations.isNotEmpty) {
          //country and country
          if (selectedUserLocations[0] is Country && selectedUserLocations[0].type=='country_category') {
            if (c.type=='country_category') {
              Country? country = selectedUserLocations.firstWhereOrNull((
                  element) => element.id == c.id);
              if (country == null) {
                selectedUserLocations.add(c);
              }
              isAreaEnabled.value = false;
            }
          } else {
            if (selectedUserLocations[0].type=='country_category' && c.type=='country_category') {
              Country? country = selectedUserLocations.firstWhereOrNull((
                  element) => element.id == c.id);
              if (country == null) {
                selectedUserLocations.add(c);
              }
            }
          }
          if (selectedUserLocations[0] is Country && selectedUserLocations[0].type=='country') {
            if (c.type=='country') {
              Country? country = selectedUserLocations.firstWhereOrNull((
                  element) => element.id == c.id);
              if (country == null) {
                selectedUserLocations.add(c);
              }
              isAreaEnabled.value = false;
            }
          }
        } else {
          Country? country = selectedUserLocations.firstWhereOrNull((
              element) => element.id == c.id);
          if (country == null) {
            selectedUserLocations.add(c);
          }

        }

        if (c.areas != null && c.areas!.isNotEmpty) {
          areasForLocationSheet.value =
          c.areas!;
          Area? areaIn = areasForLocationSheet.firstWhereOrNull((
              element) => element.id == -1);
          if(areaIn==null) {
            areasForLocationSheet.insert(0, Area(id: -2, name: '???? ??????????????'));
            //areasForLocationSheet.insert(0, Area(id: -2, name: ''));
            areasForLocationSheet.insert(0, Area(id: -1, name: '????????'));
          }
        } else {
          areasForLocationSheet.value = [];
        }
      }
    }

  }

  void changeArea(Area? area) {
    if (area != null && area.id != -1) {
      if (selectedUserLocations.isNotEmpty) {
        //country and country
        if (selectedUserLocations[0] is Country &&
            selectedUserLocations.length == 1) {
          if (area.id == -2) {
            isCountryEnabled.value = false;
            //selectedUserLocations.value = [];
            areasForLocationSheet.forEach((areaForLocationSheet) {
              Area? areaModel = selectedUserLocations.firstWhereOrNull((
                  element) => element.id == area.id);
              if (areaModel == null && areaForLocationSheet.id != -1 &&
                  areaForLocationSheet.id != -2) {
                selectedUserLocations.add(areaForLocationSheet);
                //update();
              }
            });
          } else {
            Area? areaIn = selectedUserLocations.firstWhereOrNull((
                element) => element.id == area.id && (element is Area));
            if (areaIn == null) {
              selectedUserLocations.add(area);
            }
            //selectedUserLocations.add(area);
            isCountryEnabled.value = false;
          }
        } else {
          Area? areaIn = selectedUserLocations.firstWhereOrNull((
              element) => element.id == area.id && (element is Area));
          if (areaIn == null) {
            selectedUserLocations.add(area);
          }
          isCountryEnabled.value = false;
        }
      }
    }
  }

    bool isChecked = false;
  void changeChecked() {
    if (isChecked == false) {
      isChecked = true;
    } else {
      isChecked = false;
    }
    update();
  }
  getChannelsAreas(){


      EasyLoading.show();
      Repository repo = Repository();

      repo.get<ChannelsAndAreasResponse>(
          path: 'profile/channels/form',
          fromJson: (json) => ChannelsAndAreasResponse.fromJson(json),
          json: {"token":"Bearer  $token"},
          onSuccess: (res) {
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            areas.value=res.data?.areas??[];
          },
          onError: (err, res) {

            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            Get.snackbar(
              "??????",
              res.message.toString(),
              icon: const Icon(Icons.person, color: Colors.red),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.BOTTOM,);
          });


  }
  getBasicChannelsForm(){

    EasyLoading.show();


    repo.get<FormChannelsAndAreas>(
        path: 'profile/channels/form',
        fromJson: (json) => FormChannelsAndAreas.fromJson(json),
        json: {"token":"Bearer  $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          basicChannels.value=res.data?.channels??[];


        },
        onError: (err, res) {

          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "??????",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });

  }
  addChannel(){
    if (int.parse(selectedMenPercentage.value)+int.parse(selectedWomenPercentage.value)+
        int.parse(selectedBoysPercentage.value)+int.parse(selectedGirlsPercentage.value)>100){
      Get.snackbar(
        "??????",
        "?????????? ?????????? ?????? ???? ???? ?????????? ????????????",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
    }else {
if(channelId.value==0){
  Get.snackbar(
    "??????????",
    "?????? ???????????? ????????",
    icon: const Icon(Icons.person, color: Colors.red),
    backgroundColor: Colors.yellow,
    snackPosition: SnackPosition.BOTTOM,);
  return;
} if(accountNameController.text.isEmpty){
  Get.snackbar(
    "??????????",
    "?????? ?????? ????????????",
    icon: const Icon(Icons.person, color: Colors.red),
    backgroundColor: Colors.yellow,
    snackPosition: SnackPosition.BOTTOM,);
  return;
} if(linkController.text.isEmpty){
  Get.snackbar(
    "??????????",
    "?????? ?????? ???????? ????????????",
    icon: const Icon(Icons.person, color: Colors.red),
    backgroundColor: Colors.yellow,
    snackPosition: SnackPosition.BOTTOM,);
  return;
} if(selectedRange.value.isEmpty||selectedRange.value=='0'){
  Get.snackbar(
    "??????????",
    "?????? ???????????? ?????? ??????????????????",
    icon: const Icon(Icons.person, color: Colors.red),
    backgroundColor: Colors.yellow,
    snackPosition: SnackPosition.BOTTOM,);
  return;
}
if(isCountryEnabled.value) {
  print("isCountryEnabledHere");
  List<int> countriesId = [];
  List<int> areasIds = [];
  List<int> countryCaregoriesIds = [];
  selectedUserLocations.forEach((element) {
    if (element != null && element is Country && element.type == 'country') {
      countriesId.add(element.id!);
    }
    if (element != null && element is Area) {
      areasIds.add(element.id!);
    }
    if (element != null && element is Country &&
        element.type == 'country_category') {
      print("isAreaEnabledHere country_category");
      countryCaregoriesIds.add(element.id!);
    }
  });

// if(selectedMenPercentage.value.isEmpty){
//   Get.snackbar(
//     "??????????",
//     "?????? ???????????? ???????? ????????????",
//     icon: const Icon(Icons.person, color: Colors.red),
//     backgroundColor: Colors.yellow,
//     snackPosition: SnackPosition.BOTTOM,);
//   return;
// } if(selectedWomenPercentage.value.isEmpty){
//   Get.snackbar(
//     "??????????",
//     "?????? ???????????? ???????? ????????????",
//     icon: const Icon(Icons.person, color: Colors.red),
//     backgroundColor: Colors.yellow,
//     snackPosition: SnackPosition.BOTTOM,);
//   return;
// }
// if(selectedBoysPercentage.value.isEmpty){
//   Get.snackbar(
//     "??????????",
//     "?????? ???????????? ???????? ????????????",
//     icon: const Icon(Icons.person, color: Colors.red),
//     backgroundColor: Colors.yellow,
//     snackPosition: SnackPosition.BOTTOM,);
//   return;
// }
// if(selectedGirlsPercentage.value.isEmpty){
//   Get.snackbar(
//     "??????????",
//     "?????? ???????????? ???????? ??????????????",
//     icon: const Icon(Icons.person, color: Colors.red),
//     backgroundColor: Colors.yellow,
//     snackPosition: SnackPosition.BOTTOM,);
//   return;
// }
  EasyLoading.show();
  Repository repo = Repository();

  repo.postWithImageMultipart<ChannelsResponse>(
      path: 'profile/channels/add',
      fromJson: (json) => ChannelsResponse.fromJson(json),
      json: {"token": "Bearer  $token",
        "channel_id": channelId.value,
        "name": accountNameController.text,
        "link": linkController.text,
        "followers_from": int.parse(selectedRange.value.substring(
            0, selectedRange.value.lastIndexOf('-') - 1)),
        "followers_to": int.parse(selectedRange.value.substring(
            selectedRange.value.lastIndexOf('-') + 2)),
        "men": int.parse(selectedMenPercentage.value),
        "women": int.parse(selectedWomenPercentage.value),
        "boys": int.parse(selectedBoysPercentage.value),
        "girls": int.parse(selectedGirlsPercentage.value),
        "areas": areasIds,
        "countries": countriesId,
        "type": "ads"
      },
      onSuccess: (res) {
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar(
          "????????",
          res.message.toString(),
          icon: const Icon(Icons.person, color: Colors.red),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
        Get.offAndToNamed('/AdvertiserSettingsPage');
      },
      onError: (err, res) {
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar(
          "??????",
          res.message.toString(),
          icon: const Icon(Icons.person, color: Colors.red),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
      });
}}
  }

  editChannel(){
    if(channelId.value==0){
      Get.snackbar(
        "??????????",
        "?????? ???????????? ????????",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
      return;
    } if(accountNameController.text.isEmpty){
      Get.snackbar(
        "??????????",
        "?????? ?????? ????????????",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
      return;
    } if(linkController.text.isEmpty){
      Get.snackbar(
        "??????????",
        "?????? ?????? ???????? ????????????",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
      return;
    } if(selectedRange.value.isEmpty||selectedRange.value=='0'){
      Get.snackbar(
        "??????????",
        "?????? ???????????? ?????? ??????????????????",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
      return;
    }
    if(isCountryEnabled.value) {
      print("isCountryEnabledHere");
      List<int> countriesId = [];
      List<int> areasIds = [];
      List<int> countryCaregoriesIds = [];
      selectedUserLocations.forEach((element) {
        if (element != null && element is Country &&
            element.type == 'country') {
          countriesId.add(element.id!);
        }
        if (element != null && element is Area) {
          areasIds.add(element.id!);
        }
        if (element != null && element is Country &&
            element.type == 'country_category') {
          print("isAreaEnabledHere country_category");
          countryCaregoriesIds.add(element.id!);
        }
      });

      // if(selectedMenPercentage.value.isEmpty||selectedMenPercentage.value=='0'){
      //   Get.snackbar(
      //     "??????????",
      //     "?????? ???????????? ???????? ????????????",
      //     icon: const Icon(Icons.person, color: Colors.red),
      //     backgroundColor: Colors.yellow,
      //     snackPosition: SnackPosition.BOTTOM,);
      //   return;
      // } if(selectedWomenPercentage.value.isEmpty){
      //   Get.snackbar(
      //     "??????????",
      //     "?????? ???????????? ???????? ????????????",
      //     icon: const Icon(Icons.person, color: Colors.red),
      //     backgroundColor: Colors.yellow,
      //     snackPosition: SnackPosition.BOTTOM,);
      //   return;
      // }
      // if(selectedBoysPercentage.value.isEmpty){
      //   Get.snackbar(
      //     "??????????",
      //     "?????? ???????????? ???????? ????????????",
      //     icon: const Icon(Icons.person, color: Colors.red),
      //     backgroundColor: Colors.yellow,
      //     snackPosition: SnackPosition.BOTTOM,);
      //   return;
      // }
      // if(selectedGirlsPercentage.value.isEmpty){
      //   Get.snackbar(
      //     "??????????",
      //     "?????? ???????????? ???????? ??????????????",
      //     icon: const Icon(Icons.person, color: Colors.red),
      //     backgroundColor: Colors.yellow,
      //     snackPosition: SnackPosition.BOTTOM,);
      //   return;
      // }
      EasyLoading.show();
      Repository repo = Repository();

      repo.postWithImageMultipart<ChannelsResponse>(
          path: 'profile/channels/add',
          fromJson: (json) => ChannelsResponse.fromJson(json),
          json: {"token": "Bearer  $token",
            "channel_id": channelId.value,
            "name": accountNameController.text,
            "link": linkController.text,
            "followers_from": int.parse(selectedRange.value.substring(
                0, selectedRange.value.lastIndexOf('-') - 1)),
            "followers_to": int.parse(selectedRange.value.substring(
                selectedRange.value.lastIndexOf('-') + 2)),
            "men": int.parse(selectedMenPercentage.value),
            "women": int.parse(selectedWomenPercentage.value),
            "boys": int.parse(selectedBoysPercentage.value),
            "girls": int.parse(selectedGirlsPercentage.value),
            "areas": areasIds,
            "countries": countriesId,
          },
          onSuccess: (res) {
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            Get.snackbar(
              "????????",
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
              "??????",
              res.message.toString(),
              icon: const Icon(Icons.person, color: Colors.red),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.BOTTOM,);
          });
    }
  }


  @override
  void onClose() {

    super.onClose();
  }


}



