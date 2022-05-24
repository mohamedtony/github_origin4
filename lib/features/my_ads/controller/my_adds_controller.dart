import 'dart:io';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/GetMyRequestsFilterForm.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/ReasonModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/models/SelectedNotSelectedFilterAdsType.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/GetAdsRequest.dart';
import 'package:advertisers/app_core/network/requests/GetMyRequestsModelRequest.dart';
import 'package:advertisers/app_core/network/responses/GetCancelReasonsResponse.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RejectRequestResponse.dart';
import 'package:advertisers/app_core/network/responses/RepostAdsResponse.dart';
import 'package:advertisers/app_core/network/responses/ShowAddsListResponse.dart';
import 'package:advertisers/app_core/network/responses/ShowEmployeeDetailsResponse%20.dart';
import 'package:advertisers/app_core/network/responses/ShowOnAppResponse.dart';
import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/wallet_module/Response/wallet_card_toggle_response.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_file_view/flutter_file_view.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:dio/dio.dart' as dio;
import 'package:advertisers/features/request_advertise_module/view/widgets/date_picker.dart' as DateRangePicker;

import '../../../app_core/network/models/Country.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd");
class MyAddsController extends GetxController /*with StateMixin<ShowAddsListResponse>*/{

  var addsList=<AddModel>[].obs;
  var addsListIds=<int>[].obs;
  var currentIndex=0.obs;
  var reasons=<ReasonModel>[].obs;
  var reasonDataModel=ReasonDataModel().obs;
   final _verticalGroupValue=''.obs;
 // late ValueNotifier<String> _verticalGroupValue;
  // var myRequestAsClient
   List<int>? checkListShare = [];
   var registerClientUserResponse=RegisterClientUserResponse().obs;
   TextEditingController reasonController=TextEditingController();


  var isLoading = true.obs;
  var isEmpty = false.obs;

  RxList<SelectedNotSelectedFilterAdsType> advertisersTopRated =
      <SelectedNotSelectedFilterAdsType>[].obs;

  RxList<SelectedNotSelectedFilterAdsType> requestsTypes =
      <SelectedNotSelectedFilterAdsType>[].obs;
  var selectedNotSelectedFilterAdsType = SelectedNotSelectedFilterAdsType().obs;
  var isLoadingGetAdvertisersFromModel = true.obs;
  String? myToken;
  RxList<dynamic> selectedUserLocations = <dynamic>[].obs;
  var isFilterSavedClicked = false.obs;
  var isAreaEnabled = true.obs;
  var isCountryEnabled = true.obs;
  //var selectedType = AdTypeModel().obs;
  late TextEditingController searchAdvertiserController;
  int lastPage = -1;
  int fromDistance = 0;
  int toDistance = 0;


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



  final ApiService _apiService = Get.put(ApiService());

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
    searchAdvertiserController=TextEditingController();
    searchController=TextEditingController();
    //getRequestsData();
  //  fetchAdsList(pageZero: false);
    getAdsData();
    super.onInit();
  }
  String? validatePhone(String phone){
    if (phone.isEmpty){
      return 'حقل الادخال فارغ';
    }
    return null;
  }
  ScrollController scrollController = ScrollController();

  void loadMore()async{
    scrollController?.addListener(() async {
      if (scrollController?.position.maxScrollExtent ==
          scrollController?.position.pixels) {
       // fetchAdsList(pageZero: false);
        getAdsData(isRefresh: true);
      }
    });
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
  int page = 0;
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

          Logger().i(res.data);
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


  void getAdsData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
      }
    }
    EasyLoading.show();


    getAdsRequest2!.page = currentPage;
    Logger().i(getAdsRequest2!.toJson());
    client!.getMyAdsAdvertiserMenue(getAdsRequest2!.toJson(),"Bearer " + token!).then((res) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }

      if (isRefresh) {
        addsList.value = res.data ??[];
      }else{
        addsList.addAll(res.data??[]);
      }

      currentPage++;

      totalPages = res.pagination?.total??0;

      // print(response.body);
      //setState(() {});
      update();
      return true;
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          Logger().e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          if( res?.statusMessage!=null) {
            Get.snackbar(
              "خطأ",
              res!.statusMessage.toString(),
              icon: const Icon(Icons.person, color: Colors.red),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.BOTTOM,);
          }
          return false;
          break;
        default:
          break;
      }
    });

