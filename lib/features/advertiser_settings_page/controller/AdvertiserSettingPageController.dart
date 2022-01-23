import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/requests/UpdateUserCategoryRequest.dart';
import 'package:advertisers/features/advertiser_settings_page/widgets/activities_bottom_sheet.dart';
import 'package:advertisers/features/advertiser_settings_page/widgets/location_range_sheet.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AdvertiserSettingPageController extends GetxController  {
  var isOpend = false;
  var position = -1;
  var tabIndex = 1.obs;
  TextEditingController? kayanNameController,accountNameEdit,accountOwner,phoneController,emailController,accountRegisteredNumController;
  var flag = false.obs;
  var isEnabled=false.obs;

  var clientProfileModel = ClientProfileModel().obs;
  RxList<Country> countries = <Country>[].obs;
  RxList<Area> areas = <Area>[].obs;
  var country = Country().obs;
  var area = Area().obs;
  var smsOTP = ''.obs;
  var verificationId = '';
  var countryCode = '+966'.obs;
  var phone = '';
// switches the value between true/false
  // flag.toggle();

  // categories
  RxList<CategoryModel> userCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> generalCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> selectedCategories = <CategoryModel>[].obs;
  RxList<int> selectedCategoriesIds = <int>[].obs;
  var isLoading = true.obs;
  var isLoadingLocation = true.obs;
  //location range
  RxList<Country> countriesForLocationSheet = <Country>[].obs;
  RxList<Area> areasForLocationSheet = <Area>[].obs;
  var countryForLocationSheet  = Country().obs;
  var areaForLocationSheet  = Area().obs;
  RxList<dynamic> selectedUserLocations = <dynamic>[].obs;
  var isAreaEnabled = true.obs;
  var isCountryEnabled = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    kayanNameController = TextEditingController(text: 'الراشد للاوانى الفخارية');
    accountNameEdit= TextEditingController(text: '# El rashid');
    accountOwner= TextEditingController(text: 'محمد تونى حماد');
    phoneController = TextEditingController(text: '01111046148');
    emailController = TextEditingController(text: 'mohamedtony349@yahoo.com');
    accountRegisteredNumController  = TextEditingController();
    super.onInit();
  }

  void changeIndex(int position) {
    this.tabIndex.value = position;

  }
  @override
  void onReady() {
    // TODO: implement onReady
    Get.dialog(
        Dialog(
          child: Container(
            height: 100.0,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitThreeBounce(color: Colors.blue, size: 40,),
                new Text("من فضلك انتظر ....!",style: TextStyle(color: AppColors.advertiseNameColor,fontSize: 24.0,fontFamily: 'Arabic-Regular',fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        )
    );

    client!.getMyProfile("Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value) {
      Logger().i(value.data?.toJson());
      if(value.data!=null&&value.status==200){
        Get.back();
        clientProfileModel.value = value.data!;
        kayanNameController?.text = "tony";
        if(clientProfileModel.value.account_name!=null) {
          accountNameEdit?.text = clientProfileModel.value.account_name!;
        }
        if(clientProfileModel.value.account_name!=null) {
          accountNameEdit?.text = clientProfileModel.value.account_name!;
        }
        if(clientProfileModel.value.phone!=null) {
          phoneController?.text = clientProfileModel.value.phone!;
        }
        if(clientProfileModel.value.email!=null) {
          emailController?.text = clientProfileModel.value.email!;
        }
        if(clientProfileModel.value.personal_id!=null) {
          accountRegisteredNumController?.text = clientProfileModel.value.personal_id!;
        }

        client!.getCountries().then((value){
          if(value.data!=null){
            countries.value = value.data!;
            countries.value.forEach((element) {
              Logger().i(element.toJson());
            });
            Country? countryIn = countries.firstWhereOrNull((element) => element.id==clientProfileModel.value.country_id);
            if(countryIn!=null){
              country.value = countryIn;
              if(countryIn.areas!=null) {
                areas.value = countryIn.areas!;
                Area? areaIn = countryIn.areas?.firstWhereOrNull((
                    element) => element.id == clientProfileModel.value.area_id);

                if(areaIn!=null){
                  print("areaIn"+areaIn.name!);
                  area.value = areaIn;
                }else{
                  area.value = countryIn.areas![1];
                }
              }
            }else{
              countryIn = countries.value[1];
              if(countryIn.areas!=null) {
                areas.value = countryIn.areas!;
                Area? areaIn = countryIn.areas?.firstWhereOrNull((
                    element) => element.id == clientProfileModel.value.area_id);

                if(areaIn!=null){
                  print("areaIn"+areaIn.name!);
                  area.value = areaIn;
                }else{
                  area.value = countryIn.areas![1];
                }
              }
            }
          }
        });
      }
    });

    super.onReady();
  }
  void changeEdit(){

    if(isEnabled.value){
      isEnabled.value = false;
    }else{
      isEnabled.value = true;
    }
    print("EditEdit"+isEnabled.value.toString());
  }

  Future<void> verifyPhone() async {
    EasyLoading.show(status:'انتظر');
    final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      verificationId = verId;
      Get.toNamed(
          '/verificationCodePage?route=registerPhone&phone=${countryCode.value.toString() + int.parse(phoneController!.text).toString()}');
      /*smsOTPDialog(context).then((value) {
        print('sign in');
      });*/
    };
    try {
      /*  print(
          '>>>>>>>>>>>>>>>>>>>>${countryCode.value.toString() + int.parse(phone).toString()}');*/
      await auth.verifyPhoneNumber(
          phoneNumber: countryCode.value.toString() +
              int.parse(phoneController!.text)
                  .toString(), // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            verificationId = verId;
          },
          codeSent:
          smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (exception) {
            Get.snackbar(
              "حدث خطأ",
              exception.message.toString(),
              icon: const Icon(Icons.person, color: AppColors.white),
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.BOTTOM,
            );
          });
    } on Exception catch (_, e) {
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "حدث خطأ",
        e.toString(),
        icon: const Icon(Icons.person, color: AppColors.white),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void changeStatus(bool isOpend,int position) {
    this.isOpend = isOpend;
    this.position = position;
    update();
  }

  late TabController controller;

  @override
  void onClose() {
    // TODO: implement onClose
    phoneController?.dispose();
    //selectedCategories.value = [];
    super.onClose();
  }
  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;

  void showActivitiesBottomSheet(BuildContext context, int bottomNumber) {

    client!.getCategories("Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value) {
      isLoading.value = false;
      if(value.data!=null&&value.status==200){
        if(value.data!.user_categories!=null&&value.data!.user_categories!.isNotEmpty){
          userCategories.value = value.data!.user_categories!;
          selectedCategories.value = value.data!.user_categories!;

        }
        if(value.data!.all_categories!=null&&value.data!.all_categories!.isNotEmpty){
          generalCategories.value = value.data!.all_categories!;
          generalCategories.value.insert(0, CategoryModel(id:-1,name: 'كل النشطات'));
        }
      }
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          //maxChildSize: 0.8,
          //minChildSize: 100.0,

          initialChildSize: 0.67,
          expand: false,
          builder: (context, scrollController) {
            //if(bottomNumber==1) {
              /*return AdvertisingChannelsPage(
                  scrollController: scrollController);*/
              return ActivitiesBottomSheet(
                  scrollController: scrollController);

           // }
          },
        );
      },
    ).then((value){
      print("showDialog");
      selectedCategories.value = [];

    });
  }
  void removeItem(int id){
    /*if(!realImages.h(s)){
      realImages.add(s);
    }*/
    int index = selectedCategories.indexWhere((element) => element.id==id);
    print("index= "+index.toString());
    if(index!=null && index!=-1) {
      selectedCategories.removeAt(index);
    }
  }
  void addItem(CategoryModel s){
    CategoryModel? categoryModel = selectedCategories.firstWhereOrNull((element) => element.id==s.id);


    if(categoryModel==null && s.id!=-1){
      selectedCategories.add(s);
      //update();
    }
  }

  void onUpdateUserCategories(BuildContext context){
    /*if(selectedCategories.isEmpty){
      Fluttertoast.showToast(
        msg: 'يرجى إختيار النشاطات الخاصة بك',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.6),
        textColor: Colors.white,
        fontSize: 14.0,
      );
     *//* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:  Text('يرجى إختيار النشاطات الخاصة بك',style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),),
      ));*//*
      return;
    }*/

    selectedCategoriesIds.value = [];
    selectedCategories.forEach((element) {
      selectedCategoriesIds.add(element.id!);
    });
    client!.updateUserCategories(UpdateUserCategoryRequest(categories:selectedCategoriesIds.value),"Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value) {
      if(value.status==200){
        Fluttertoast.showToast(
          msg: value.message??'',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.6),
          textColor: Colors.white,
          fontSize: 14.0,
        );
      }
    });
  }
  void showLocationBottomSheet(BuildContext context, int bottomNumber) {

    client!.getCountries().then((value){
      isLoadingLocation.value = false;
      if(value.data!=null){
        countriesForLocationSheet.value = value.data!;
        countriesForLocationSheet.insert(0, Country(id: -1,name: 'إختر'));
        countriesForLocationSheet.forEach((element) {
          Logger().i(element.toJson());
        });
        if(countriesForLocationSheet.value[0].areas!=null&&countriesForLocationSheet.value[0].areas!.isNotEmpty) {
          areasForLocationSheet.value =
              countriesForLocationSheet.value[0].areas!;

        }
        Area? areaIn = areasForLocationSheet.firstWhereOrNull((
            element) => element.id == -1);
        if(areaIn==null) {
          areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
        }
/*        Country? countryIn = countriesForLocationSheet.firstWhereOrNull((element) => element.id==clientProfileModel.value.country_id);
        if(countryIn!=null){
          countryForLocationSheet.value = countryIn;
          if(countryIn.areas!=null) {
            areas.value = countryIn.areas!;
            areas.insert(0, Area(id: -1,name: 'المدينة'));
            Area? areaIn = countryIn.areas?.firstWhereOrNull((
                element) => element.id == clientProfileModel.value.area_id);

            if(areaIn!=null){
              print("areaIn"+areaIn.name!);
              area.value = areaIn;
            }else{
              area.value = countryIn.areas![1];
            }
          }
        }else{
          countryIn = countriesForLocationSheet.value[2];
          countryForLocationSheet.value = countryIn;
          if(countryIn.areas!=null) {
            areas.value = countryIn.areas!;
            Area? areaIn = countryIn.areas?.firstWhereOrNull((
                element) => element.id == clientProfileModel.value.area_id);

            if(areaIn!=null){
              print("areaIn"+areaIn.name!);
              areaForLocationSheet.value = areaIn;
            }else{
              areaForLocationSheet.value = countryIn.areas![1];
            }
          }
        }*/
      }
    });

    client!.getUseLocations("Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value){
      isLoadingLocation.value = false;
      if(value.data!=null){
        if(value.data?.countries!=null && value.data!.countries!.isNotEmpty) {
          selectedUserLocations.value =[];
          selectedUserLocations.addAll(value.data!.countries!);
        }
      }
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          //maxChildSize: 0.8,
          //minChildSize: 100.0,

          initialChildSize: 0.67,
          expand: false,
          builder: (context, scrollController) {
            //if(bottomNumber==1) {
            /*return AdvertisingChannelsPage(
                  scrollController: scrollController);*/
            return LocationRangeBottomSheet(
                scrollController: scrollController);

            // }
          },
        );
      },
    ).then((value){
      print("showDialog");
      selectedCategories.value = [];

    });
  }

  void changeCountry(Country? c) {
    if(c!=null && c.id!=-1) {
      if (selectedUserLocations.isNotEmpty) {
        //country and country
        if (selectedUserLocations[0] is Country) {
          Country? country = selectedUserLocations.firstWhereOrNull((
              element) => element.id == c!.id);
          if (country == null) {
            selectedUserLocations.add(c);
          }
          isAreaEnabled.value = false;
        }
      } else {
        Country? country = selectedUserLocations.firstWhereOrNull((
            element) => element.id == c!.id);
        if (country == null) {
          selectedUserLocations.add(c);
        }
      }

      if (c?.areas != null && c!.areas!.isNotEmpty) {
        areasForLocationSheet.value =
        c.areas!;
        Area? areaIn = areasForLocationSheet.firstWhereOrNull((
            element) => element.id == -1);
        if(areaIn==null) {
          areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
        }
      } else {
        areasForLocationSheet.value = [];
      }
    }
  }

  void changeArea(Area? area) {
    if(area!=null && area.id!=-1) {
      if (selectedUserLocations.isNotEmpty) {
        //country and country
        if (selectedUserLocations[0] is Country &&
            selectedUserLocations.length == 1) {
          Area? areaIn = selectedUserLocations.firstWhereOrNull((
              element) => element.id == area!.id);
          if (areaIn == null) {
            selectedUserLocations.add(area);
          }
          //selectedUserLocations.add(area);
          isCountryEnabled.value = false;
        } else {
          Area? areaIn = selectedUserLocations.firstWhereOrNull((
              element) => element.id == area!.id);
          if (areaIn == null) {
            selectedUserLocations.add(area);
          }
          isCountryEnabled.value = false;
        }
      }
    }

/*    if(c?.areas!=null && c!.areas!.isNotEmpty) {
      areasForLocationSheet.value =
      c.areas!;
    }else{
      areasForLocationSheet.value = [];
    }*/
  }

  void removeCountryOrArea(id) {
    selectedUserLocations.removeWhere((element) =>element.id==id);
   if(selectedUserLocations.length==0){
     isCountryEnabled.value = true;
     isAreaEnabled.value = true;
   }
  }
}