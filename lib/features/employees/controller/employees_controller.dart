import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RejectRequestResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EmployeesController extends GetxController{

  var myRequestsAsClient=<RequestModel>[].obs;
  var currentIndex=0.obs;
  bool isChecked=true;
  bool isChecked_setting_accept=false;
  bool isChecked_setting_remove=false;
    String selectedEmployeeJob="";
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


  List<String> employeesJobs=['موظف داخلي','موظف خارجي','مسؤول / أدمن','موظف داخلي','موظف داخلي','موظف داخلي','موظف داخلي','موظف داخلي',];

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


  List<int> solution(List<int> a) {

    List<int> temp=  <int>[];

    for(int i=0;i<a.length;i++){
      String numAsString = a[i].toString();
      for (int y = 0; y < numAsString.length; y++) {
        temp.add(int.parse(numAsString[y]));
      }
    }

    List<int> occurence=  <int>[];
    List<int> occurenceNum=  <int>[];

    for(int o=0;o<temp.length;o++){
      int count=0;
      int x=temp[o];

      for(int j=0;j<temp.length;j++){
        if(x==temp[j]){
          count++;
        }
      }
      if(count>1){
        occurenceNum.add(count);
        occurence.add(x);
      }



    }
    occurence.reversed;

    return occurence;

  }
  
  
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
    ///token =storage.read("token");
    searchController=TextEditingController();
    ///getRequestsData();
    mylist=solution([2,23,34,5,24,13,7]);
    print("mylist $mylist");
    super.onInit();
  }





  int currentPage = 1;

  late int totalPages=0;


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


  @override
  void onClose() {
     super.onClose();
  }
}




