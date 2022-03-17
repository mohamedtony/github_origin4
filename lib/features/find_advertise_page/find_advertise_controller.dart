import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesModel.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesNameModel.dart';
import 'package:advertisers/app_core/network/models/FileModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersFromModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersModel.dart';
import 'package:advertisers/app_core/network/models/SelectedNotSelectedSortType.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/GetAdvertisersRequest.dart';
import 'package:advertisers/app_core/network/responses/CreateAdvertiseRequestResponse.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/controller/request_advertise_controller.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as myDio;
import 'package:video_compress/video_compress.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class FindAdvertiseController extends GetxController {
  var isLoading = true.obs;
  var isEmpty = false.obs;
  RxList<GetAdvertisersModel> advertisersModel = <GetAdvertisersModel>[].obs;
  var advertisersFormModel = GetAdvertisersFromModel().obs;

  RxList<SelectedNotSelectedSortType> advertisersTopRated =
      <SelectedNotSelectedSortType>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  var isLoadingGetAdvertisersFromModel = true.obs;
  String? myToken;

  List<String> images = [
    'الاسرع ردا',
    'الاقدم',
    'الاحدث',
    'الاعلى تقييما',
    'الاعلى تقييما'
  ];
  List<String> sections = [
    'ابحث عن المعلن من خلال القسم',
    'الاقدم',
    'الاعلى تقييما',
    'الاعلى تقييما',
    'الاعلى تقييما'
  ];
  List<String> socials = [
    'سناب شات',
    'الاقدم',
    'الاعلى تقييما',
    'الاعلى تقييما',
    'الاعلى تقييما'
  ];

  //List<String> numbers=['من 1000 الى 2000','الاقدم','الاعلى تقييما','الاعلى تقييما','الاعلى تقييما'];
  final List<String> ranges = [
    '100 - 1000',
    '1000 - 10000',
    '10000 - 100000',
    '100000 - 1000000'
  ];
  List<String> countries = [
    'الدولة',
    'الاقدم',
    'الاعلى تقييما',
    'الاعلى تقييما',
    'الاعلى تقييما'
  ];
  List<String> cities = [
    'المدينة',
    'الاقدم',
    'الاعلى تقييما',
    'الاعلى تقييما',
    'الاعلى تقييما'
  ];
  List<String> selectedCities = ['مكة', 'جدة', 'الرياض'];

  //location range
  RxList<Country> countriesForLocationSheet = <Country>[].obs;
  RxList<Area> areasForLocationSheet = <Area>[].obs;
  var selectedCountry = Country().obs;
  var selectedArea = Area().obs;
  var selectedChannel = Channel().obs;
  RxList<dynamic> selectedUserLocations = <dynamic>[].obs;
  var isFilterSavedClicked = false.obs;
  var isAreaEnabled = true.obs;
  var isCountryEnabled = true.obs;
  var selectedCategory = CategoryModel().obs;
  late TextEditingController searchAdvertiserController;
  var selectedEffectSlidesModel = EffectSlidesModel(id: -1,).obs;
  late RequestAdvertiseController requestAdvertiseController;

  final PagingController<int, GetAdvertisersModel> pagingController = PagingController(firstPageKey: 0);

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    myToken = await storage.read("token");
/*    pagingController.addPageRequestListener((pageKey) async {
      print("hhhhhhhhhhhhhhhhhhhhhhhh");
      await _fetchPage(pageKey);
    });*/
    searchAdvertiserController = TextEditingController();
    /*client!.getAdvertisers("Bearer " + myToken!, GetAdvertisersRequest())
        .then((value) {
      if (value.status == 200 && value.data != null && value.data!.isNotEmpty) {
        isLoading.value = false;
        isEmpty.value = false;
        advertisersModel.value = value.data!;
      } else {
        isLoading.value = false;
        isEmpty.value = true;
      }
    });*/



    super.onInit();
    requestAdvertiseController = Get.find();

  }


  void getAdvertisersForm(BuildContext context) {
    print("here");
    client!.getAdvertisersForm("Bearer " + myToken!).then((value) {
      if (value.status == 200 && value.data != null) {
        print("hereHerre");

        advertisersFormModel.value = value.data!;
        countriesForLocationSheet.value = advertisersFormModel.value.countries!;
        /* countriesForLocationSheet.forEach((element) {
            Logger().i(element.toJson());
          });*/
        if (countriesForLocationSheet[0].areas != null &&
            countriesForLocationSheet[0].areas!.isNotEmpty) {
          areasForLocationSheet.value = countriesForLocationSheet[0].areas!;
        }
        countriesForLocationSheet.insert(0, Country(id: -2, name: 'كل الدول'));
        countriesForLocationSheet.insert(0, Country(id: -1, name: 'إختر'));
        Area? areaIn = areasForLocationSheet
            .firstWhereOrNull((element) => element.id == -1);
        if (areaIn == null) {
          areasForLocationSheet.insert(0, Area(id: -2, name: 'كل المناطق'));
          areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
        }

        advertisersFormModel.value.categories?.insert(
            0, CategoryModel(id: -1, name: 'ابحث عن المعلن من خلال القسم'));
        advertisersFormModel.value.channels
            ?.insert(0, Channel(id: -1, name: 'اختر'));
        advertisersFormModel.value.effect_slides
            ?.insert(0, EffectSlidesModel(id: -1, name: 'اختر'));
        // advertisersFormModel.value.countries?.insert(0, Country(id: -1,name: 'اختر'));
        advertisersTopRated.value = [];
        isLoadingGetAdvertisersFromModel.value = false;
        advertisersTopRated.add(SelectedNotSelectedSortType(
          name: advertisersFormModel.value.sort_types!.reply_speed!,
          key: "reply_speed",
        ));
        advertisersTopRated.add(SelectedNotSelectedSortType(
          name: advertisersFormModel.value.sort_types!.oldest!,
          key: "oldest",
        ));
        advertisersTopRated.add(SelectedNotSelectedSortType(
          name: advertisersFormModel.value.sort_types!.latest!,
          key: "latest",
        ));
        advertisersTopRated.add(SelectedNotSelectedSortType(
          name: advertisersFormModel.value.sort_types!.top_rated!,
          key: "top_rated",
        ));
        advertisersTopRated.add(SelectedNotSelectedSortType(
          name: advertisersFormModel.value.sort_types!.most_ads!,
          key: "most_ads",
        ));
        advertisersTopRated.add(SelectedNotSelectedSortType(
          name: advertisersFormModel.value.sort_types!.most_followers!,
          key: "most_followers",
        ));
        advertisersTopRated.add(SelectedNotSelectedSortType(
          name: advertisersFormModel.value.sort_types!.less_followers!,
          key: "less_followers",
        ));
      } else {
        isLoadingGetAdvertisersFromModel.value = false;
      }
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
          if (country == null) {
            isAreaEnabled.value = true;
            selectedUserLocations.add(c);
            /*if(c.areas!=null&&c.areas!.isNotEmpty) {
              areasForLocationSheet.value = c.areas!;
            }*/
          }
        }

        if (c.areas != null && c.areas!.isNotEmpty) {
          //isAreaEnabled.value = true;
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
/*  void onSelectedLocationClicked(int id) {
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

    }else{
      selectedUserLocations.removeWhere((element) => element.id == id);
    }
    if(selectedUserLocations.isEmpty){
      isAreaEnabled.value = true;
      isCountryEnabled.value = true;
     // areasForLocationSheet.value.clear();
     // areasForLocationSheet.insert(0, Area(id: -1,name: 'إختر'));
      selectedCountry.value = countriesForLocationSheet.first;
      selectedArea.value = areasForLocationSheet.first;
      areasForLocationSheet.value = [];
      areasForLocationSheet.insert(0, Area(id: -1,name: 'إختر'));

    }
  }*/

  void onSelectedLocationClicked(int id) {

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
        Area? area1 = areasForLocationSheet.firstWhereOrNull((element) => element.id==-2);
        if(area1==null) {
          areasForLocationSheet.insert(0, Area(id: -2, name: 'كل المناطق'));
        }
        Area? area = areasForLocationSheet.firstWhereOrNull((element) => element.id==-1);
        if(area==null) {
          areasForLocationSheet.insert(0, Area(id: -1, name: 'إختر'));
        }
      }
      selectedCountry.value = selectedUserLocations[0];


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

  onDateClickedSaved(BuildContext context) {
    isFilterSavedClicked.value = true;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      "تم حفظ البيانات بنجاح !",
      style: TextStyle(
          color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
    )));
    Get.back();
    isLoading.value = true;
    String? sortByStrings = '';
    advertisersTopRated.forEach((element) {
      if (element.isSelected.isTrue) {
        sortByStrings = sortByStrings! + '${element.key},';
      }
    });
    List<int> categoriesId = [];
    if (selectedCategory.value != null &&
        selectedCategory.value.id != null &&
        selectedCategory.value.id != -1) {
      categoriesId.add(selectedCategory.value.id!);
    }
    List<int> countriesId = [];
    List<int> areasIds = [];
    List<int> countryCaregoriesIds = [];
    selectedUserLocations.forEach((element) {
      if (element != null && element is Country && element.type == 'country') {
        countriesId.add(element.id!);
      }
      if (element != null && element is Area) {
        areasIds.add(element.id!);
      }
      if (element != null &&
          element is Country &&
          element.type == 'country_category') {
        print("isAreaEnabledHere country_category");
        countryCaregoriesIds.add(element.id!);
      }
    });
    Logger().i(GetAdvertisersRequest(
            sort_by: sortByStrings!.isNotEmpty ? sortByStrings : null,
            categories: categoriesId.isNotEmpty ? categoriesId : null,
            country_category:
                countryCaregoriesIds.isNotEmpty ? countryCaregoriesIds : null,
            countries: countriesId.isNotEmpty ? countriesId : null,
            areas: areasIds.isNotEmpty ? areasIds : null,
            keyword: searchAdvertiserController.text.isNotEmpty
                ? searchAdvertiserController.text
                : null)
        .toJson());
    client!
        .getAdvertisers(
            "Bearer " + myToken!,
            GetAdvertisersRequest(
                sort_by: sortByStrings!.isNotEmpty ? sortByStrings : null,
                categories: categoriesId.isNotEmpty ? categoriesId : null,
                country_category: countryCaregoriesIds.isNotEmpty
                    ? countryCaregoriesIds
                    : null,
                countries: countriesId.isNotEmpty ? countriesId : null,
                areas: areasIds.isNotEmpty ? areasIds : null,
                keyword: searchAdvertiserController.text.isNotEmpty
                    ? searchAdvertiserController.text
                    : null))
        .then((value) {
      if (value.status == 200 && value.data != null && value.data!.isNotEmpty) {
        isLoading.value = false;
        isEmpty.value = false;
        advertisersModel.value = value.data!;
      } else {
        isLoading.value = false;
        isEmpty.value = true;
      }
    });
  }

  void showToast(msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  void onReturnClicked(BuildContext context) {
    isFilterSavedClicked.value = false;
    isCountryEnabled.value = true;
    isAreaEnabled.value = true;
    areasForLocationSheet.value = [];
    areasForLocationSheet.value.insert(0,Area(id: -1,name: 'اختر'));
    selectedCategory.value = CategoryModel();
    advertisersTopRated.value.forEach((element) {
      element.isSelected.value = false;
    });
    selectedCategory.value = CategoryModel();
    selectedCountry.value = Country();
    selectedArea.value = Area();
    selectedChannel.value = Channel();
    selectedUserLocations.value = [];
    searchAdvertiserController.text = '';
    selectedEffectSlidesModel.value = EffectSlidesModel();
  }

  RxInt indexClicked = RxInt(-1);
  var selectedAdvertiseId = -1;

  void changeIndex(int index, int bakaId) {
    print("inIndex" + indexClicked.value.toString());
    if (indexClicked.value == index) {
      indexClicked.value = -1;
      selectedAdvertiseId = -1;
      return;
    }
    indexClicked.value = index;
    selectedAdvertiseId = bakaId;
  }

  Future<void> onSendRequestClicked(BuildContext context) async {
    if (requestAdvertiseController.categoryId == -1) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "يجب اختيار نوع المنتج !",
        style: TextStyle(
            color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
      )));
      return;
    } else if (requestAdvertiseController.adTypeId == -1) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "يجب اختيار نوع الاعلان !",
        style: TextStyle(
            color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
      )));
      return;
    } else if (requestAdvertiseController.descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "يجب إضافة وصف للاعلان !",
        style: TextStyle(
            color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
      )));
      return;
    } else if (requestAdvertiseController.fromDate.value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "يجب إضافة تاريخ بداية الاعلان !",
        style: TextStyle(
            color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
      )));
      return;
    } else if (requestAdvertiseController.isFlixble.isTrue &&
        requestAdvertiseController.toDate.value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "يجب إضافة تاريخ نهاية الاعلان !",
        style: TextStyle(
            color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
      )));
      return;
    } else if(requestAdvertiseController.showInPlatform.isTrue && requestAdvertiseController.endAdvertisingDate.isEmpty){
      showToast("من فضلك يرجى إختيار تاريخ انتهاء مدة العرض فى المنصة!");
      requestAdvertiseController.onSelectedDateEndedAtPlateform(context);
      return;
    }else if (requestAdvertiseController.channelsIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "يجب إختيار قنوات الاعلان !",
        style: TextStyle(
            color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
      )));
      return;
    } else if (selectedAdvertiseId == -1) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "يجب إختيار المعلن !",
        style: TextStyle(
            color: AppColors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
      )));
      return;
    }
    //var file = await MultipartFile(requestAdvertiseController.attatechedFilesImageAndVideo[0].file, filename: "mmm");
    LoadingDailog().showLoading(context);
