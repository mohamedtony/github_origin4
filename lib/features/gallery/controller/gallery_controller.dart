import 'dart:io';

import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:advertisers/app_core/network/models/GetMyRequestsFilterForm.dart';
import 'package:advertisers/app_core/network/models/Operation.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/models/SelectedNotSelectedFilterAdsType.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/AddEmployeeRequest.dart';
import 'package:advertisers/app_core/network/requests/AddReplyOnCommentRequest.dart';
import 'package:advertisers/app_core/network/requests/GetGallaryRequest.dart';
import 'package:advertisers/app_core/network/requests/GetGallaryRequestFilter.dart';
import 'package:advertisers/app_core/network/responses/AddEmployeeResponse.dart';
import 'package:advertisers/app_core/network/responses/GalleryResponse.dart';
import 'package:advertisers/app_core/network/responses/GetGalleryFilterResponse.dart';
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
   GetGallaryRequest? getGallaryRequest = GetGallaryRequest(page: 1,);
  void getGalleryData({bool isRefresh = false }) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
      }
    }
    EasyLoading.show();


    getGallaryRequest!.page = currentPage;
    Logger().i(getGallaryRequest!.toJson());
    client!.getGallery(getGallaryRequest!.toJson(),"Bearer " + token!).then((res) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }

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
          Get.snackbar(
            "خطأ",
            res!.statusMessage.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          return false;
          break;
        default:
          break;
      }
    });

/*    repo.get<GalleryResponse>(
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
        });*/
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

   var getMyRequestsFilterForm = GetGallaryRequestFilter().obs;

   var isLoading = true.obs;
   var isEmpty = false.obs;

   RxList<SelectedNotSelectedFilterAdsType> advertisersTopRated = <SelectedNotSelectedFilterAdsType>[].obs;
   RxList<SelectedNotSelectedFilterAdsType> users = <SelectedNotSelectedFilterAdsType>[].obs;
   RxList<CategoryModel> services = <CategoryModel>[].obs;
   var selectedNotSelectedFilterAdsType = SelectedNotSelectedFilterAdsType().obs;
   var categorySelected = CategoryModel().obs;
   var isLoadingGetAdvertisersFromModel = true.obs;
   String? myToken;
   RxList<CategoryModel> selectedUserLocations = <CategoryModel>[].obs;
   var isFilterSavedClicked = false.obs;
   var isAreaEnabled = true.obs;
   var isCountryEnabled = true.obs;

   Future<void> getAdsForm(BuildContext context) async {
     print("here");
     String myToken = await storage.read("token");
     client!.getGalleryFilterForm("Bearer " + myToken).then((value) {
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


         getMyRequestsFilterForm.value.users?.entries.forEach((element) {
           users.add(
               SelectedNotSelectedFilterAdsType(
                 name: element.value,
                 key: element.key,
               ));
         });

         users.insert(
             0,
             SelectedNotSelectedFilterAdsType(
               name: "اختر ترتيب بحسب",
               key: "-1",
             ));

         if( getMyRequestsFilterForm.value.services!=null) {
           services.value = getMyRequestsFilterForm.value.services!;

           services.insert(0,
              CategoryModel(
                name: "اختر ترتيب بحسب",
                id: -1
              ));
         }
         isLoadingGetAdvertisersFromModel.value = false;
       } else {
         isLoadingGetAdvertisersFromModel.value = false;
       }
     });
   }

   void addCategory(CategoryModel categoryModel) {

     CategoryModel? country = selectedUserLocations.firstWhereOrNull((element) => element.id ==categoryModel.id);
     if(country==null&& categoryModel.id!=-1) {
       selectedUserLocations.add(categoryModel);
     }
   }

   void onSelectedCategoriesClicked(int id) {

     CategoryModel? country = selectedUserLocations.firstWhereOrNull((element) => element.id ==id);
     if(country!=null ) {
       selectedUserLocations.removeWhere((element) => element.id == id);
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
     List<String>? categoryStrings = [];
     selectedUserLocations.forEach((element) {
       categoryStrings.add(element.id!.toString());
     });
     Logger().i(GetGallaryRequest(
         filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
         categories: categoryStrings.isNotEmpty ? categoryStrings.join(",") : null,
          user_id: selectedNotSelectedFilterAdsType.value.key!=null?selectedNotSelectedFilterAdsType.value.key:null
         )
         .toJson());
     getGallaryRequest = GetGallaryRequest(
         filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
         categories: categoryStrings.isNotEmpty ? categoryStrings.join(",") : null,
         user_id: selectedNotSelectedFilterAdsType.value.key!=null?selectedNotSelectedFilterAdsType.value.key:null
     );
     //pagingController.refresh();
     //refreshController.resetNoData();
     getGalleryData(isRefresh: true);
   }

   void onReturnClicked(BuildContext context) {
     isFilterSavedClicked.value = false;
     advertisersTopRated.value.forEach((element) {
       element.isSelected.value = false;
     });
     selectedUserLocations.value = [];
     selectedNotSelectedFilterAdsType.value = SelectedNotSelectedFilterAdsType();
     getGallaryRequest = GetGallaryRequest(page: 1,);
     getGalleryData(isRefresh: true);
     Get.back();
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




