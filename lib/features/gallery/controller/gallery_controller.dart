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
import 'package:advertisers/app_core/network/responses/GalleryResponse.dart';
import 'package:advertisers/app_core/network/responses/ListEmployeesModelResponse.dart';
import 'package:advertisers/app_core/network/responses/ListOperationsResponse.dart';
import 'package:advertisers/app_core/network/responses/MyCommentsResponse.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RejectRequestResponse.dart';
import 'package:advertisers/app_core/network/responses/ShowEmployeeDetailsResponse%20.dart';
import 'package:advertisers/app_core/network/responses/ShowOnAppResponse.dart';
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

class GalleryController extends GetxController  with StateMixin<MyCommentsResponse>{

   var currentIndex=0.obs;
  var adsId=0.obs;

  ScrollController scrollController = ScrollController();

  var noImage='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScPr_e8yD_adDE0sUA6xJykV7Vuwyc0xQoun4XfAANTKGYdq2m99kHFf-Hc_XpY0YVnug&usqp=CAU';

  FocusNode nameNode = FocusNode();
  FocusNode positionNameNode = FocusNode();
  FocusNode mobileNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode appearanceNameNode = FocusNode();
  AddEmployeeRequest newEmployee=AddEmployeeRequest();
  ShowEmployeeDetailsResponse showEmployeeDetails=ShowEmployeeDetailsResponse();


  List<int>? checkListFunctions = [];

  GlobalKey<FormState> searchFormKey=GlobalKey<FormState>();
  late TextEditingController searchController;
  var search='';
 late Repository repo;
 late String token;
 List<int> mylist=<int> [];
  @override
  void onInit() {
    repo=Repository();
    token =storage.read("token");
    searchController=TextEditingController();
    getGalleryData();
    super.onInit();
  }


  int currentPage = 1;

  late int totalPages=0;


  final RefreshController refreshController = RefreshController(initialRefresh: true);



  void restAll(){
    myEmployees.clear();
    myEmployeesIds.clear();
     }


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

  List<GalleryItem> galleryList=[];
  var myGalleryResponse=GalleryResponse().obs;

  void getGalleryData({bool isRefresh = false }) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
      }
    }
    EasyLoading.show();
    repo.get<GalleryResponse>(
        path: 'gallery',
        fromJson: (json) => GalleryResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) {
          print("res.data ${res.data!.length}");
          Logger().i(res.data);
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
         Logger().i(res.data);

          if (isRefresh) {
            galleryList = res.data??[];
          }else{
            galleryList.addAll(res.data??[]);
          }
          myGalleryResponse.value.data=res.data;
          print("my commentsList len "+galleryList.length.toString());
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
        });
  }

   void deleteAnItemInGallery({int? id}) async {
     EasyLoading.show();
     repo.delete<ShowOnAppResponse>(
         path: 'gallery/$id',
         fromJson: (json) => ShowOnAppResponse.fromJson(json),
         json: {"token": "Bearer $token"},
         onSuccess: (res) async{
           if (EasyLoading.isShow) {
             EasyLoading.dismiss();
           }

           Logger().i(res);
           if (EasyLoading.isShow) {
             EasyLoading.dismiss();
           }

           if(res.status==200){
             if (EasyLoading.isShow) {
               EasyLoading.dismiss();
             }

             Get.snackbar("حسنا",
               res.message??"تم الحذف بنجاح",
               icon: const Icon(Icons.check, color: Colors.green),
               backgroundColor: Colors.yellow,
               snackPosition: SnackPosition.TOP,);

             //fetchAdsList();
             getGalleryData(isRefresh: true);
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

           getGalleryData(isRefresh: true);
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