/*     List<myDio.MultipartFile>? _files = [];

     requestAdvertiseController.attatechedFilesImageAndVideo.value.forEach((element) async {
          if(element.file!=null && element.file!.path.isNotEmpty) {
            print("inFor");
            var mFile = await myDio.MultipartFile.fromFile(element.file!.path,
                filename: element.file!
                    .path
                    .split(Platform.pathSeparator)
                    .last);
            _files.add(mFile);
          }
    });*/
/*    myDio.MultipartFile? imageCopon;
    if(requestAdvertiseController.imagePath.value.isNotEmpty) {
      imageCopon = await myDio.MultipartFile.fromFile(
          requestAdvertiseController.imagePath.value,
          filename: requestAdvertiseController.imagePath.value
              .split(Platform.pathSeparator)
              .last);
    }

    myDio.MultipartFile? planFile;
    if (requestAdvertiseController.planFile?.path != null && requestAdvertiseController.planFile!.path.isNotEmpty) {
      planFile = await myDio.MultipartFile.fromFile(
          requestAdvertiseController.planFile!.path,
          filename: requestAdvertiseController.planFile!.path
              .split(Platform.pathSeparator)
              .last);
    }*/

    if(requestAdvertiseController.imageFideoFiles!=null && requestAdvertiseController.imageFideoFiles!.isEmpty){
      print("myFilesEmpty");
    }else{
      print("videosNum"+requestAdvertiseController.imageFideoFiles!.length.toString());
    }
