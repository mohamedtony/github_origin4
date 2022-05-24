import 'package:advertisers/app_core/network/models/AdsListModel.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/GetMyRequestsFilterForm.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/models/SelectedNotSelectedFilterAdsType.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/GetAdsRequest.dart';
import 'package:advertisers/app_core/network/requests/GetMyRequestsModelRequest.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_file_view/flutter_file_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/date_picker.dart' as DateRangePicker;

DateFormat dateFormat = DateFormat("yyyy-MM-dd");
class MyOrdersArchiveController extends GetxController{
  var myRequestsAsClient=<RequestModel>[].obs;
  var currentIndex=0.obs;
  // var myRequestAsClient
  List<int>? checkListShare = [];
  var registerClientUserResponse=RegisterClientUserResponse().obs;
  List<int>? checkList = [];
  late Repository repo;
  late String token;
  void addAndRemoveOtherFromCheckList(id){
    if(checkList!.contains(id)){
      checkList!.clear();
    }else{
      checkList!.clear();
      checkList!.add(id);
      update();
    }

    update();
  }
  int tabId = 1;
  void passIndex(newIndex){
    tabId = newIndex;
    update();
  }

  var isLoading = true.obs;
  var isEmpty = false.obs;

  RxList<SelectedNotSelectedFilterAdsType> advertisersTopRated =
      <SelectedNotSelectedFilterAdsType>[].obs;

  RxList<SelectedNotSelectedFilterAdsType> requestsTypes =
      <SelectedNotSelectedFilterAdsType>[].obs;
  var selectedNotSelectedFilterAdsType = SelectedNotSelectedFilterAdsType().obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  var isLoadingGetAdvertisersFromModel = true.obs;
  String? myToken;
  RxList<AdsListModel> adslistList = <AdsListModel>[].obs;
  RxList<dynamic> selectedUserLocations = <dynamic>[].obs;
  var isFilterSavedClicked = false.obs;
  var isAreaEnabled = true.obs;
  var isCountryEnabled = true.obs;
  //var selectedType = AdTypeModel().obs;
  late TextEditingController searchAdvertiserController;
  int lastPage = -1;
  int fromDistance = 0;
  int toDistance = 0;



  GlobalKey<FormState> searchFormKey=GlobalKey<FormState>();
  late TextEditingController searchController;
  var search='';

  @override
  void onInit() {
    // passIndex;
    repo=Repository();
    token =storage.read("token");
    searchController=TextEditingController();
    searchAdvertiserController = TextEditingController();
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
    // loginClient();
  }

  int currentPage = 1;

  late int totalPages=0;

  //List<RequestModel> myRequests = [];

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

    Logger().i(getMyRequestsModelRequest!.toJson());
    getMyRequestsModelRequest!.archive = 1;
    getMyRequestsModelRequest!.page = currentPage;
   client!.getMyRequests(getMyRequestsModelRequest!.toJson(),"Bearer " + token!).then((res) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }

      if (isRefresh) {
        myRequestsAsClient.value = res.data?.requests??[];
      }else{
        myRequestsAsClient.addAll(res.data?.requests??[]);
      }

      currentPage++;

      totalPages = res.data?.pagination?.total??0;

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


/*    repo.get<MyRequestsResponse>(
        path: 'myrequests?archive=1',
        fromJson: (json) => MyRequestsResponse.fromJson(json),
        json: {"token": "Bearer $token"},//"Bearer  $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if (isRefresh) {
            myRequestsAsClient.value = res.data?.requests??[];
          }else{
            myRequestsAsClient.addAll(res.data?.requests??[]);
          }

          currentPage++;

          totalPages = res.data?.pagination?.total??0;

          // print(response.body);
          //setState(() {});
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
        });*/

    return false;
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
  GetMyRequestsModelRequest? getMyRequestsModelRequest = GetMyRequestsModelRequest(page: 1,);
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

    Logger().i(GetMyRequestsModelRequest(
        filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
        sort_by: selectedNotSelectedFilterAdsType.value.key!="-1"?selectedNotSelectedFilterAdsType.value.key:null,
        from_date: fromDate1.isNotEmpty?fromDate1.value : null,
        to_date: toDate1.isNotEmpty?toDate1.value : null,
        advertiser_name: searchAdvertiserController.text.isNotEmpty
            ? searchAdvertiserController.text
            : null)
        .toJson());
    getMyRequestsModelRequest = GetMyRequestsModelRequest(
        filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
        from_date: fromDate1.isNotEmpty?fromDate1.value : null,
        to_date: toDate1.isNotEmpty?toDate1.value : null,
        sort_by: selectedNotSelectedFilterAdsType.value.key!="-1"?selectedNotSelectedFilterAdsType.value.key:null,
        advertiser_name: searchAdvertiserController.text.isNotEmpty
            ? searchAdvertiserController.text
            : null);
    //pagingController.refresh();
    //refreshController.resetNoData();
    getRequestsData(isRefresh: true);
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
    getMyRequestsModelRequest = GetMyRequestsModelRequest(page: 1,);
    getRequestsData(isRefresh: true);
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


