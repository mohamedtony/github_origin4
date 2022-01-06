


import 'package:advertisers/main.dart';
import 'package:advertisers/shared/network/models/Country.dart';
import 'package:advertisers/shared/network/responses/CountriesResponse.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';


class RegisterNewClientUserController extends GetxController{
  GlobalKey<FormState> registerNewClientUserControllerFormKey=GlobalKey<FormState>(debugLabel: 'registerNewClientUserControllerFormKey');

  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController accountNameController;
  late TextEditingController emailController;
  late TextEditingController nationalIDController;
  late TextEditingController passwordController;
  

  var countryCode='sa'.obs;
  var latitude=0.0.obs;
  var longitude=0.0.obs;
  var password='';
  var phone='';
  var logoPath=''.obs;
  var imageBase641=''.obs;
  List<Country> countries = [];
  RxList<Country> items = <Country>[].obs;
  //Repository repo=Repository();
  @override
  void onInit() {
    //repo.postWithImageMultipart({})

    phoneController=TextEditingController();
    nameController=TextEditingController();
    accountNameController=TextEditingController();
    emailController=TextEditingController();
    nationalIDController=TextEditingController();
    passwordController=TextEditingController();

    client!.getCountries().then((value){
      if(value.data!=null){
        items.value = value.data!;
        print(value.data![0].name);
        Logger().i(value.data);
      }
    });

    super.onInit();
  }
  String? validatePhone(String phone){
    if (phone.length<8){
      return 'رقم الهاتف لا يقل 8 رقم';
    }
    return null;
  }


  void checkLogin(){
    final isValid=registerNewClientUserControllerFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    registerNewClientUserControllerFormKey.currentState!.save();
    // loginClient();
    Get.toNamed('/bakaPage');
  }
  // void loginClient(){
  //   repo.post<LoginSalonResponse>(path: '/loginClient',fromJson:(json) => LoginSalonResponse.fromJson(json),
  //       json:LoginSalonRequest(phone: phoneController.text,password: passwordController.text),onSuccess:(res) {
  //         account.model=AccountModel.fromJson(res.account!.toJson());
  //         Get.toNamed("/homeClientPage");
  //       },onError: (err){
  //
  //       }
  //   );
  //
  // }
  @override
  void onClose() {

    phoneController.dispose();

    super.onClose();
  }
  Future<void> getCountries() async {
    CountriesResponse response = await client!.getCountries();
    if(response!=null){
      if(response.data!=null){
        countries=response.data!;
      }

    }
  }
}