/*    requestAdvertiseController.attatechedFilesImageAndVideo.forEach((element) async {
       compressVideo(element.file!).then((value) async {
        print("videoLengthIn= "+value.lengthSync().toString());
        var mFile =  await myDio.MultipartFile.fromFile(value.path,
            filename: value.path
                .split(Platform.pathSeparator)
                .last);
        requestAdvertiseController.imageFideoFiles?.add(mFile);
      });
    });*/
    //_parseInBackground();
    print("offer_ended_at"+requestAdvertiseController.endAdvertisingDate.value);

    Map<String, dynamic> mymap = {
      "token": "Bearer " + myToken!,
      "advertiser_id": selectedAdvertiseId,
      "product_category_id": requestAdvertiseController.categoryId,
      "description": requestAdvertiseController.descriptionController.text,
      "ads_type_id": requestAdvertiseController.adTypeId,
      "date_type":
          requestAdvertiseController.isFlixble.isTrue ? "flexible" : "fixed",
      "started_at": requestAdvertiseController.fromDate.value,
      "ended_at": requestAdvertiseController.isFlixble.isTrue
          ? requestAdvertiseController.toDate.value
          : null,
      "offer_ended_at":
          requestAdvertiseController.endAdvertisingDate.value.isNotEmpty
              ? requestAdvertiseController.endAdvertisingDate.value
              : null,
      "repeat_count":requestAdvertiseController.isFlixble.isTrue?
          int.parse(requestAdvertiseController.selectedCounterController.text):1,
      "channels[]": requestAdvertiseController.channelsIds,
      "attachments[]": requestAdvertiseController.imageFideoFiles!.isNotEmpty ? requestAdvertiseController.imageFideoFiles : null,
 /*     "links[][title]": requestAdvertiseController.links.value.isNotEmpty
          ? requestAdvertiseController.links.value.map((e) => e.title).toList()
          : null,
      "links[][link]": requestAdvertiseController.links.value.isNotEmpty
          ? requestAdvertiseController.links.value.map((e) => e.link).toList()
          : null,*/
      "location[name]": requestAdvertiseController.locationModel.name,
      "location[address]": requestAdvertiseController.locationModel.address,
      "location[lat]": requestAdvertiseController.locationModel.lat,
      "location[lng]": requestAdvertiseController.locationModel.lng,
      "copon[image]": requestAdvertiseController.imageCoponMultiPart,
      "copon[code]": requestAdvertiseController.coponNumberController?.text,
      "copon[name]": requestAdvertiseController.coponNameController?.text,
      "copon[discount]":
      requestAdvertiseController.coponDiscountController?.text!=null&&requestAdvertiseController.coponDiscountController!.text.isNotEmpty?int.parse(requestAdvertiseController.coponDiscountController!.text):null,
      "copon[uses]": requestAdvertiseController.coponUsesController?.text!=null&&requestAdvertiseController.coponUsesController!.text.isNotEmpty?int.parse(requestAdvertiseController.coponUsesController!.text):null,
      "copon[link]": requestAdvertiseController.coponLinkController?.text!=null&&requestAdvertiseController.coponLinkController!.text.isNotEmpty?requestAdvertiseController.coponLinkController!.text:null,
      "copon[ended_at]": requestAdvertiseController.endAdvertisingDateCoupon.value,
      "notes": requestAdvertiseController.noticeController?.text,
      "plan_file": requestAdvertiseController.planFile,
      "inline":requestAdvertiseController.showInPlatform.isTrue?1:0
    };
    Map<String, dynamic> mymap2={};
    if(requestAdvertiseController.links.value.isNotEmpty){
      for (var value1 in requestAdvertiseController.links.value) {
        mymap2={
         "links[${requestAdvertiseController.links.value.indexOf(value1)}][title]":"${value1.name}",
          "links[${requestAdvertiseController.links.value.indexOf(value1)}][link]":"${value1.link}"
        };
        if(mymap2.isNotEmpty) {
          mymap.addAll(mymap2);
        }
      }
    }
    Logger().i("mymap"+mymap.toString());
    Repository repo = Repository();
    repo.postWithImageMultipart<CreateAdvertiseRequestResponse>(
        path: 'requests',
        fromJson: (json) => CreateAdvertiseRequestResponse.fromJson(json),
        json: mymap,
        onSuccess: (res) async {
          //Navigator.of(context).pop();
          Get.back();
          Logger().i(res.data!.toJson());
          if (res.message != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('تم إنشاء طلبك بنجاح !', style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Arabic-Regular'),),
            ));
          }
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Get.delete<RequestAdvertiseController>();
          Get.delete<FindAdvertiseController>();
          //Get.offAllNamed('/Home');
        },
        onError: (err, res) {
          //Navigator.of(context).pop();
          Get.back();
          Logger().i(err);
        });

    /*String json = jsonEncode(mymap);
    Logger().i(json);*/

