import 'dart:io';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
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
  var channelId=0.obs;
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
  var areas=[].obs;
  var areasIds=[].obs;
  var countriesIds=[].obs;
  var countries=<Country>[].obs;
  late String token;
  late Repository repo;
 @override
 void onInit() {
   repo=Repository();
   token =storage.read("token");
   accountNameController=TextEditingController();
   linkController=TextEditingController();
   getBasicChannelsForm();
   //getChannelsAreas();
   client!.getCountries().then((value) {
     if (value.data != null) {
       countries.value = value.data!;
       print(value.data![0].name);
       Logger().i(value.data);
       update();
     }
   });

   super.onInit();
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
              "خطأ",
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
            "خطأ",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });

  }
  addChannel(){

    EasyLoading.show();
    Repository repo = Repository();

    repo.postWithImageMultipart<ChannelsResponse>(
        path: 'profile/channels/add',
        fromJson: (json) => ChannelsResponse.fromJson(json),
        json: {"token":"Bearer  $token",
          "channel_id":channelId.value,
          "name":accountNameController.text,
       "link":linkController.text,
     "followers_from":int.parse(selectedRange.value.substring(0,selectedRange.value.lastIndexOf('-')-1)),
     "followers_to":int.parse(selectedRange.value.substring(selectedRange.value.lastIndexOf('-')+2)),
     "men":int.parse(selectedMenPercentage.value),
     "women":int.parse(selectedWomenPercentage.value),
     "boys":int.parse(selectedBoysPercentage.value),
     "girls":int.parse(selectedGirlsPercentage.value),
          "areas":areasIds,
          "countries":countriesIds,
          "type":"ads"
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
          Get.toNamed('/Home');

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

  editChannel(){

    EasyLoading.show();
    Repository repo = Repository();

    repo.postWithImageMultipart<ChannelsResponse>(
        path: 'profile/channels/add',
        fromJson: (json) => ChannelsResponse.fromJson(json),
        json: {"token":"Bearer  $token",
          "channel_id":channelId.value,
          "name":accountNameController.text,
          "link":linkController.text,
          "followers_from":int.parse(selectedRange.value.substring(0,selectedRange.value.lastIndexOf('-')-1)),
          "followers_to":int.parse(selectedRange.value.substring(selectedRange.value.lastIndexOf('-')+2)),
          "men":int.parse(selectedMenPercentage.value),
          "women":int.parse(selectedWomenPercentage.value),
          "boys":int.parse(selectedBoysPercentage.value),
          "girls":int.parse(selectedGirlsPercentage.value),
          "areas":areasIds,
          "countries":countriesIds
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

    super.onClose();
  }


}



