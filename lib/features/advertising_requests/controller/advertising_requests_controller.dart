import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:advertisers/app_core/network/models/GetMyRequestsFilterForm.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/SelectedNotSelectedFilterAdsType.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/GetMyRequestsModelRequest.dart';
import 'package:advertisers/app_core/network/responses/ListEmployeesModelResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/advertising_requests_response.dart';
import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide FormData , Response;
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'dart:io';


import 'package:logger/logger.dart';

import '../../../app_core/network/models/Country.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/date_picker.dart' as DateRangePicker;

DateFormat dateFormat = DateFormat("yyyy-MM-dd");
class AdvertisingRequestsController extends GetxController with StateMixin<AdvertisingRequestsResponse> {

  var isLoading = true.obs;
  var isEmpty = false.obs;
  var isLoadingGetAdvertisersFromModel = true.obs;
  String? myToken;
  RxList<Country> countriesForLocationSheet = <Country>[].obs;
  RxList<Area> areasForLocationSheet = <Area>[].obs;
  var selectedCountry = Country().obs;
  var selectedArea = Area().obs;
  RxList<dynamic> selectedUserLocations = <dynamic>[].obs;
  var isFilterSavedClicked = false.obs;
  var isAreaEnabled = true.obs;
  var isCountryEnabled = true.obs;
  RxList<SelectedNotSelectedFilterAdsType> advertisersTopRated = <SelectedNotSelectedFilterAdsType>[].obs;
  late TextEditingController searchAdvertiserController;

  bool? isRepricing = false;

  TextEditingController reasonController=TextEditingController();
  var reasonDataModel=ReasonDataModel().obs;
  var registerClientUserResponse=RegisterClientUserResponse().obs;
  var selectedCities = '0'.obs;

  List <Areas>? areas = [];
  List <int>? areasIds= [];
  List <String>? areasCities= [];

  void addRemoveCity({Areas?area}){
   if(areasIds!.contains(area!.id)){
     areas!.remove(area!);
     areasIds!.remove(area!.id);
     areasCities!.remove(area!.name);
   }else{
     areas!.add(area!);
     areasIds!.add(area!.id!);
     areasCities!.add(area!.name!);
   }
   update();
  }


  List<String>? sortTypesIds = [];

  void addRemoveSortTypes (String? id){
    if(sortTypesIds!.contains(id)){
      sortTypesIds!.remove(id);
    }else{
      sortTypesIds!.add(id!);
    }
    update();
  }

/*  void restAll(){
   parentRequests.clear();
    parentRequestsIds.clear();
    selectedCities = '0'.obs;
    areas!.clear();
    searchController.clear();
    areasIds!.clear();
    areasCities!.clear();
    sortTypesIds!.clear();
    endAdvertisingDate = ''.obs;
    dateStringTitle = 'اختر تاريخ محدد للطلب أو من - إلى'.obs;
    dateRange = DateRange(fromDate: "",toDate: "").obs;
    searchCustomerController.clear();
  }*/

  // late String token;
  // late Repository repo;

  final ApiService _apiService = Get.put(ApiService());

  int page = 0;
  var currentIndex=0.obs;
  List <ParentRequests> parentRequests = [];
  List<int> parentRequestsIds=[];




  List<int>? checkListClickProfile = [];
  void addAndRemoveOtherFromCheckProfile(id){
    checkListShare!.clear();
    checkListFunctions!.clear();
    if(checkListClickProfile!.contains(id)){
      checkListClickProfile!.clear();
    }else{
      checkListClickProfile!.clear();
      checkListClickProfile!.add(id);
      update();
    }

    update();
  }

  List<int>? checkListShare = [];

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
  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchCustomerController = TextEditingController();
  var search='';

  ScrollController scrollController = ScrollController();




