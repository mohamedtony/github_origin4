import 'dart:io';

import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/AddEmployeeRequest.dart';
import 'package:advertisers/app_core/network/requests/SearchEmployeeRequest.dart';
import 'package:advertisers/app_core/network/responses/AddEmployeeResponse.dart';
import 'package:advertisers/app_core/network/responses/ListEmployeesModelResponse.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RejectRequestResponse.dart';
import 'package:advertisers/app_core/network/responses/ShowEmployeeDetailsResponse%20.dart';
import 'package:advertisers/features/employees/controller/employees_controller.dart';
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
  var nameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var mobileController = TextEditingController().obs;
  var positionNameController = TextEditingController().obs;
  var appearanceNameController = TextEditingController().obs;


  var validation=false.obs;

  FocusNode nameNode = FocusNode();
  FocusNode positionNameNode = FocusNode();
  FocusNode mobileNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode appearanceNameNode = FocusNode();

  ShowEmployeeDetailsResponse showEmployeeDetails=ShowEmployeeDetailsResponse();



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
    }else if(mobileController.value.text.isNotEmpty){
      return mobileController.value.text;
    }
    return null;
  }
  var isValid=false.obs;
  AddEmployeeRequest newEmployee=AddEmployeeRequest();
  SearchEmployeeRequest searchEmployee=SearchEmployeeRequest();
  void checkAddEmployee(){

     validation=false.obs;
     newEmployee.type= selectedEmployeeJob=="موظف داخلى"?"in":"out";
     newEmployee.jobTitle=positionNameController.value.text;
     newEmployee.apperanceName=appearanceNameController.value.text;
     newEmployee.phone=mobileController.value.text;
     newEmployee.username=nameController.value.text;
     newEmployee.email=emailController.value.text;
     AddEmployeefun(request: newEmployee);

  }


  final RefreshController refreshController =
  RefreshController(initialRefresh: true);

  void restAll(){
    selectedEmployeeJob="".obs;
    nameController.value.clear();
    emailController.value.clear();
    mobileController.value.clear();
    positionNameController.value.clear();
    appearanceNameController.value.clear();
   }

  void checkSearchEmployee(){
    searchEmployee.type= selectedEmployeeJob.isEmpty||selectedEmployeeJob=="موظف داخلى"?"in":"out";
    searchEmployee.phone=mobileController.value.text;
    searchAnEmployee(request: searchEmployee);
  }

  final ApiService _apiService = Get.put(ApiService());


  void AddEmployeefun({AddEmployeeRequest? request}) async {
    EasyLoading.show();
    dio.FormData formData = dio.FormData.fromMap(request!.toJson());
     String url ='https://advertiser.cefour.com/api/v1/employees';
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
        Get.snackbar(
          "مبروك",
          "تم اضافه الموظف بنجاح",
          icon: const Icon(Icons.check, color: Colors.green),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.TOP,);
       // Get.find<EmployeesController>().getEmployeesList();
         //Get.toNamed('/EmployeesPage');
         restAll();
         // Successfully fetched news data
        change(data, status: RxStatus.success());
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


  /// search for an employee
  void searchAnEmployee({SearchEmployeeRequest? request}) async {
    dio.FormData formData = dio.FormData.fromMap(request!.toJson());
    EasyLoading.show();
    String url ='https://advertiser.cefour.com/api/v1/employees/search';
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.post(
        url,
        data: formData,
      );
      final data = ShowEmployeeDetailsResponse.fromJson(response.data);

      Logger().i(response!.data);

      if(data.status==200){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        showEmployeeDetails.data=data.data;
        appearanceNameController.value.text=data.data!.apperanceName??"";
        positionNameController.value.text=data.data!.jobTitle??"";
        mobileController.value.text=data.data!.user!.phone??"";
        emailController.value.text=data.data!.user!.email??"";
        nameController.value.text=data.data!.user!.username??"";
       // selectedEmployeeJob.value=data.data!.type!=null&&data.data!.type=="in"?"موظف داخلى":data.data!.type!=null&&data.data!.type=="out"?"موظف خارجى":"";
        // createdAtDate.value=data.data!.createAt!;
        // rate.value=data.data!.user!.rate!;
        // profileImage.value=data.data!.user!.image!;

        Get.snackbar("مبرووك",
          "تم استدعاء بيانات هذا الموظف بنجاح",
          icon: const Icon(Icons.check, color: Colors.green),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.TOP,);



      }else if(data.status==400){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar(
          "عذرا",
          "لا يوجد مستخدم مسجل لهذا الجوال",
          icon: const Icon(Icons.close, color: Colors.red),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.TOP,);
      } else{
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


  String? get  errorNameText {
    // at any time, we can get the text from _controller.value.text
    final text = nameController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'يجب ادخال الاسم';
    }
    if (text.length < 4) {
      return 'يجب ان لا يقل الاسم عن 4 حروف';
    }
    // return null if the text is valid
    return null;
  }

  String? get  errorSelectedJobType {
    // at any time, we can get the text from _controller.value.text
    final text = selectedEmployeeJob.value;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'يجب اختيار نوع التوظيف';
    }
    // return null if the text is valid
    return null;
  }

  String? get  errorMobileText {
    // at any time, we can get the text from _controller.value.text
    final text = mobileController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'يجب ادخال الجوال';
    }
    if (text.length < 8) {
      return 'لا يجب ان يقل رقم الجوال عن 8 ارقام';
    }
    // return null if the text is valid
    return null;
  }

  String? get validateEmail  {
    final value = emailController.value.text;
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'يجب ادخال الايميل';
    }
    if( !regex.hasMatch(value)) {
      return 'يجب ادخال ايميل صحيح';
    }
      return null;
  }

  String? get  errorPositionNameText {
    // at any time, we can get the text from _controller.value.text
    final text = positionNameController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'يجب ادخال المسمى الوظيفى';
    }
    if (text.length < 4) {
      return 'يجب ان لا يقل المسمى الوظيفى عن 4 حروف';
    }
    // return null if the text is valid
    return null;
  }

  String? get  errorAppearenceNameText {
    // at any time, we can get the text from _controller.value.text
    final text = appearanceNameController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'يجب ادخال اسم الظهور';
    }
    if (text.length < 4) {
      return 'يجب ان لا يقل اسم الظهور عن 4 حروف';
    }
    // return null if the text is valid
    return null;
  }

  @override
  void onClose() {
     super.onClose();
  }

}