/*    String json = jsonEncode(mymap);
    final formData = myDio.FormData.fromMap(

        mymap
    );*/

/*    Map<String, dynamic> mymap = {
      "token": "Bearer " + myToken!,
      "advertiser_id": selectedAdvertiseId,
      "product_category_id": requestAdvertiseController.categoryId,
      "description": requestAdvertiseController.descriptionController.text,
      "ads_type_id": requestAdvertiseController.adTypeId,
      "date_type":
      requestAdvertiseController.isFlixble.isTrue ? "flexible" : "fixed",
      "started_at": requestAdvertiseController.fromDate.value,
      "ended_at": requestAdvertiseController.isFlixble.isTrue
          ? requestAdvertiseController.toDate.value
          : null,
      "offer_ended_at":
      requestAdvertiseController.endAdvertisingDate.value.isNotEmpty
          ? requestAdvertiseController.endAdvertisingDate.value
          : null,
      "repeat_count":
      int.parse(requestAdvertiseController.selectedTimeCounter.value),
      "channels[]": requestAdvertiseController.channelsIds,
      "attachments[]": requestAdvertiseController.imageFideoFiles!.isNotEmpty ? requestAdvertiseController.imageFideoFiles : null,
      "links": requestAdvertiseController.links.value.isNotEmpty
          ? requestAdvertiseController.links.value
          : null,
      "location[name]": requestAdvertiseController.locationModel.name,
      "location[address]": requestAdvertiseController.locationModel.address,
      "location[lat]": requestAdvertiseController.locationModel.lat,
      "location[lng]": requestAdvertiseController.locationModel.lng,
      "copon[image]": requestAdvertiseController.imageCoponMultiPart,
      "copon[code]": requestAdvertiseController.coponNumberController?.text,
      "copon[name]": requestAdvertiseController.coponNameController?.text,
      "copon[discount]":
      requestAdvertiseController.coponDiscountController?.text,
      "copon[uses]": requestAdvertiseController.coponUsesController?.text,
      "copon[link]": requestAdvertiseController.coponLinkController?.text,
      "copon[ended_at]": requestAdvertiseController.endAdvertisingDateCoupon,
      "notes": requestAdvertiseController.noticeController?.text,
      "plan_file": requestAdvertiseController.planFile
    };

    client!.createAdvertiseRequest("application/json","Bearer "+myToken!,advertiser_id: mymap['advertiser_id'],ended_at: mymap['ended_at'],started_at: mymap['started_at'],product_category_id: mymap['product_category_id'],ads_type_id: mymap['ads_type_id'],channelsIdes: mymap['channels[]'],date_type: mymap['date_type'],description: mymap['description'],links: mymap['links'],
      offer_ended_at: mymap['offer_ended_at'],repeat_count: mymap['repeat_count'],attachments: requestAdvertiseController.attatechedFilesImageAndVideo.value.map((e) => e.file!).toList(),).then((value){
      print('mStatus ${value.status}');
      print('mStatus ${value.message}');
      Logger().i(value.data!.toJson());
    });*/

  }


  // Spawns an isolate and waits for the first message
