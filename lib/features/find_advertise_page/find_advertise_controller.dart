import 'dart:io';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesModel.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesNameModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersFromModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersModel.dart';
import 'package:advertisers/app_core/network/models/SelectedNotSelectedSortType.dart';
import 'package:advertisers/app_core/network/requests/GetAdvertisersRequest.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:logger/logger.dart';

//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class FindAdvertiseController extends GetxController {
  var isLoading = true.obs;
  var isEmpty = false.obs;
  RxList<GetAdvertisersModel> advertisersModel = <GetAdvertisersModel>[].obs;
  var advertisersFormModel = GetAdvertisersFromModel().obs;

  RxList<SelectedNotSelectedSortType> advertisersTopRated = <SelectedNotSelectedSortType>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  var isLoadingGetAdvertisersFromModel = true.obs;
  String?  myToken;


  List<String> images=['الاسرع ردا','الاقدم','الاحدث','الاعلى تقييما','الاعلى تقييما'];
  List<String> sections=['ابحث عن المعلن من خلال القسم','الاقدم','الاعلى تقييما','الاعلى تقييما','الاعلى تقييما'];
  List<String> socials=['سناب شات','الاقدم','الاعلى تقييما','الاعلى تقييما','الاعلى تقييما'];
  //List<String> numbers=['من 1000 الى 2000','الاقدم','الاعلى تقييما','الاعلى تقييما','الاعلى تقييما'];
  final List<String> ranges = [
    '100 - 1000',
    '1000 - 10000',
    '10000 - 100000',
    '100000 - 1000000'
  ];
  List<String> countries=['الدولة','الاقدم','الاعلى تقييما','الاعلى تقييما','الاعلى تقييما'];
  List<String> cities=['المدينة','الاقدم','الاعلى تقييما','الاعلى تقييما','الاعلى تقييما'];
  List<String> selectedCities=['مكة','جدة','الرياض'];


  //location range
  RxList<Country> countriesForLocationSheet = <Country>[].obs;
  RxList<Area> areasForLocationSheet = <Area>[].obs;
  var selectedCountry  = Country().obs;
  var selectedArea  = Area().obs;
  var selectedChannel  = Channel().obs;
  RxList<dynamic> selectedUserLocations = <dynamic>[].obs;
  var isFilterSavedClicked  = false.obs;
  var isAreaEnabled = true.obs;
  var isCountryEnabled = true.obs;
  var selectedCategory = CategoryModel().obs;
  late TextEditingController searchAdvertiserController;
  var selectedEffectSlidesModel= EffectSlidesModel().obs;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    myToken = await storage.read("token");
    searchAdvertiserController = TextEditingController();
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

  void getAdvertisersForm(BuildContext context) {
    print("here");
    client!.getAdvertisersForm("Bearer "+myToken!).then((value){
      if(value.status==200 && value.data!=null){
        print("hereHerre");

          advertisersFormModel.value = value.data!;
          countriesForLocationSheet.value = advertisersFormModel.value.countries!;
         /* countriesForLocationSheet.forEach((element) {
            Logger().i(element.toJson());
          });*/
          if(countriesForLocationSheet[0].areas!=null&&countriesForLocationSheet[0].areas!.isNotEmpty) {
            areasForLocationSheet.value =
            countriesForLocationSheet[0].areas!;

          }
          countriesForLocationSheet.insert(0, Country(id: -2,name: 'كل الدول'));
          countriesForLocationSheet.insert(0, Country(id: -1,name: 'إختر'));
          Area? areaIn = areasForLocationSheet.firstWhereOrNull((
              element) => element.id == -1);
          if(areaIn==null) {
            areasForLocationSheet.insert(0, Area(id: -2, name: 'كل المناطق'));
            areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
          }

        advertisersFormModel.value.categories?.insert(0, CategoryModel(id: -1,name: 'ابحث عن المعلن من خلال القسم'));
        advertisersFormModel.value.channels?.insert(0, Channel(id: -1,name: 'اختر'));
        advertisersFormModel.value.effect_slides?.insert(0, EffectSlidesModel(id: -1,name: EffectSlidesNameModel(ar: 'اختر')));
       // advertisersFormModel.value.countries?.insert(0, Country(id: -1,name: 'اختر'));
        advertisersTopRated.value=[];
        isLoadingGetAdvertisersFromModel.value = false;
        advertisersTopRated.add(SelectedNotSelectedSortType(name: advertisersFormModel.value.sort_types!.reply_speed!,key: "reply_speed",));
        advertisersTopRated.add(SelectedNotSelectedSortType(name: advertisersFormModel.value.sort_types!.oldest!,key: "oldest",));
        advertisersTopRated.add(SelectedNotSelectedSortType(name: advertisersFormModel.value.sort_types!.latest!,key: "latest",));
        advertisersTopRated.add(SelectedNotSelectedSortType(name: advertisersFormModel.value.sort_types!.top_rated!,key: "top_rated",));
        advertisersTopRated.add(SelectedNotSelectedSortType(name: advertisersFormModel.value.sort_types!.most_ads!,key: "most_ads",));
        advertisersTopRated.add(SelectedNotSelectedSortType(name: advertisersFormModel.value.sort_types!.most_followers!,key: "most_followers",));
        advertisersTopRated.add(SelectedNotSelectedSortType(name: advertisersFormModel.value.sort_types!.less_folloers!,key: "less_folloers",));
      }else{
        isLoadingGetAdvertisersFromModel.value = false;
      }
    });
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
            areasForLocationSheet.insert(0, Area(id: -2, name: 'كل المناطق'));
            areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
          }
        } else {
          areasForLocationSheet.value = [];
        }
      }
    }

  }

  void changeArea(Area? area) {
    if(area!=null && area.id!=-1) {
      if (selectedUserLocations.isNotEmpty) {
        //country and country
        if (selectedUserLocations[0] is Country &&
            selectedUserLocations.length == 1) {
          if(area.id==-2){
            isCountryEnabled.value = false;
            //selectedUserLocations.value = [];
            areasForLocationSheet.forEach((areaForLocationSheet) {
              Area? areaModel = selectedUserLocations.firstWhereOrNull((element) => element.id==area.id);
              if(areaModel==null && areaForLocationSheet.id!=-1&& areaForLocationSheet.id!=-2 ){
                selectedUserLocations.add(areaForLocationSheet);
                //update();
              }
            });
          }else {
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

/*    if(c?.areas!=null && c!.areas!.isNotEmpty) {
      areasForLocationSheet.value =
      c.areas!;
    }else{
      areasForLocationSheet.value = [];
    }*/
  }

  onDateClickedSaved(BuildContext context) {
    isFilterSavedClicked.value = true;
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم حفظ البيانات بنجاح !",style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),)));
    Get.back();
    isLoading.value = true;
    List<String> sortByStrings=[];
    advertisersTopRated.forEach((element) {
      if(element.isSelected.isTrue) {
        sortByStrings.add(element.key!);
      }
    });
    List<int> categoriesId = [];
    if(selectedCategory.value!=null && selectedCategory.value.id!=null &&selectedCategory.value.id!=-1){
      categoriesId.add(selectedCategory.value.id!);
    }
    List<int> countriesId= [];
    List<int> areasIds= [];
    List<int> countryCaregoriesIds= [];
    selectedUserLocations.forEach((element) {
      if(element!=null && element is Country && element.type=='country') {
        countriesId.add(element.id!);
      }
      if(element!=null && element is Area) {
        areasIds.add(element.id!);
      }
      if(element!=null && element is Country && element.type=='country_category') {
        print("isAreaEnabledHere country_category");
        countryCaregoriesIds.add(element.id!);
      }
    });
    Logger().i(GetAdvertisersRequest(sort_by: sortByStrings.isNotEmpty?sortByStrings[0]:null,categories: categoriesId.isNotEmpty?categoriesId:null,
        country_category: countryCaregoriesIds.isNotEmpty?countryCaregoriesIds:null,countries: countriesId.isNotEmpty?countriesId:null,areas: areasIds.isNotEmpty?areasIds:null,keyword: searchAdvertiserController.text.isNotEmpty?searchAdvertiserController.text:null).toJson());
    client!.getAdvertisers("Bearer "+myToken!,GetAdvertisersRequest(sort_by: sortByStrings.isNotEmpty?sortByStrings[0]:null,categories: categoriesId.isNotEmpty?categoriesId:null,
        country_category: countryCaregoriesIds.isNotEmpty?countryCaregoriesIds:null,countries: countriesId.isNotEmpty?countriesId:null,areas: areasIds.isNotEmpty?areasIds:null,keyword: searchAdvertiserController.text.isNotEmpty?searchAdvertiserController.text:null)).then((value){
      if(value.status==200 && value.data!=null && value.data!.isNotEmpty){
        isLoading.value = false;
        isEmpty.value = false;
        advertisersModel.value = value.data!;
      }else{
        isLoading.value = false;
        isEmpty.value = true;
      }
    });
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

  void onReturnClicked(BuildContext context) {
    isFilterSavedClicked.value = false;
    selectedCategory.value=CategoryModel();
    advertisersTopRated.value.forEach((element) {
      element.isSelected.value = false;
    });
    selectedCategory.value = CategoryModel();
    selectedCountry.value = Country();
    selectedArea.value = Area();
    selectedChannel.value = Channel();
    selectedUserLocations.value = [];
    searchAdvertiserController.text ='';
    selectedEffectSlidesModel.value = EffectSlidesModel();
  }
}
