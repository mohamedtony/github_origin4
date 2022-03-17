import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/requests/OneCountryAndCitiesRequest.dart';
import 'package:advertisers/app_core/network/requests/UpdateUserCategoryRequest.dart';
import 'package:advertisers/features/add_advertiser_channel/add_advertiser_channel.dart';
import 'package:advertisers/features/advanced_options/view/pages/advanced_options_page.dart';
import 'package:advertisers/features/advertiser_account_status/tax_settings/view/pages/advertiser_account_status_page.dart';
import 'package:advertisers/features/advertiser_settings_page/widgets/activities_bottom_sheet.dart';
import 'package:advertisers/features/advertiser_settings_page/widgets/location_range_sheet.dart';
import 'package:advertisers/features/advertising_influence_channels/view/page/advertising_influence_channels_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/tax_settings/view/pages/tax_settings_page.dart';
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
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertiserSettingPageController extends GetxController  {
  var isOpend = false;
  var position = -1;
  var tabIndex = 1.obs;
  TextEditingController? kayanNameController,sglNumberController,accountNameEdit,accountOwner,phoneController,emailController,accountRegisteredNumController,personalIdController;
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
  var accountType = ''.obs;
  var profile_completion = 0.obs;
  String? myToken;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit

    kayanNameController = TextEditingController();
    accountNameEdit= TextEditingController();
    accountOwner= TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    accountRegisteredNumController  = TextEditingController();
    sglNumberController = TextEditingController();
    personalIdController = TextEditingController();
     myToken  = await storage.read("token");
    super.onInit();
  }

  void changeIndex(int position) {
    this.tabIndex.value = position;

  }
  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    /*Get.dialog(
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
    );*/
    EasyLoading.show();
    client!.getMyProfile("Bearer "+myToken!).then((value) {
      Logger().i(value.data?.toJson());
      if(value.data!=null&&value.status==200){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        clientProfileModel.value = value.data!;
       // kayanNameController?.text = "tony";
        if(clientProfileModel.value.company_name!=null) {
          kayanNameController?.text = clientProfileModel.value.company_name!;
        }
        if(clientProfileModel.value.account_name!=null) {
          accountNameEdit?.text = clientProfileModel.value.account_name!;
        }
        if(clientProfileModel.value.manager_name !=null) {
          accountOwner?.text = clientProfileModel.value.manager_name!;
        }
        if(clientProfileModel.value.type !=null)
          accountType.value = clientProfileModel.value.type!;
        if(clientProfileModel.value.sgl!=null) {
          sglNumberController?.text = clientProfileModel.value.sgl!;
        }
        if(clientProfileModel.value.personal_id!=null) {
          personalIdController?.text = clientProfileModel.value.personal_id!;
        }

        if(clientProfileModel.value.profile_completion!=null){
          profile_completion.value = ((clientProfileModel.value.profile_completion)!~/10);
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

  Future<void> showActivitiesBottomSheet(BuildContext context, int bottomNumber) async {

    client!.getCategories("Bearer "+myToken!).then((value) {
      isLoading.value = false;
      if(value.data!=null&&value.status==200){
        if(value.data!.user_categories!=null&&value.data!.user_categories!.isNotEmpty){
          userCategories.value = value.data!.user_categories!;
          selectedCategories.value = value.data!.user_categories!;

        }
        if(value.data!.all_categories!=null&&value.data!.all_categories!.isNotEmpty){
          generalCategories.value = value.data!.all_categories!;
          generalCategories.value.insert(0, CategoryModel(id:-2,name: 'كل النشاطات'));
          generalCategories.value.insert(0, CategoryModel(id:-1,name: 'اختر'));
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
    if(s.id==-2){
      //List<CategoryModel> selectedCategories2 = [];
      selectedCategories.value = [];
      generalCategories.forEach((selectedCategory) {
        CategoryModel? categoryModel = selectedCategories.firstWhereOrNull((element) => element.id==s.id);
        if(categoryModel==null && selectedCategory.id!=-1&& selectedCategory.id!=-2){
          selectedCategories.add(selectedCategory);
          //update();
        }
      });

    }else{
      CategoryModel? categoryModel = selectedCategories.firstWhereOrNull((element) => element.id==s.id);
      if(categoryModel==null && s.id!=-1){
        selectedCategories.add(s);
        //update();
      }
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
    client!.updateUserCategories(UpdateUserCategoryRequest(categories:selectedCategoriesIds.value),"Bearer "+myToken!).then((value) {
      Get.back();
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
      //isLoadingLocation.value = false;
      if(value.data!=null){
        countriesForLocationSheet.value = value.data!;
        /*countriesForLocationSheet.forEach((element) {
          Logger().i(element.toJson());
        });*/
        if(countriesForLocationSheet[0].areas!=null&&countriesForLocationSheet[0].areas!.isNotEmpty) {
          areasForLocationSheet.value =
              countriesForLocationSheet[0].areas!;

        }
        countriesForLocationSheet.insert(0, Country(id: -2,name: 'كل الدول'));
        countriesForLocationSheet.insert(0, Country(id: -1,name: 'إختر'));
        Area? areaIn = areasForLocationSheet.firstWhereOrNull((
            element) => element.id == -1);
        if(areaIn==null) {
          areasForLocationSheet.insert(0, Area(id: -2, name: 'كل المناطق'));
          areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
        }

         client!.getUseLocations("Bearer "+myToken!).then((value){
          isLoadingLocation.value = false;
          value.data?.countries?.forEach((element) {
            Logger().i(element.toJson());
          });
          if(value.data!=null){
            if(value.data?.countries!=null && value.data!.countries!.isNotEmpty) {
              selectedUserLocations.value =[];
              selectedUserLocations.addAll(value.data!.countries!);

              if(selectedUserLocations.length == 1 && selectedUserLocations[0] is Country) {
                selectedCountry.value = selectedUserLocations.first;
                Country? country = countries.firstWhereOrNull((element) => element.id == selectedCountry.value.id);
                if (country!=null && country.type == 'country_category') {
                  isAreaEnabled.value = false;
                }
                if(country!=null && country.areas!=null){
                  areasForLocationSheet.value = country.areas!;

                  Area? area1 = areasForLocationSheet.firstWhereOrNull((
                      element) => element.id == -2);
                  if (area1 == null) {
                    areasForLocationSheet.insert(
                        0, Area(id: -2, name: 'كل المناطق'));
                  }
                  Area? area = areasForLocationSheet.firstWhereOrNull((
                      element) => element.id == -1);
                  if (area == null) {
                    areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
                  }
                  //selectedArea.value = areasForLocationSheet.value[0];
                }



                /*if (selectedCountry.value.areas != null && selectedCountry.value.areas!.isNotEmpty) {
                  print("llllllllllll");
                  areasForLocationSheet.value = selectedCountry.value.areas!;

                  Area? area1 = areasForLocationSheet.firstWhereOrNull((
                      element) => element.id == -2);
                  if (area1 == null) {
                    areasForLocationSheet.insert(
                        0, Area(id: -2, name: 'كل المناطق'));
                  }
                  Area? area = areasForLocationSheet.firstWhereOrNull((
                      element) => element.id == -1);
                  if (area == null) {
                    areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
                  }
                  //selectedArea.value = areasForLocationSheet.value[0];
                }*/
              }
            }
          }
        });
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
    Logger().i(c!.toJson());
    if (c != null && c.id == -2) {
        isAreaEnabled.value = false;
      selectedUserLocations.value = [];
      countriesForLocationSheet.forEach((countryForLocationSheet) {
        Country? categoryModel = selectedUserLocations
            .firstWhereOrNull((element) => element.id == c.id);
        if (categoryModel == null &&
            countryForLocationSheet.id != -1 &&
            countryForLocationSheet.id != -2 &&
            countryForLocationSheet.type != "country_category") {
          selectedUserLocations.add(countryForLocationSheet);
          //update();
        }
      });
    } else {
      if (c != null && c.id != -1) {
        if (selectedUserLocations.isNotEmpty) {
          //country and country
          if (selectedUserLocations[0] is Country &&
              selectedUserLocations[0].type == 'country_category') {
            if (c.type == 'country_category') {
              Country? country = selectedUserLocations
                  .firstWhereOrNull((element) => element.id == c.id);
              if (country == null) {
                selectedUserLocations.add(c);
              }
              isAreaEnabled.value = false;
            }
          } else {
            if (selectedUserLocations[0].type == 'country_category' &&
                c.type == 'country_category') {
              Country? country = selectedUserLocations
                  .firstWhereOrNull((element) => element.id == c.id);
              if (country == null) {
                selectedUserLocations.add(c);
              }
            }
          }
          if (selectedUserLocations[0] is Country &&
              selectedUserLocations[0].type == 'country') {
            if (c.type == 'country') {
              Country? country = selectedUserLocations
                  .firstWhereOrNull((element) => element.id == c.id);
              if (country == null) {
                selectedUserLocations.add(c);
              }
              isAreaEnabled.value = false;
            }
            /* if(selectedUserLocations.length==1){

            }*/
          }
        } else {
          print("inElse");
          Country? country = selectedUserLocations
              .firstWhereOrNull((element) => element.id == c.id);
          if (country == null /*&& selectedUserLocations.isNotEmpty && selectedUserLocations[0].type!="country_category"*/) {
            isAreaEnabled.value = true;
            selectedUserLocations.add(c);
            /*if(c.areas!=null&&c.areas!.isNotEmpty) {
              areasForLocationSheet.value = c.areas!;
            }*/
          }
        }

        if (c.areas != null && c.areas!.isNotEmpty) {
          if((selectedUserLocations.isNotEmpty && selectedUserLocations[0].type!="country_category") && selectedUserLocations.length==1) {
            isAreaEnabled.value = true;
          }else if(selectedUserLocations.isNotEmpty && selectedUserLocations[0].type=="country_category"){
            isAreaEnabled.value = false;
          }
          areasForLocationSheet.value = c.areas!;
          print("inElseHere");
          Area? areaIn = areasForLocationSheet
              .firstWhereOrNull((element) => element.id == -1);
          if (areaIn == null) {
            areasForLocationSheet.insert(0, Area(id: -2, name: 'كل المناطق'));
            areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
          }
        } else {
          areasForLocationSheet.value = [];
        }
      }/*else if(c!=null && c.id!=-1&& c.id!=-2){

      }*/
    }
  }

  void changeArea(Area? area) {
    if (area != null && area.id != -1) {
      if (selectedUserLocations.isNotEmpty) {
        //country and country
        if (selectedUserLocations[0] is Country &&
            selectedUserLocations.length == 1) {
          if (area.id == -2) {
            isCountryEnabled.value = false;
            //selectedUserLocations.value = [];
            areasForLocationSheet.forEach((areaForLocationSheet) {
              Area? areaModel = selectedUserLocations
                  .firstWhereOrNull((element) => element.id == area.id);
              if (areaModel == null &&
                  areaForLocationSheet.id != -1 &&
                  areaForLocationSheet.id != -2) {
                selectedUserLocations.add(areaForLocationSheet);
                //update();
              }
            });
          } else {
            Area? areaIn = selectedUserLocations.firstWhereOrNull(
                    (element) => element.id == area.id && (element is Area));
            if (areaIn == null) {
              selectedUserLocations.add(area);
            }
            //selectedUserLocations.add(area);
            isCountryEnabled.value = false;
          }
        } else {
          if(area != null && area.id != -2) {
            Area? areaIn = selectedUserLocations.firstWhereOrNull(
                    (element) => element.id == area.id && (element is Area));
            if (areaIn == null) {
              selectedUserLocations.add(area);
            }
            isCountryEnabled.value = false;
          }else if(area.id == -2){
            isCountryEnabled.value = false;
            //selectedUserLocations.value = [];
            areasForLocationSheet.forEach((areaForLocationSheet) {
              Area? areaModel = selectedUserLocations
                  .firstWhereOrNull((element) => element.id == areaForLocationSheet.id);
              if (areaModel == null &&
                  areaForLocationSheet.id != -1 &&
                  areaForLocationSheet.id != -2) {
                selectedUserLocations.add(areaForLocationSheet);
                //update();
              }
            });
          }
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

  void onUpdateUserLocations(BuildContext context){
    if(isCountryEnabled.value){
      print("isCountryEnabledHere");
      List<int> countriesId= [];
      List<int> areasIds= [];
      List<int> countryCaregoriesIds= [];
      selectedUserLocations.forEach((element) {
        if(element!=null && element is Country && element.type=='country') {
          countriesId.add(element.id!);
        }
        if(element!=null && element is Area) {
          areasIds.add(element.id!);
        }
        if(element!=null && element is Country && element.type=='country_category') {
          print("isAreaEnabledHere country_category");
          countryCaregoriesIds.add(element.id!);
        }
      });
      client!.setMultipleCountry(OneCountryAndCitiesRequest(countries:countriesId,areas: areasIds,country_category: countryCaregoriesIds),"Bearer "+myToken!).then((value) {
        Get.back();
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
    if(isAreaEnabled.value){
      print("isAreaEnabledHere");
      List<int> countriesId= [];
      List<int> areasIds= [];
      selectedUserLocations.forEach((element) {
        if(element!=null && element is Country) {
          countriesId.add(element.id!);
        }
        if(element!=null && element is Area) {
          areasIds.add(element.id!);
        }
      });
      client!.setOneCountryAndCities(OneCountryAndCitiesRequest(countries:countriesId,areas: areasIds),"Bearer "+myToken!).then((value) {
        print("isAreaEnabledHere");
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
  }
  var selectedCountry = Country().obs;
  var selectedArea = Area().obs;

  void removeCountryOrArea(int id) {
    dynamic country = selectedUserLocations.firstWhereOrNull((element) => element.id ==id);
    if(selectedUserLocations.length>=2 && selectedUserLocations[1] is Area && (country!=null && country is Country)) {
     // selectedUserLocations.removeWhere((element) => element.id == id);
      Fluttertoast.showToast(
        msg: " لا يمكن حذف الدولة لانها مرتبطة بالمناطق الرجاء حذف المناطق اولا",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.6),
        textColor: Colors.white,
        fontSize: 14.0,
      );
      return;

    }else{
      selectedUserLocations.removeWhere((element) => element.id == id);
    }
    if(selectedUserLocations.isEmpty){
      isAreaEnabled.value = true;
      isCountryEnabled.value = true;
      // areasForLocationSheet.value.clear();
      // areasForLocationSheet.insert(0, Area(id: -1,name: 'إختر'));
      selectedCountry.value = countriesForLocationSheet.first;
      if(areasForLocationSheet!=null && areasForLocationSheet.isNotEmpty) {
        selectedArea.value = areasForLocationSheet.first;
      }
      areasForLocationSheet.value = [];
      areasForLocationSheet.insert(0, Area(id: -1,name: 'إختر'));
    }else if(selectedUserLocations.value.length==1 && selectedUserLocations.value[0] is Country){
      print("jjjjjjjjjjjjjjjj");
      isAreaEnabled.value = true;
      isCountryEnabled.value = true;
      areasForLocationSheet.value = [];
      if(selectedUserLocations[0].areas!=null) {
        areasForLocationSheet.value = selectedUserLocations[0].areas;
      }
      selectedCountry.value = selectedUserLocations[0];

      Area? area1 = areasForLocationSheet.firstWhereOrNull((element) => element.id==-2);
      if(area1==null) {
        areasForLocationSheet.insert(0, Area(id: -2, name: 'كل المناطق'));
      }
      Area? area = areasForLocationSheet.firstWhereOrNull((element) => element.id==-1);
      if(area==null) {
        areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
      }
    }
    if(areasForLocationSheet!=null && areasForLocationSheet.isNotEmpty) {
      selectedArea.value = areasForLocationSheet[0];
    }
    /*selectedUserLocations.removeWhere((element) =>element==countryOrArea);
   if(selectedUserLocations.length==0){
     isCountryEnabled.value = true;
     isAreaEnabled.value = true;
   }*/
  }

  void showChannelsSheet(BuildContext context, int i) {

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
    if(i==1) {
    /*return AdvertisingChannelsPage(
                  scrollController: scrollController);*/
    return AddAdvertiserChannel(
    //scrollController: scrollController
    );

     }else if(i==2){
      return AdvertisingInfluenceChannelsPage(
          scrollController: scrollController
      );
    }else if(i==3){
      return TaxSettingsPage(
          scrollController: scrollController
      );
    }else if(i==4){
      return AdvertiserAccountStatusPage(
          scrollController: scrollController
      );
    }else if(i==5){
      return AdvancedOptionsPage(
          scrollController: scrollController
      );
    }
    else{
      return SizedBox();
    }
    },
    );
    },
    ).then((value){
    print("showDialog");
   // selectedCategories.value = [];

    });
  }
}