  @override
  void onInit() {
    //restAll();
    searchAdvertiserController = TextEditingController();
    loadMore();
    fetchAdvertisingRequests(pageZero: false);
    super.onInit();
  }
  var getMyRequestsFilterForm = GetMyRequestsFilterForm().obs;
  Future<void> getAdsForm(BuildContext context) async {
    print("here");
    String myToken = await storage.read("token");
    client!.myRequestsFilterForm("Bearer " + myToken).then((value) {
      if (value.status == 200 && value.data != null) {
        getMyRequestsFilterForm.value = value.data!;
/*getMyRequestsFilterForm.value.sorts?.insert(
0, AdTypeModel(id: -1, name: 'ابحث عن الاعلان من خلال القسم'));*/
        advertisersTopRated.value = [];


        getMyRequestsFilterForm.value.filters?.entries.forEach((element) {
          advertisersTopRated.add(
              SelectedNotSelectedFilterAdsType(
                name: element.value,
                key: element.key,
              ));
        });


/*        getMyRequestsFilterForm.value.sorts?.entries.forEach((element) {
          requestsTypes.add(
              SelectedNotSelectedFilterAdsType(
                name: element.value,
                key: element.key,
              ));
        });

        requestsTypes.insert(
            0,
            SelectedNotSelectedFilterAdsType(
              name: "اختر ترتيب بحسب",
              key: "-1",
            ));*/
        isLoadingGetAdvertisersFromModel.value = false;
      } else {
        isLoadingGetAdvertisersFromModel.value = false;
      }
    });
  }

  void loadMore()async{
    scrollController?.addListener(() async {
      if (scrollController?.position.maxScrollExtent ==
          scrollController?.position.pixels) {
        fetchAdvertisingRequests(pageZero: false);
      }
    });
  }


  String? validatePhone(String phone){
    if (phone.isEmpty){
      return 'حقل الادخال فارغ';
    }
    return null;
  }


