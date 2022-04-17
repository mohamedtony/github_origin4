import 'dart:io';

import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:advertisers/app_core/network/models/Operation.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/AddEmployeeRequest.dart';
import 'package:advertisers/app_core/network/requests/AddReplyOnCommentRequest.dart';
import 'package:advertisers/app_core/network/responses/AddEmployeeResponse.dart';
import 'package:advertisers/app_core/network/responses/ListEmployeesModelResponse.dart';
import 'package:advertisers/app_core/network/responses/ListOperationsResponse.dart';
import 'package:advertisers/app_core/network/responses/MyCommentsResponse.dart';
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

class CommentsController extends GetxController  with StateMixin<MyCommentsResponse>{

  var myRequestsAsClient=<RequestModel>[].obs;
  var currentIndex=0.obs;
  bool isChecked=true;
  var isEdit=false.obs;
  bool isChecked_setting_accept=false;
  bool isChecked_setting_remove=false;
  var showComment=false.obs;
    var selectedEmployeeJob="".obs;
  ScrollController scrollController = ScrollController();

  var commentController = TextEditingController().obs;
  List<TextEditingController> commentControllers = <TextEditingController>[].obs;
  List<bool> showComments = <bool>[].obs;

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

  var sendByNotification=false.obs;
  var sendByChat=false.obs;

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
   // fetchEmployeesList(pageZero: false);
    getCommentsData();
    //fetchComments();
    // getRequestsData();
    // restAll();
    // loadMore();

    super.onInit();
  }





  int currentPage = 1;

  late int totalPages=0;


  final RefreshController refreshController = RefreshController(initialRefresh: true);

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
  List<int> myEmployeesIds=[];

  List<Operation> actions=[];
  List<int> actionsIds=[];
  List<String> actionsDate=[];
  List<String> actionsTime=[];

  void loadMore()async{
    scrollController?.addListener(() async {
      if (scrollController?.position.maxScrollExtent ==
          scrollController?.position.pixels) {
         //fetchEmployeesList(pageZero: false);
      }
    });
  }







  void checkSearch(){
    final isValid=searchFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    searchFormKey.currentState!.save();
    // loginClient();
  }

  List<Comments> commentsList=[];
  var myCommentsResponse=MyCommentsResponse().obs;

  void getCommentsData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
      }
    }
    EasyLoading.show();
    repo.get<MyCommentsResponse>(
        path: 'mycomments',
        fromJson: (json) => MyCommentsResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

        // Logger().i(res.data.);

          if (isRefresh) {
            commentsList = res.data!.comments??[];
          }else{
            commentsList.addAll(res.data!.comments??[]);
          }
          myCommentsResponse.value.data=res.data;
          print("my commentsList len "+commentsList.length.toString());
          currentPage++;
          totalPages = res.pagination?.total??0;

          DateTime tempDate = DateTime.parse("2022-02-07T15:54:07.000000Z");
          String date = DateFormat.yMMMd('ar_SA').format(tempDate);//("yyyy MMMM dd")

          print("my date # $date");
          final dateTime = DateTime.parse("2022-02-07T15:54:07.000000Z");

          final format = DateFormat('h:mm a','ar');
          final clockString = format.format(dateTime);
          print("clockString # $clockString");

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


  /// fetch employee Operations
  void fetchComments({bool isRefresh = false}) async {
    EasyLoading.show();
    String url ='https://advertiser.cefour.com/api/v1/mycomments';
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.get(
        url,
      );
      final data = MyCommentsResponse.fromJson(response.data);

      Logger().i(response!.data);

      if(data.status==200){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }

        if (isRefresh) {
          commentsList.clear();
            commentsList.addAll(data.data!.comments??[]);
        }else{
            commentsList.addAll(data.data!.comments??[]);
        }



        currentPage++;
        totalPages = data.pagination?.total??0;

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

      change(data, status: RxStatus.success());

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


  /// add reply
  void addReplyOnComment({AddReplyOnCommentRequest? request,int? id,int? index}) async {
    EasyLoading.show();
    dio.FormData formData = dio.FormData.fromMap(request!.toJson());
    String url ='https://advertiser.cefour.com/api/v1/ads/$id/comment';
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
        showComments[index!]=false;
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }

        getCommentsData(isRefresh: true);
        update();

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

  void checkForAddingComment(int? id,String text,int index){

    AddReplyOnCommentRequest request=AddReplyOnCommentRequest();
    request.comment= text;
    request.commentId=id;
    addReplyOnComment(request: request,id: id,index: index);

  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  var clientProfileModel = ClientProfileModel().obs;

  @override
  Future<void> onReady() async {
    EasyLoading.show();
    client!.getMyProfile("Bearer $token").then((value) {
      Logger().i(value.data?.toJson());
      if(value.data!=null&&value.status==200){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        clientProfileModel.value = value.data!;
      }
    });

    super.onReady();
  }

}