/*  Future<File> _parseInBackground() async {
    final p = ReceivePort();
    await Isolate.spawn(_compressVideo, p.sendPort);
    return await p.first;
  }
  late Isolate _isolate;
  bool _running = false;
  static int _counter = 0;
  String notification = "";
  late ReceivePort _receivePort;

  void _start() async {
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_checkTimer, _receivePort.sendPort);
    _receivePort.listen(_handleMessage, onDone:() {
      print("done!");
    });
  }*/

/*  static void _checkTimer(SendPort sendPort) async {
*//*    Timer.periodic(new Duration(seconds: 1), (Timer t) {
      _counter++;
      String msg = 'notification ' + _counter.toString();
      print('SEND: ' + msg);
      sendPort.send(msg);
    });*//*
    _compressVideo(sendPort);
  }

  void _handleMessage(dynamic data) {
    print('RECEIVED: ' + data);
  }*/

/*  void _stop() {
    if (_isolate != null) {
      setState(() {
        _running = false;
        notification = '';
      });
      _receivePort.close();
      _isolate.kill(priority: Isolate.immediate);
      _isolate = null;
    }
  }*/

 // static List<FileModel>  attatechedFilesImageAndVideo = requestAdvertiseController.attatechedFilesImageAndVideo;
/*  static Future _compressVideo(SendPort p) async {
    attatechedFilesImageAndVideo.forEach((element) async {
      MediaInfo? mediaInfo = await VideoCompress.compressVideo(
        element.file!.path,
        quality: VideoQuality.LowQuality,
        deleteOrigin: false, // It's false by default
      );
      print("mFime");
*//*      compressVideo(element.file!).then((value) async {
        print("videoLengthIn= "+value.lengthSync().toString());
        var mFile =  await myDio.MultipartFile.fromFile(value.path,
            filename: value.path
                .split(Platform.pathSeparator)
                .last);
        requestAdvertiseController.imageFideoFiles?.add(mFile);
      });*//*
    });


   // return mediaInfo!.file!;
    Isolate.exit(p, File(""));
  }*/

}