  /// confirmTransferService
  void confirmTransferService({int? requestId}) async {
    try {
      final dio.Response response = await _apiService.dioClient.get(
        'https://advertiser.cefour.com/api/v1/requests/$requestId/transfer/accept',
      );
      final data = AdvertisingRequestsResponse.fromJson(response.data);
      Get.snackbar(
        "${data.message}",
        "",
        snackPosition: SnackPosition.BOTTOM,);
      change(data, status: RxStatus.success());
      Logger().i(response!.data);
    } on dio.DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // Error occurred while fetching data
        change(null,
            status: RxStatus.error(
                'حدث خطأ ما ${error.response?.statusCode}'));
      } else if (error.error is SocketException) {
        change(null,
            status: RxStatus.error(
                'لا يوجد اتصال بالانترنت ${error.response?.statusCode}'));
      } else {
        String errorDescription = 'حدث خطأ ما حاول في وقت لاحق';
        change(null, status: RxStatus.error(errorDescription));
      }
    }
  }
  ///
  ///
  /// rejectTransferService
  void rejectTransferService({int? requestId}) async {
    try {
      final dio.Response response = await _apiService.dioClient.get(
        'https://advertiser.cefour.com/api/v1/requests/$requestId/transfer/reject',
      );
      final data = AdvertisingRequestsResponse.fromJson(response.data);
      Get.snackbar(
        "${data.message}",
        "",
        snackPosition: SnackPosition.BOTTOM,);
      change(data, status: RxStatus.success());
      Logger().i(response!.data);
    } on dio.DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // Error occurred while fetching data
        change(null,
            status: RxStatus.error(
                'حدث خطأ ما ${error.response?.statusCode}'));
      } else if (error.error is SocketException) {
        change(null,
            status: RxStatus.error(
                'لا يوجد اتصال بالانترنت ${error.response?.statusCode}'));
      } else {
        String errorDescription = 'حدث خطأ ما حاول في وقت لاحق';
        change(null, status: RxStatus.error(errorDescription));
      }
    }
  }
  ///
  ///
  /// advertiserConfirmService
  void advertiserConfirmService({int? requestId}) async {
    try {
      final dio.Response response = await _apiService.dioClient.get(
        'https://advertiser.cefour.com/api/v1/requests/$requestId/advertiser_confirm',
      );
      final data = AdvertisingRequestsResponse.fromJson(response.data);
      Get.snackbar(
        "${data.message}",
        "",
        snackPosition: SnackPosition.BOTTOM,);
      change(data, status: RxStatus.success());
      Logger().i(response!.data);
    } on dio.DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // Error occurred while fetching data
        change(null,
            status: RxStatus.error(
                'حدث خطأ ما ${error.response?.statusCode}'));
      } else if (error.error is SocketException) {
        change(null,
            status: RxStatus.error(
                'لا يوجد اتصال بالانترنت ${error.response?.statusCode}'));
      } else {
        String errorDescription = 'حدث خطأ ما حاول في وقت لاحق';
        change(null, status: RxStatus.error(errorDescription));
      }
    }
  }
  ///
  ///
  void rejectRequestService({int? requestId}) async {
    EasyLoading.show();
    FormData formData = FormData.fromMap({
      'reason': reasonController.text,
    });
    try {
      final dio.Response response = await _apiService.dioClient.post(
        'https://advertiser.cefour.com/api/v1/requests/$requestId/reject',
        data: formData,
      );
      final data = AdvertisingRequestsResponse.fromJson(response.data);
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar("${data.message}", "", snackPosition: SnackPosition.BOTTOM,);
      update();
      // change(data, status: RxStatus.success());
      Logger().i(response!.data);
    } on dio.DioError catch (error) {

      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "خطأ",
        error.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
    }
  }
  ///


  GetMyRequestsModelRequest? getMyRequestsModelRequest = GetMyRequestsModelRequest(page: 1,);

  /// fetchAdvertisingRequests
  void fetchAdvertisingRequests({bool? pageZero}) async {
    pageZero == true? page=1: page++;
    String myToken = await storage.read("token");
    getMyRequestsModelRequest!.page = page;
    client!.getMyRequestsAdvertising(getMyRequestsModelRequest!.toJson(), "Bearer " + myToken).then((value){
      if(value.data!=null) {
       //final data = AdvertisingRequestsResponse.fromJson(value);
        value!.data!.parentRequests!.forEach((request) {
          if (!parentRequestsIds.contains(request.id)) {
            parentRequests.add(request);
            parentRequestsIds.add(request.id!);
          }
        });

        print("parentRequests ==> lenght == > ${parentRequests.length}");
        //..
        // Successfully fetched news data
        change(value, status: RxStatus.success());
        Logger().i(value!.data);
      }
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          if (res?.statusCode == 401 || res?.statusCode == 422) {
            // Error occurred while fetching data
            change(null,
                status: RxStatus.error(
                    'حدث خطأ ما ${res?.statusCode}'));
          }  else {
            String errorDescription = 'حدث خطأ ما حاول في وقت لاحق';
            change(null, status: RxStatus.error(errorDescription));
          }
          return false;
          break;
        default:
          break;
      }
    });