/*    EasyLoading.show();
    repo.get<ShowAddsListResponse>(
        path: 'myads',
        fromJson: (json) => ShowAddsListResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }


          Logger().i(res.data);
          // res.data!.forEach((request) {
          //   if(!addsList.contains(request.id)){
          //     addsList.add(request);
          //     addsListIds.add(request.id!);
          //   }
          // });

          if (isRefresh) {
            addsList.value = res.data??[];
          }else{
            addsList.value.addAll(res.data??[]);
          }

          currentPage++;
          totalPages = res.pagination?.total??0;

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
        });*/


  }


  void deleteAnAds({int? id}) async {
    EasyLoading.show();
    repo.delete<ShowOnAppResponse>(
        path: 'ads/$id',
        fromJson: (json) => ShowOnAppResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) async{
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          Logger().i(res.data);
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if(res.status==200){
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }

            Get.snackbar("حسنا",
              "تم حذف الاعلان بنجاح",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);

            //fetchAdsList();
            getAdsData(isRefresh: true);
            update();

          }else{
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            Get.snackbar(
              "خطأ",
              res.message.toString(),
              icon: const Icon(Icons.person, color: Colors.red),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.BOTTOM,);
          }

          getAdsData(isRefresh: true);
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


  /// show ads On App
  void showOnApp({int? id}) async {
    EasyLoading.show();
    repo.get<ShowOnAppResponse>(
        path: 'ads/$id/show_app',
        fromJson: (json) => ShowOnAppResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) async{
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          Logger().i(res.data);
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if(res.data!.show==0){
            Get.snackbar("حسنا",
              "تم تنشيط عرض المنصة",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
          }else if(res.data!.show==1){
            Get.snackbar("حسنا",
              "تم ايقاف عرض المنصة",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
          }
          update();
         // fetchAdsList(pageZero: false);
          getAdsData(isRefresh: true);
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


  /// show ads On profile
  void showOnProfile({int? id}) async {
    EasyLoading.show();
    repo.get<ShowOnAppResponse>(
        path: 'ads/$id/show_profile',
        fromJson: (json) => ShowOnAppResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) async{
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          Logger().i(res.data);
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if(res.data!.show==0){
            Get.snackbar("حسنا",
              "تم تنشيط عرض البروفايل",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
          }else if(res.data!.show==1){
            Get.snackbar("حسنا",
              "تم ايقاف عرض البروفايل",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
          }
          //fetchAdsList(pageZero: false);
          getAdsData(isRefresh: true);
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


  /// repost ads
  void repostAds({int? id}) async {
    EasyLoading.show();

    repo.get<RepostAdsResponse>(
        path: 'ads/$id/repost',
        fromJson: (json) => RepostAdsResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) async{
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          Logger().i(res.data);
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if(res.status ==200){
            Get.snackbar("حسنا",
              "${res.message}",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
          }else  {
            Get.snackbar("حسنا",
              "${res.message}",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
          }
         // fetchAdsList(pageZero: false);
          getAdsData(isRefresh: true);
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



  var getMyRequestsFilterForm = GetMyRequestsFilterForm().obs;
  RxList<Country> countriesForLocationSheet = <Country>[].obs;
  RxList<Area> areasForLocationSheet = <Area>[].obs;
  var selectedCountry = Country().obs;
  var selectedArea = Area().obs;
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


        getMyRequestsFilterForm.value.sorts?.entries.forEach((element) {
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
            ));
        countriesForLocationSheet.value = getMyRequestsFilterForm.value.countries!;
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
        isLoadingGetAdvertisersFromModel.value = false;
      } else {
        isLoadingGetAdvertisersFromModel.value = false;
      }
    });
  }
  GetAdsRequest? getAdsRequest2 = GetAdsRequest(page: 1,user_id: 0);
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

    print("====================>"+searchAdvertiserController.text);
    print("====================>"+searchController.text);
    Logger().i(GetAdsRequest(
        filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
        date_from: fromDate1.isNotEmpty?fromDate1.value : null,
        date_to: toDate1.isNotEmpty?toDate1.value : null,
        name: searchAdvertiserController.text.isNotEmpty
            ? searchAdvertiserController.text
            : null)
        .toJson()
    );
    getAdsRequest2 = GetAdsRequest(
        filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
        date_from: fromDate1.isNotEmpty?fromDate1.value : null,
        date_to: toDate1.isNotEmpty?toDate1.value : null,
        name: searchAdvertiserController.text.isNotEmpty
            ? searchAdvertiserController.text
            : null);
    //pagingController.refresh();
    //refreshController.resetNoData();
    getAdsData(isRefresh: true);
  }

  void onReturnClicked(BuildContext context) {
    isFilterSavedClicked.value = false;
    advertisersTopRated.value.forEach((element) {
      element.isSelected.value = false;
    });
    selectedUserLocations.value = [];
    searchAdvertiserController.text = '';
    selectedNotSelectedFilterAdsType.value = SelectedNotSelectedFilterAdsType();
    fromDate1.value = "";
    toDate1.value = "";
    getAdsRequest2 = GetAdsRequest(page: 1,);
    getAdsData(isRefresh: true);
    Get.back();
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
                    firstDate:  (DateTime.now()).subtract(
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


