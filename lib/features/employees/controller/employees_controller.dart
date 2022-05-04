import 'dart:io';

import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:advertisers/app_core/network/models/Operation.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/AddEmployeeRequest.dart';
import 'package:advertisers/app_core/network/responses/AddEmployeeResponse.dart';
import 'package:advertisers/app_core/network/responses/GetRulesResponse.dart';
import 'package:advertisers/app_core/network/responses/ListEmployeesModelResponse.dart';
import 'package:advertisers/app_core/network/responses/ListOperationsResponse.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RejectRequestResponse.dart';
import 'package:advertisers/app_core/network/responses/ShowEmployeeDetailsResponse%20.dart';
import 'package:advertisers/app_core/network/responses/StopOrActivateResponse%20.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeesController extends GetxController with StateMixin<ListEmployeesModelResponse>{

  var myRequestsAsClient=<RequestModel>[].obs;
  var currentIndex=0.obs;
  bool isChecked=true;
  var isEdit=false.obs;
  bool isChecked_setting_accept=false;
  bool isChecked_setting_remove=false;
    var selectedEmployeeJob="".obs;
  ScrollController scrollController = ScrollController();

  var nameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var mobileController = TextEditingController().obs;
  var positionNameController = TextEditingController().obs;
  var appearanceNameController = TextEditingController().obs;
  var createdAtDate = ''.obs;
  var rate = ''.obs;
  var profileImage = ''.obs;
  var noImage='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScPr_e8yD_adDE0sUA6xJykV7Vuwyc0xQoun4XfAANTKGYdq2m99kHFf-Hc_XpY0YVnug&usqp=CAU';

  FocusNode nameNode = FocusNode();
  FocusNode positionNameNode = FocusNode();
  FocusNode mobileNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode appearanceNameNode = FocusNode();
  AddEmployeeRequest newEmployee=AddEmployeeRequest();
  ShowEmployeeDetailsResponse showEmployeeDetails=ShowEmployeeDetailsResponse();


  List<String> privilegedList=['الاعدادات','الطلبات','اعلاناتي','الخصومات والكوبونات','إضافة اعلان','الشات','التنبيهات','المعرض','الموظفين','المحفظة',
  'الدعم','التقارير','التعليقات'];

  List<String> notificationSettingsList=['المنصة','الطلبات','المحفظة والنقاط','الشات','التقييم','التعليقات','الموظفين','الاشتراك','المتابعات','الاعلانات',
    'تذاكر الدعم','الكوبونات','اشعارات المنصه'];

  List<String> notificationSettingsImgsList=['manasa icon.svg','orders icon.svg','ma7faza.svg','chat icon.svg','taqeem.svg','comments.svg','myempolyees.svg','subscripe.svg','heart-solid.svg','advertising2.svg',
    'bx-support.svg','coupon2.svg','dribbblealt.svg'];

  List<String> operationDetails=['تسعير الطلب رقم 4521','إضافة اعلان رقم 5210','تعديل تسعير الطلب رقم 4521','إضافة موظف محمد علي عبدالله','إضافة موظف محمد علي عبدالله',
  'تسعير طلب رقم 4521','تسعير طلب رقم 4521','تسعير طلب رقم 4521','تسعير طلب رقم 4521','تسعير طلب رقم 4521','تسعير طلب رقم 4521','تسعير طلب رقم 4521','تسعير طلب رقم 4521','تسعير طلب رقم 4521','تسعير طلب رقم 4521','تسعير طلب رقم 4521','تسعير طلب رقم 4521','تسعير طلب رقم 4521'];

  var reasonDataModel=ReasonDataModel().obs;
  // var myRequestAsClient
   List<int>? checkListShare = [];
   var registerClientUserResponse=RegisterClientUserResponse().obs;
   TextEditingController reasonController=TextEditingController();
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




  bool isMuted=false;


  GlobalKey<FormState> searchFormKey=GlobalKey<FormState>();
  late TextEditingController searchController;
  var search='';
 late Repository repo;
 late String token;
 List<int> mylist=<int> [];
  @override
  void onInit() {
    // passIndex;
    repo=Repository();
    token =storage.read("token");
    searchController=TextEditingController();
    fetchEmployeesList(pageZero: false);
    // getRequestsData();
    // restAll();
    // loadMore();

    super.onInit();
  }





  int currentPage = 1;

  late int totalPages=0;


  final RefreshController refreshController = RefreshController(initialRefresh: true);


  final RefreshController refreshController2 = RefreshController(initialRefresh: true);


  Future<bool> getRequestsData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        refreshController2.loadNoData();
        return false;
      }
    }
    EasyLoading.show();
    repo.get<MyRequestsResponse>(
        path: 'myrequests',
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

///*******************************************************************************


  bool? isRepricing = false;



  var endAdvertisingDate = ''.obs;
  var dateStringTitle = 'اختر تاريخ محدد للطلب أو من - إلى'.obs;



  void addendAdvertisingDate(String? endDate){
    endAdvertisingDate.value = endDate!;
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

  void restAll(){
    myEmployees.clear();
    myEmployeesIds.clear();
     }

  // late String token;
  // late Repository repo;

  final ApiService _apiService = Get.put(ApiService());

  int page = 0;
  List<int> parentRequestsIds=[];

  List <Employee> myEmployees = [];
  RxList<Rules> myEmployeeRules = <Rules>[].obs;
  List<int> myEmployeesIds=[];

  List<Operation> actions=[];
  List<int> actionsIds=[];
  List<String> actionsDate=[];
  List<String> actionsTime=[];

  void loadMore()async{
    scrollController?.addListener(() async {
      if (scrollController?.position.maxScrollExtent ==
          scrollController?.position.pixels) {
         fetchEmployeesList(pageZero: false);
      }
    });
  }


  /// open whatsapp
  void SendMsgToWhatsapp({String? whatsapp}) async {
    if (await canLaunch("https://wa.me/$whatsapp?text=مرحبا")) {
      try{
        await launch("https://wa.me/$whatsapp?text=مرحبا");
      }
      catch(e,s){
        print(e);
        print(s);
      }

    } else {
      print('entered deeblink fun and else of canlaunch ');
    }
  }


  /// fetchAdvertisingRequests
  void fetchEmployeesList({bool? pageZero}) async {
    pageZero == true? page=1: page++;
    String url ='https://advertiser.cefour.com/api/v1/employees';
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.get(
        url,
      );
      final data = ListEmployeesModelResponse.fromJson(response.data);
      Logger().i(response!.data);
      data!.employee!.forEach((request) {
        if(!myEmployeesIds.contains(request.id)){
          myEmployees.add(request);
          myEmployeesIds.add(request.id!);
        }
      });

      print("employeesRequests ==> length == > ${myEmployees.length}");
      //..
      // Successfully fetched news data
        change(data, status: RxStatus.success());
     // Logger().i(response!.data);
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


  /// fetch employee
  void fetchAnEmployee({int? id}) async {
    EasyLoading.show();
     String url ='https://advertiser.cefour.com/api/v1/employees/$id';
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.get(
        url,
      );
      final data = ShowEmployeeDetailsResponse.fromJson(response.data);

      Logger().i(response!.data);

      if(data.status==200){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        showEmployeeDetails.data=data.data;
        appearanceNameController.value.text=data.data!.apperanceName!;
        positionNameController.value.text=data.data!.jobTitle!;
        mobileController.value.text=data.data!.user!.phone!;
        emailController.value.text=data.data!.user!.email!;
        nameController.value.text=data.data!.user!.username!;
        selectedEmployeeJob.value=data.data!.type!=null&&data.data!.type=="in"?"موظف داخلى":data.data!.type!=null&&data.data!.type=="out"?"موظف خارجى":"";
        createdAtDate.value=data.data!.createAt!;
        rate.value=data.data!.user!.rate!;
        profileImage.value=data.data!.user!.image!;

        Get.toNamed('/ShowEmployeePage');

        DateTime tempDate = DateTime.parse("2022-02-07T15:54:07.000000Z");
        String date = DateFormat("yyyy-MM-dd").format(tempDate);

        print("my date # $date");
        final dateTime = DateTime.parse("2022-02-07T15:54:07.000000Z");

        final format = DateFormat('HH:mm a');
        final clockString = format.format(dateTime);

        print("my time # $clockString");

      }
      else{
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar(
          "خطأ",
          data.message.toString(),
          icon: const Icon(Icons.person, color: Colors.red),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
      }



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

  /// edit employee
  void editEmployeeFun({AddEmployeeRequest? request,int? id}) async {
    EasyLoading.show();
    dio.FormData formData = dio.FormData.fromMap(request!.toJson());
    String url ='https://advertiser.cefour.com/api/v1/employees/$id';
    Logger().i(request);
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.post(
        url,
        data: formData,
      );
      final data = AddEmployeeResponse.fromJson(response.data);
      Logger().i(response.data);

      if(data.status==200){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }

        Get.snackbar("مبرووك",
          "تم تعديل بيانات الموظف بنجاح",
          icon: const Icon(Icons.check, color: Colors.green),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.TOP,);

        restAll();
        fetchEmployeesList();
        Get.toNamed('/EmployeesPage');
      }else{
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar(
          "خطأ",
          data.message.toString(),
          icon: const Icon(Icons.person, color: Colors.red),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
      }



     } on dio.DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
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

  /// get employee rules
  Future<void> getRules(int id) async {
    String myToken = await storage.read("token");

    client!.getMyEmployeeRules(id,"Bearer " + myToken,)
        .then((value) {
      if (value.status == 200 && value.rules != null && value.rules!.isNotEmpty) {
        Logger().d(value.rules.toString());
        /*isLoading.value = false;
        isEmpty.value = false;
        advertisersModel.value = value.data!;*/
        myEmployeeRules.value = value.rules!;
      } else {
        /*isLoading.value = false;
        isEmpty.value = true;*/
      }
    });
  }


  /// delete employee
  void deleteAnEmployee({int? id}) async {
    EasyLoading.show();
    String url ='https://advertiser.cefour.com/api/v1/employees/$id';
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.delete(
        url,
      );
      final data = ShowEmployeeDetailsResponse.fromJson(response.data);

      Logger().i(response.data);

      if(data.status==200){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }

        Get.snackbar("حسنا",
          "تم حذف الموظف بنجاح",
          icon: const Icon(Icons.check, color: Colors.green),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.TOP,);
          restAll();
          fetchEmployeesList();

      }else{
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar(
          "خطأ",
          data.message.toString(),
          icon: const Icon(Icons.person, color: Colors.red),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
      }

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

  /// stop or activate employee
  void stopOrActivateEmployee({int? id}) async {
    EasyLoading.show();
    String url ='https://advertiser.cefour.com/api/v1/employees/$id/status';
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.get(
        url,
      );
      final data = StopOrActivateResponse.fromJson(response.data);

      Logger().i(response.data);

      if(data.status==200){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }

        if(data.data!.status==1){
          Get.snackbar("حسنا",
            "تم تنشيط الموظف بنجاح",
            icon: const Icon(Icons.check, color: Colors.green),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.TOP,);
        }else if(data.data!.status==0){
          Get.snackbar("حسنا",
            "تم ايقاف الموظف بنجاح",
            icon: const Icon(Icons.check, color: Colors.green),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.TOP,);
        }

        restAll();
        fetchEmployeesList();

      }else{
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar(
          "خطأ",
          data.message.toString(),
          icon: const Icon(Icons.person, color: Colors.red),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
      }

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


  void checkEditEmployee(int? id){

    newEmployee.type= selectedEmployeeJob=="موظف داخلى"?"in":"out";
    newEmployee.jobTitle=positionNameController.value.text;
    newEmployee.apperanceName=appearanceNameController.value.text;
    newEmployee.phone=mobileController.value.text;
    newEmployee.username=nameController.value.text;
    newEmployee.email=emailController.value.text;
    editEmployeeFun(request: newEmployee,id: id);

  }

  void checkSearch(){
    final isValid=searchFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    searchFormKey.currentState!.save();
    // loginClient();
  }

  /// fetchAnEmployeeOperations
  void fetchAnEmployeeOperations2({int? id}) async {
    //pageZero == true? page=1: page++;
    String url ='https://advertiser.cefour.com/api/v1/employees/$id/actions';
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.get(
        url,
      );
      final data = ListOperationsResponse.fromJson(response.data);
      Logger().i(response.data);
      data.data!.forEach((request) {
        if(!actionsIds.contains(request.id)){
          actions.add(request);
          actionsIds.add(request.id!);
          final dateTime = DateTime.parse(request.actionable!.createdAt!);
          final format = DateFormat('HH:mm a');
          actionsTime.add(format.format(dateTime));
        }
      });


      // Logger().i(response!.data);
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



  /// fetch employee Operations
  void fetchAnEmployeeOperations({int? id}) async {
    EasyLoading.show();
    String url ='https://advertiser.cefour.com/api/v1/employees/$id/actions';
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.get(
        url,
      );
      final data = ListOperationsResponse.fromJson(response.data);

      Logger().i(response!.data);

      if(data.status==200){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }

        data.data!.forEach((request) {
          if(!actionsIds.contains(request.id)){
            actions.add(request);
            actionsIds.add(request.id!);
            if(request.actionable!=null&&request.actionable!.createdAt!=null){
              final dateTime = DateTime.parse(request.actionable!.createdAt!);
              final format = DateFormat('HH:mm a');
              actionsTime.add(format.format(dateTime));
              actionsDate.add(request.actionable!.addedAt??"");
            }else{
              actionsTime.add("-");
              actionsDate.add("-");
            }

          }
        });
        Get.toNamed('/EmployeeArchivePage');
      }
      else{
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar(
          "خطأ",
          data.message.toString(),
          icon: const Icon(Icons.person, color: Colors.red),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
      }



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

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

}




