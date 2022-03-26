import 'dart:io';

import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/AddEmployeeRequest.dart';
import 'package:advertisers/app_core/network/responses/AddEmployeeResponse.dart';
import 'package:advertisers/app_core/network/responses/ListEmployeesModelResponse.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RejectRequestResponse.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

class AddEmployeeController extends GetxController with StateMixin<AddEmployeeResponse>{
  GlobalKey<FormState> loginClientFormKey1=GlobalKey<FormState>(debugLabel:'loginClientFormKey1' );

  var myRequestsAsClient=<RequestModel>[].obs;
  var currentIndex=0.obs;
  bool isChecked=true;
  bool isChecked_setting_accept=false;
  bool isChecked_setting_remove=false;
  var selectedEmployeeJob="".obs;

  ScrollController scrollController = ScrollController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController positionNameController = TextEditingController();
  TextEditingController appearanceNameController = TextEditingController();


  FocusNode nameNode = FocusNode();
  FocusNode positionNameNode = FocusNode();
  FocusNode mobileNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode appearanceNameNode = FocusNode();




   var registerClientUserResponse=RegisterClientUserResponse().obs;
   TextEditingController reasonController=TextEditingController();




  int tabId = 1;
  void passIndex(newIndex){
    tabId = newIndex;
    update();
  }

  bool isMuted=false;



  var search='';
 late Repository repo;
 late String token;
 List<int> mylist=<int> [];
  @override
  void onInit() {
    // passIndex;
    repo=Repository();
    token =storage.read("token");

  //  AddEmployeefun( );


    super.onInit();
  }

  int currentPage = 1;

  late int totalPages=0;

  String? validatePhone(String phone){
    if (phone.length<8){
      return 'رقم الهاتف لا يقل 8 رقم';
    }else if(mobileController.text.isNotEmpty){
      return mobileController.text;
    }
    return null;
  }
  var isValid=false.obs;
  AddEmployeeRequest newEmployee=AddEmployeeRequest();

  void checkAddEmployee(){

     newEmployee.type= selectedEmployeeJob=="موظف داخلى"?"in":"out";
     newEmployee.jobTitle=positionNameController.text;
     newEmployee.apperanceName=appearanceNameController.text;
     newEmployee.phone=mobileController.text;
     newEmployee.username=nameController.text;
     newEmployee.email=emailController.text;
     AddEmployeefun(request: newEmployee);

  }


  final RefreshController refreshController =
  RefreshController(initialRefresh: true);

  void restAll(){
    selectedEmployeeJob="".obs;
    nameController.clear();
    emailController.clear();
    mobileController.clear();
    positionNameController.clear();
    appearanceNameController.clear();
   }



  final ApiService _apiService = Get.put(ApiService());


  List<int> parentRequestsIds=[];

  List <Employee> myEmployees = [];
  List<int> myEmployeesIds=[];




  void AddEmployeefun({AddEmployeeRequest? request}) async {
    dio.FormData formData = dio.FormData.fromMap(request!.toJson());
     String url ='https://advertiser.cefour.com/api/v1/employees';
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.post(
        url,
        data: formData,
      );
      final data = AddEmployeeResponse.fromJson(response.data);
      Logger().i(response!.data);

      Get.snackbar(
        "مبروك",
        "تم اضافه الموظف بنجاح",
        icon: const Icon(Icons.check, color: Colors.green),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.TOP,);

      restAll();

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



  @override
  void onClose() {
     super.onClose();
  }

}