/*    String url ='https://advertiser.cefour.com/api/v1/myrequests?page=$page&keyword=${searchController.text}&sort_by=${sortTypesIds!.join(",")}&from_date=${dateRange.value.fromDate}&to_date=${dateRange.value.toDate??""}&advertiser_name=${searchCustomerController.text}&areas=${areasCities!.join(",")}';
    print("XXXURLXXX+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.get(
        url,
      );
      final data = AdvertisingRequestsResponse.fromJson(response.data);
      data!.data!.parentRequests!.forEach((request) {
        if(!parentRequestsIds.contains(request.id)){
          parentRequests.add(request);
          parentRequestsIds.add(request.id!);
        }
      });

print("parentRequests ==> lenght == > ${parentRequests.length}");
      //..
      // Successfully fetched news data
      change(data, status: RxStatus.success());
      Logger().i(response!.data);
    } on dio.DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // Error occurred while fetching data
        change(null,
            status: RxStatus.error(
                'حدث خطأ ما ${error.response?.statusCode}'));
      } else if (error.error is SocketException) {
        change(null,
            status: RxStatus.error(
                'لا يوجد اتصال بالانترنت ${error.response?.statusCode}'));
      } else {
        String errorDescription = 'حدث خطأ ما حاول في وقت لاحق';
        change(null, status: RxStatus.error(errorDescription));
      }
    }*/
  }


  void checkSearch(){
    final isValid=searchFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    searchFormKey.currentState!.save();
    // loginClient();
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
              color: Colors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
        )));
    Get.back();
    isLoading.value = true;
    List<String>? sortByStrings = [];
    advertisersTopRated.forEach((element) {
      if (element.isSelected.isTrue) {
        sortByStrings.add(element.key!);
      }
    });
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
/*    Logger().i(GetAdsRequest(
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
    pagingController.refresh();*/
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
    advertisersTopRated.value.forEach((element) {
      element.isSelected.value = false;
    });
    selectedCountry.value = Country();
    selectedArea.value = Area();
    selectedUserLocations.value = [];
    searchAdvertiserController.text = '';
  }

  var dateRange = DateRange().obs;
  var fromDate1 = ''.obs;
  var toDate1 = ''.obs;
  var isDateSaveClicked  = false.obs;
  void addDateRange(String? fromDate,toDate){
    dateRange.value = DateRange(fromDate: fromDate,toDate: toDate) ;
    fromDate1.value = fromDate!;
    toDate1.value = toDate!;
    //endAdvertisingDate.value = toDate;
  }
  void addAdvertisingFromDate(String? fromDate){
    //fromAdvertisingDate.value = fromDate!;
    fromDate1.value = "";
    toDate1.value = "";
    fromDate1.value = fromDate!;
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
                  // _openGallery(context);
                  // isFixed.value = true;
                  //isFlixble.value = false;
                  fromDate1.value = "";
                  // fromAdvertisingDate.value = '2022-2-10';
                  dateRange.value = DateRange();

                  Future<void> _selectDate(
                      BuildContext context) async {
                    DateTime selectedDate;
                    if(fromDate1.isNotEmpty){
                      print("myDate"+fromDate1.value);
                      DateTime endAdvertisingDateCouponDate = DateTime.parse(fromDate1.value);
                      selectedDate = endAdvertisingDateCouponDate;
                    }else{
                      selectedDate = (DateTime.now()).add( Duration(days: 1));
                    }

                    final DateTime?
                    picked = await showDatePicker(
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        context: context,
                        initialDate:selectedDate,
                        firstDate: (DateTime.now()).subtract(
                            const Duration(days: 600)),
                        lastDate: (DateTime.now()).add(
                            const Duration(days: 600)));
                    // if (picked != null && picked != selectedDate)
                    if (picked != null &&
                        picked != selectedDate) {
                      addAdvertisingFromDate(
                          dateFormat.format(picked));
                      // controller.endAdvertisingDate = dateFormat.format(picked);
                    }
                    // selectedDate = picked;
                  }

                  _selectDate(context);

                },
                title: Text("تاريخ محدد"),
                // leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: () async {
                  //_openCamera(context);
                  final picked = await DateRangePicker.showDateRangePicker(
                    initialEntryMode:
                    DatePickerEntryMode.calendarOnly,
                    locale: const Locale('ar', 'EG'),
                    context: context,
                    firstDate: (DateTime.now()).subtract(
                        const Duration(days: 600)),
                    lastDate: (new DateTime.now())
                        .add(new Duration(days: 600)),
                  );
                  if (picked != null && picked != null) {
                    print(picked);
                    addDateRange(
                        "  "
                            "${dateFormat.format(picked.start)}"
                            "   ",
                        "  "
                            "${dateFormat.format(picked.end)}"
                            "   ");
                    // setState(() {
                    // });
                  }
                },
                title: Text("تاريخ مرن"),
                // leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

