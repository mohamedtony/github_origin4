import 'dart:async';
import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/AdsListModel.dart';
import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesModel.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesNameModel.dart';
import 'package:advertisers/app_core/network/models/FileModel.dart';
import 'package:advertisers/app_core/network/models/GetAdsFilterForm.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersFromModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersModel.dart';
import 'package:advertisers/app_core/network/models/SelectedNotSelectedFilterAdsType.dart';
import 'package:advertisers/app_core/network/models/SelectedNotSelectedSortType.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/GetAdsRequest.dart';
import 'package:advertisers/app_core/network/requests/GetAdvertisersRequest.dart';
import 'package:advertisers/app_core/network/responses/CreateAdvertiseRequestResponse.dart';
import 'package:advertisers/app_core/network/responses/GetAdsListResponse.dart';
import 'package:advertisers/app_core/network/responses/GetAdvertisersResponse.dart';
import 'package:advertisers/app_core/network/responses/customer_order_invoice_outputs_response.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/controller/request_advertise_controller.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as myDio;
import 'package:video_compress/video_compress.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdsPageController extends GetxController {
  var isLoading = true.obs;
  var isEmpty = false.obs;
  RxList<GetAdvertisersModel> advertisersModel = <GetAdvertisersModel>[].obs;
  var getAdsFilterForm = GetAdsFilterForm().obs;

  RxList<SelectedNotSelectedFilterAdsType> advertisersTopRated =
      <SelectedNotSelectedFilterAdsType>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  var isLoadingGetAdvertisersFromModel = true.obs;
  String? myToken;
   RxList<AdsListModel> adslistList = <AdsListModel>[].obs;
  RxList<Country> countriesForLocationSheet = <Country>[].obs;
  RxList<Area> areasForLocationSheet = <Area>[].obs;
  var selectedCountry = Country().obs;
  var selectedArea = Area().obs;
  var selectedChannel = Channel().obs;
  RxList<dynamic> selectedUserLocations = <dynamic>[].obs;
  var isFilterSavedClicked = false.obs;
  var isAreaEnabled = true.obs;
  var isCountryEnabled = true.obs;
  var selectedType = AdTypeModel().obs;
  late TextEditingController searchAdvertiserController;
  var selectedEffectSlidesModel = EffectSlidesModel(id: -1,).obs;
  late RequestAdvertiseController requestAdvertiseController;
  int lastPage = -1;
  int fromDistance = 0;
  int toDistance = 0;

  final PagingController<int, AdsListModel> pagingController = PagingController(firstPageKey: 1);
  String? type;

  @override
  Future<void> onInit() async {

    searchAdvertiserController = TextEditingController();
    pagingController.addPageRequestListener((pageKey) async {
      await fetchPage(pageKey);
    });

    super.onInit();


  }
  GetAdsRequest? getAdsRequest2 = GetAdsRequest(page: 1,user_id: 0);

  Future<List<AdsListModel>> getAdsListFromApi(
      {GetAdsRequest? getAdsRequest, int? pageKey}) async {
    String myToken = await storage.read("token");
    Logger().i(getAdsRequest2!.toJson());
    getAdsRequest2!.page = pageKey;
    GetAdsListResponse response = await client!.getAdsListHome2(getAdsRequest2!.toJson(),"Bearer " + myToken,);

    final completer = Completer<List<AdsListModel>>();
    List<AdsListModel> notifications = [];
    if(response.data!=null && response.data!.isNotEmpty) {
      notifications = response.data!;
      for(int i=0;i<response.data!.length;i++){
       print("mID"+response.data![i].id.toString());
      }
    }
    if(response.pagination?.last_page!=null){
      lastPage = response.pagination!.last_page!;
    }
    completer.complete(notifications);
    return completer.future;
    // return topSellingList;
  }


  Future<void> fetchPage(int pageKey,{GetAdsRequest? getAdsRequest,String? type}) async {
    try {
      List<AdsListModel>? newItems=[];
      getAdsRequest2!.page = pageKey;
      Logger().i(getAdsRequest2!.toJson());
      newItems = await getAdsListFromApi(pageKey: pageKey,getAdsRequest:getAdsRequest2 /*GetAdvertisersRequest(page: pageKey)*/);
      if (lastPage==pageKey) {
        pagingController.appendLastPage(newItems);
      } else {
        int nextPageKey = ++pageKey;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
  // Call this when the user pull down the screen
  Future<void> loadDataForAds() async {
    getAdsRequest2 = GetAdsRequest(page: 1,user_id: 0);
    pagingController.itemList=[];
    fetchPage(1);
  }

  Future<void> getAdsForm(BuildContext context) async {
    print("here");
    String myToken = await storage.read("token");
    client!.filterForm("Bearer " + myToken).then((value) {
      if (value.status == 200 && value.data != null) {
        getAdsFilterForm.value = value.data!;
        countriesForLocationSheet.value = getAdsFilterForm.value.countries!;
        if (countriesForLocationSheet[0].areas != null &&
            countriesForLocationSheet[0].areas!.isNotEmpty) {
          areasForLocationSheet.value = countriesForLocationSheet[0].areas!;
        }
        countriesForLocationSheet.insert(0, Country(id: -2, name: 'كل الدول'));
        countriesForLocationSheet.insert(0, Country(id: -1, name: 'إختر'));
        Area? areaIn = areasForLocationSheet
            .firstWhereOrNull((element) => element.id == -1);
        if (areaIn == null) {
          areasForLocationSheet.insert(0, Area(id: -2, name: 'كل المناطق'));
          areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
        }

        getAdsFilterForm.value.types?.insert(
            0, AdTypeModel(id: -1, name: 'ابحث عن الاعلان من خلال القسم'));
        advertisersTopRated.value = [];
        isLoadingGetAdvertisersFromModel.value = false;
        getAdsFilterForm.value.filters?.entries.forEach((element) {
          advertisersTopRated.add(
              SelectedNotSelectedFilterAdsType(
                name: element.value,
                key: element.key,
              ));
        });
      } else {
        isLoadingGetAdvertisersFromModel.value = false;
      }
    });
  }

  void changeCountry(Country? c) {
    Logger().i(c!.toJson());
    if (c != null && c.id == -2) {
      isAreaEnabled.value = false;
      selectedUserLocations.value = [];
      countriesForLocationSheet.forEach((countryForLocationSheet) {
        Country? categoryModel = selectedUserLocations
            .firstWhereOrNull((element) => element.id == c.id);
        if (categoryModel == null &&
            countryForLocationSheet.id != -1 &&
            countryForLocationSheet.id != -2 &&
            countryForLocationSheet.type != "country_category") {
          selectedUserLocations.add(countryForLocationSheet);
          //update();
        }
      });
    } else {
      if (c != null && c.id != -1) {
        if (selectedUserLocations.isNotEmpty) {
          //country and country
          if (selectedUserLocations[0] is Country &&
              selectedUserLocations[0].type == 'country_category') {
            if (c.type == 'country_category') {
              Country? country = selectedUserLocations
                  .firstWhereOrNull((element) => element.id == c.id);
              if (country == null) {
                selectedUserLocations.add(c);
              }
              isAreaEnabled.value = false;
            }
          } else {
            if (selectedUserLocations[0].type == 'country_category' &&
                c.type == 'country_category') {
              Country? country = selectedUserLocations
                  .firstWhereOrNull((element) => element.id == c.id);
              if (country == null) {
                selectedUserLocations.add(c);
              }
            }
          }
          if (selectedUserLocations[0] is Country &&
              selectedUserLocations[0].type == 'country') {
            if (c.type == 'country') {
              Country? country = selectedUserLocations
                  .firstWhereOrNull((element) => element.id == c.id);
              if (country == null) {
                selectedUserLocations.add(c);
              }
              isAreaEnabled.value = false;
            }
            /* if(selectedUserLocations.length==1){

            }*/
          }
        } else {
          print("inElse");
          Country? country = selectedUserLocations
              .firstWhereOrNull((element) => element.id == c.id);
          if (country == null) {
            isAreaEnabled.value = true;
            selectedUserLocations.add(c);
            /*if(c.areas!=null&&c.areas!.isNotEmpty) {
              areasForLocationSheet.value = c.areas!;
            }*/
          }
        }

        if (c.areas != null && c.areas!.isNotEmpty) {
          //isAreaEnabled.value = true;
          areasForLocationSheet.value = c.areas!;
          print("inElseHere");
          Area? areaIn = areasForLocationSheet
              .firstWhereOrNull((element) => element.id == -1);
          if (areaIn == null) {
            areasForLocationSheet.insert(0, Area(id: -2, name: 'كل المناطق'));
            areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
          }
        } else {
          areasForLocationSheet.value = [];
        }
      }/*else if(c!=null && c.id!=-1&& c.id!=-2){

      }*/
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
              Area? areaModel = selectedUserLocations
                  .firstWhereOrNull((element) => element.id == area.id);
              if (areaModel == null &&
                  areaForLocationSheet.id != -1 &&
                  areaForLocationSheet.id != -2) {
                selectedUserLocations.add(areaForLocationSheet);
                //update();
              }
            });
          } else {
            Area? areaIn = selectedUserLocations.firstWhereOrNull(
                    (element) => element.id == area.id && (element is Area));
            if (areaIn == null) {
              selectedUserLocations.add(area);
            }
            //selectedUserLocations.add(area);
            isCountryEnabled.value = false;
          }
        } else {
          if(area != null && area.id != -2) {
            Area? areaIn = selectedUserLocations.firstWhereOrNull(
                    (element) => element.id == area.id && (element is Area));
            if (areaIn == null) {
              selectedUserLocations.add(area);
            }
            isCountryEnabled.value = false;
          }else if(area.id == -2){
            isCountryEnabled.value = false;
            //selectedUserLocations.value = [];
            areasForLocationSheet.forEach((areaForLocationSheet) {
              Area? areaModel = selectedUserLocations
                  .firstWhereOrNull((element) => element.id == areaForLocationSheet.id);
              if (areaModel == null &&
                  areaForLocationSheet.id != -1 &&
                  areaForLocationSheet.id != -2) {
                selectedUserLocations.add(areaForLocationSheet);
                //update();
              }
            });
          }
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

  void onSelectedLocationClicked(int id) {

    dynamic country = selectedUserLocations.firstWhereOrNull((element) => element.id ==id);
    if(selectedUserLocations.length>=2 && selectedUserLocations[1] is Area && (country!=null && country is Country)) {
      // selectedUserLocations.removeWhere((element) => element.id == id);
      Fluttertoast.showToast(
        msg: " لا يمكن حذف الدولة لانها مرتبطة بالمناطق الرجاء حذف المناطق اولا",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.6),
        textColor: Colors.white,
        fontSize: 14.0,
      );
      return;

    }else{
      selectedUserLocations.removeWhere((element) => element.id == id);
    }
    if(selectedUserLocations.isEmpty){
      isAreaEnabled.value = true;
      isCountryEnabled.value = true;
      // areasForLocationSheet.value.clear();
      // areasForLocationSheet.insert(0, Area(id: -1,name: 'إختر'));
      selectedCountry.value = countriesForLocationSheet.first;
      if(areasForLocationSheet!=null && areasForLocationSheet.isNotEmpty) {
        selectedArea.value = areasForLocationSheet.first;
      }
      areasForLocationSheet.value = [];
      areasForLocationSheet.insert(0, Area(id: -1,name: 'إختر'));
    }else if(selectedUserLocations.value.length==1 && selectedUserLocations.value[0] is Country){
      print("jjjjjjjjjjjjjjjj");
      isAreaEnabled.value = true;
      isCountryEnabled.value = true;
      areasForLocationSheet.value = [];
      if(selectedUserLocations[0].areas!=null) {

        areasForLocationSheet.value = selectedUserLocations[0].areas;
        Area? area1 = areasForLocationSheet.firstWhereOrNull((element) => element.id==-2);
        if(area1==null) {
          areasForLocationSheet.insert(0, Area(id: -2, name: 'كل المناطق'));
        }
        Area? area = areasForLocationSheet.firstWhereOrNull((element) => element.id==-1);
        if(area==null) {
          areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
        }
      }
      selectedCountry.value = selectedUserLocations[0];
    }
    if(areasForLocationSheet!=null && areasForLocationSheet.isNotEmpty) {
      selectedArea.value = areasForLocationSheet[0];
    }
  }

  onDateClickedSaved(BuildContext context) {
    isFilterSavedClicked.value = true;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "تم حفظ البيانات بنجاح !",
          style: TextStyle(
              color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
        )));
    Get.back();
    isLoading.value = true;
    List<String>? sortByStrings = [];
    advertisersTopRated.forEach((element) {
      if (element.isSelected.isTrue) {
        sortByStrings.add(element.key!);
      }
    });
    List<int> categoriesId = [];
    if (selectedType.value != null &&
        selectedType.value.id != null &&
        selectedType.value.id != -1) {
      categoriesId.add(selectedType.value.id!);
    }
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
      if (element != null &&
          element is Country &&
          element.type == 'country_category') {
        print("isAreaEnabledHere country_category");
        countryCaregoriesIds.add(element.id!);
      }
    });
    Logger().i(GetAdsRequest(
        filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
        ads_types: categoriesId.isNotEmpty ? categoriesId.join(",") : null,
        country_category:
        countryCaregoriesIds.isNotEmpty ? countryCaregoriesIds.join(",") : null,
        countries: countriesId.isNotEmpty ? countriesId.join(",") : null,
        areas: areasIds.isNotEmpty ? areasIds.join(",") : null,
        distance_from: fromDistance==0?null:fromDistance,
        distance_to: toDistance==0?null:toDistance,
        name: searchAdvertiserController.text.isNotEmpty
            ? searchAdvertiserController.text
            : null)
        .toJson());
    type = "search";
    getAdsRequest2 = GetAdsRequest(
        user_id: 0,
        filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
        ads_types: categoriesId.isNotEmpty ? categoriesId.join(",") : null,
        country_category:
        countryCaregoriesIds.isNotEmpty ? countryCaregoriesIds.join(",") : null,
        countries: countriesId.isNotEmpty ? countriesId.join(",") : null,
        areas: areasIds.isNotEmpty ? areasIds.join(",") : null,
        distance_from: fromDistance==0?null:fromDistance,
        distance_to: toDistance==0?null:toDistance,
        name: searchAdvertiserController.text.isNotEmpty
            ? searchAdvertiserController.text
            : null);
    pagingController.refresh();
  }

  void showToast(msg) {
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
    isCountryEnabled.value = true;
    isAreaEnabled.value = true;
    areasForLocationSheet.value = [];
    areasForLocationSheet.value.insert(0,Area(id: -1,name: 'اختر'));
    selectedType.value = AdTypeModel();
    advertisersTopRated.value.forEach((element) {
      element.isSelected.value = false;
    });
    selectedType.value = AdTypeModel();
    selectedCountry.value = Country();
    selectedArea.value = Area();
    selectedChannel.value = Channel();
    selectedUserLocations.value = [];
    searchAdvertiserController.text = '';
    type = null;
    getAdsRequest2 = GetAdsRequest(page: 1);
    pagingController.refresh();
    selectedEffectSlidesModel.value = EffectSlidesModel();
  }

  RxInt indexClicked = RxInt(-1);
  var selectedAdvertiseId = -1;

  void changeIndex(int index, int bakaId) {
    print("inIndex" + indexClicked.value.toString());
    if (indexClicked.value == index) {
      indexClicked.value = -1;
      selectedAdvertiseId = -1;
      return;
    }
    indexClicked.value = index;
    selectedAdvertiseId = bakaId;
  }
}
