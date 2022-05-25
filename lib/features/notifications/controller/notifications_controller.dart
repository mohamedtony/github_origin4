
import 'package:advertisers/app_core/network/models/GetMyRequestsFilterForm.dart';
import 'package:advertisers/app_core/network/models/NotificationsModel.dart';
import 'package:advertisers/app_core/network/models/SelectedNotSelectedFilterAdsType.dart';
import 'package:advertisers/app_core/network/models/StarNotificationModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/GetAdsRequest.dart';
import 'package:advertisers/app_core/network/requests/GetMyRequestsModelRequest.dart';
import 'package:advertisers/app_core/network/requests/GetNotificationRequest.dart';
import 'package:advertisers/app_core/network/responses/AccountSettingRulesResponse.dart';
import 'package:advertisers/app_core/network/responses/GeneralResponse.dart';
import 'package:advertisers/app_core/network/responses/NotificationsResponse.dart';
import 'package:advertisers/app_core/network/responses/StarMessageResponse.dart';
import 'package:advertisers/app_core/network/responses/StarNotificationResponse.dart';
import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/date_picker.dart' as DateRangePicker;

DateFormat dateFormat = DateFormat("yyyy-MM-dd");
enum NotificationType {
  platform,
  orders,
  hiring,
  wallet,
  payment,
  chat,
  comments,
  settings,
  ads,
  coupons,
  support,
  reports,
  accounts,
  subscriptions
}
class NotificationsController extends GetxController {
  late String token;
  var notifications=<NotificationsModel>[].obs;

  @override
  void onInit() {
   token =storage.read('token');
   getNotifications();
    super.onInit();
  }
  var selectedIndex=0.obs;
  var confirm=false.obs;
  int currentPage = 1;

  late int totalPages=0;

  //List<RequestModel> myRequests = [];
  GetNotificationRequest? getAdsRequest2 = GetNotificationRequest(page: 1);
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);
   getNotifications({bool isRefresh = false}) async {
     if (isRefresh) {
       currentPage = 1;
     } else {
       if (currentPage >= totalPages) {
         refreshController.loadNoData();
         return false;
       }
     }
    EasyLoading.show();

     getAdsRequest2!.page = currentPage;
     //getAdsRequest2!.user_id = user.id;
     Logger().i(getAdsRequest2!.toJson());
     client!.getNotifications(getAdsRequest2!.toJson(),"Bearer " + token!).then((res) {
       if (EasyLoading.isShow) {
         EasyLoading.dismiss();
       }

       if (isRefresh) {
         notifications.value = res.data ??[];
       }else{
         notifications.addAll(res.data??[]);
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



/*    Repository repo=Repository();
    repo.get<NotificationsResponse>(path: 'notifications',fromJson:(json) => NotificationsResponse.fromJson(json),
        json:{"token":"Bearer $token",},onSuccess:(res) {

          if(EasyLoading.isShow){
            EasyLoading.dismiss();
          }
        notifications.value=res.data??[];
update();
return true;
        },onError: (err,res){

          if(EasyLoading.isShow){
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            err.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          return true;
        });*/
     return true;
  }

  // void read(int index) {
  //   notifications[index].read = true;
  //   update();
  // }
  //
  void remove(int index) {
    notifications.removeAt(index);
    update();
  }
  //
  // void pin(int index) {
  //   notifications[index].pinned = !notifications[index].pinned;
  //   notifications.sort((a, b) {
  //     if (b.pinned) {
  //       return 1;
  //     } else {
  //       return -1;
  //     }
  //   });
  //   update();
  // }

  bool checked = false;
  void termsCheckBox(bool value) {
    checked = value;
    update();
  }

  var getMyRequestsFilterForm = GetMyRequestsFilterForm().obs;

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

  Future<void> getAdsForm(BuildContext context) async {
    print("here");
    String myToken = await storage.read("token");
    client!.notifications_form("Bearer " + myToken).then((value) {
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
        isLoadingGetAdvertisersFromModel.value = false;
      } else {
        isLoadingGetAdvertisersFromModel.value = false;
      }
    });
  }
 // GetMyRequestsModelRequest? getMyRequestsModelRequest = GetMyRequestsModelRequest(page: 1,);
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

    Logger().i(GetNotificationRequest(
        filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
        sort: selectedNotSelectedFilterAdsType.value.key!="-1"?selectedNotSelectedFilterAdsType.value.key:null,
        from_date: fromDate1.isNotEmpty?fromDate1.value : null,
        to_date: toDate1.isNotEmpty?toDate1.value : null,
       )
        .toJson());
     getAdsRequest2 = GetNotificationRequest(
        filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
        from_date: fromDate1.isNotEmpty?fromDate1.value : null,
        to_date: toDate1.isNotEmpty?toDate1.value : null,
        sort: selectedNotSelectedFilterAdsType.value.key!="-1"?selectedNotSelectedFilterAdsType.value.key:null,
        );
    getNotifications(isRefresh: true);
  }

  void onReturnClicked(BuildContext context) {
    isFilterSavedClicked.value = false;
    advertisersTopRated.value.forEach((element) {
      element.isSelected.value = false;
    });
    selectedUserLocations.value = [];
    selectedNotSelectedFilterAdsType.value = SelectedNotSelectedFilterAdsType();
    fromDate1.value = "";
    toDate1.value = "";
    getAdsRequest2 = GetNotificationRequest(page: 1,);
    getNotifications(isRefresh: true);
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


  void starMessage({required int notificationId}) {
    EasyLoading.show();
    Repository repo = Repository();

    repo.get<StarMessageResponse>(
        path: 'notifications/$notificationId/star',
        fromJson: (json) => StarMessageResponse.fromJson(json),
        json: {
          "token": "Bearer $token",

        },
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          notifications[selectedIndex.value].starred=res.data?.starred??0;
          update();
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

void deleteMessage({required int notificationId}) {
  EasyLoading.show();
  Repository repo = Repository();

  repo.get<AccountSettingRulesResponse>(
      path: 'notifications/$notificationId/delete',
      fromJson: (json) => AccountSettingRulesResponse.fromJson(json),
      json: {
        "token": "Bearer $token",

      },
      onSuccess: (res) {
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        notifications.removeAt(selectedIndex.value);
        update();
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
}