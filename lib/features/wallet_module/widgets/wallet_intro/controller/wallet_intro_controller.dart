import 'package:advertisers/features/wallet_module/Response/wallet_card_toggle_response.dart';
import 'package:advertisers/features/wallet_module/Response/wallet_intro_response.dart';
import 'package:advertisers/features/wallet_module/widgets/wallet_intro/add_account_request/add_account_request.dart' hide Info;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData , Response;
import 'dart:io';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

class WalletIntroController extends
GetxController with StateMixin<WalletIntroResponse> {
  final ApiService _apiService = Get.put(ApiService());
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  int month = -1;
  int year = -1;


  AccountType? paymentChannelName = AccountType(
    title: "",
    id: "-1"
  );

  void passToDropDown(AccountType value){
    paymentChannelName = value;
    update();
  }

  bool addNewAccount = false;

  void switchAddAccount(){
    if(addNewAccount == false){
      addNewAccount = true;
    }else{
      addNewAccount = false;
    }
    update();
  }

  String accountId = "0";

  void passAccountId(newIndex){
    accountId = newIndex;
    update();
  }

  int tabId = 0;


  void passIndex(newIndex){
    tabId = newIndex;
    update();
  }
// List<int> paymentIdList = [];
  CardData? paymentCard = CardData(
    id: -1,
    type: "",
    status: false,
    info: Info(
      cardNumberFour: "",
      cardUsername: "",
      cvv: "",
      expirationMonth: "",
      expirationYear: ""
    )
  );
  // int? paymentId;
  void passPaymentIndex({CardData? cardData}){
    // if(!paymentIdList.contains(id)){
    //   paymentIdList.add(id);
    // }else{
    //   paymentIdList.remove(id);
    // }
    paymentCard = cardData;
    update();
  }
  // passIndex(newIndex) => tabId = newIndex;


  void resetWalletIntro({bool? withUpdate}){

     paymentChannelName = AccountType(
        title: "",
        id: "-1"
    );
    cardNumberController.clear();
    nameController.clear();
    cvvController.clear();
    mobileController.clear();
    month = -1;
    year = -1;
     paymentCard = CardData(
        id: -1,
        type: "",
        status: false,
        info: Info(
            cardNumberFour: "",
            cardUsername: "",
            cvv: "",
            expirationMonth: "",
            expirationYear: ""
        )
    );
     if(withUpdate == true){
update();
     }
  }

  @override
  void onInit() {
    super.onInit();
    resetWalletIntro();
    checkMonth();
    getCardsData();
  }

  void getCardsData() async {
    try {
      final dio.Response response = await _apiService.dioClient.get(
        'https://advertiser.cefour.com/api/v1/billing_cards',
      );
      final data = WalletIntroResponse.fromJson(response.data);

      change(data, status: RxStatus.success());
      resetWalletIntro();
      if(paymentCard!.id != -1){
        data.cardData?.forEach((cardDataElement) {
          if(cardDataElement.id == paymentCard!.id){
            paymentCard = cardDataElement;
          }
        });
      }

      Logger().i(response.data);

    } on dio.DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // Error occurred while fetching data
        change(null,
            status: RxStatus.error('حدث خطأ ما ${error.response?.statusCode}'));
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


  void toggleCardsData({int? id}) async {
    try {
      final dio.Response response = await _apiService.dioClient.get(
        'https://advertiser.cefour.com/api/v1/billing_cards/$id/status',
      );
      final data = WalletToggleCardsDataResponse.fromJson(response.data);
      Get.snackbar(
        "${data.message}",
        '',
        snackPosition: SnackPosition.BOTTOM,);
      getCardsData();
      // change(data, status: RxStatus.success());
      Logger().i(response.data);
    } on dio.DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // Error occurred while fetching data
        Get.snackbar(
          "خطأ",
          'حدث خطأ ما',
          snackPosition: SnackPosition.BOTTOM,);
        // change(null,
        //     status: RxStatus.error('حدث خطأ ما ${error.response?.statusCode}'));
      } else if (error.error is SocketException) {
        Get.snackbar(
          "خطأ",
          'لا يوجد اتصال بالانترنت ',
          snackPosition: SnackPosition.BOTTOM,);

      } else {

        String errorDescription = 'حدث خطأ ما حاول في وقت لاحق';
        Get.snackbar(
          "خطأ",
          '$errorDescription ',
          snackPosition: SnackPosition.BOTTOM,);
      }
    }
  }


  void deleteCardsData({int? id}) async {
    try {
      final dio.Response response = await _apiService.dioClient.delete(
        'https://advertiser.cefour.com/api/v1/billing_cards/$id/delete',
      );
      final data = WalletToggleCardsDataResponse.fromJson(response.data);
      Get.snackbar(
        "${data.message}",
        '',
        snackPosition: SnackPosition.BOTTOM,);
      getCardsData();
      // change(data, status: RxStatus.success());
      Logger().i(response.data);
    } on dio.DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // Error occurred while fetching data
        Get.snackbar(
          "خطأ",
          'حدث خطأ ما',
          snackPosition: SnackPosition.BOTTOM,);
        // change(null,
        //     status: RxStatus.error('حدث خطأ ما ${error.response?.statusCode}'));
      } else if (error.error is SocketException) {
        Get.snackbar(
          "خطأ",
          'لا يوجد اتصال بالانترنت ',
          snackPosition: SnackPosition.BOTTOM,);

      } else {

        String errorDescription = 'حدث خطأ ما حاول في وقت لاحق';
        Get.snackbar(
          "خطأ",
          '$errorDescription ',
          snackPosition: SnackPosition.BOTTOM,);
      }
    }
  }



  Future<WalletIntroResponse> addAccountService(
      {AddAccountRequest? request,}) async {
    FormData formData = FormData.fromMap(request!.toJson());
    print("XXXX formData.fields XXXXX=>${formData.fields}");
    try {
      final Response response = await _apiService.dioClient.post(
        'https://advertiser.cefour.com/api/v1/billing_cards/create',
        data: formData,
      );

      var data =  WalletIntroResponse.fromJson(response.data);


      Get.snackbar(
        "${data.message}",
        "",
        snackPosition: SnackPosition.BOTTOM,);
      resetWalletIntro();
      getCardsData();
      return data;

    }  on DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        Get.snackbar(
          'حدث خطأ ما ${error.response?.statusCode}',
          "",
          snackPosition: SnackPosition.BOTTOM,);
        return WalletIntroResponse.fromJsonError(
            json: error.response?.data, error: error);
      } else if (error.error is SocketException) {
        print('xXx xc ${error.error}');
        Get.snackbar(
          'لا يوجد اتصال بالانترنت ${error.response?.statusCode}',
          "",
          snackPosition: SnackPosition.BOTTOM,);
        return WalletIntroResponse.makeError(
            error: error, errorMsg:  'لا يوجد إتصال بالشبكة');
      } else {
        Get.snackbar(
          'حدث خطأ ما حاول مرة أخرى لاحقا${error.response?.statusCode}',
          "",
          snackPosition: SnackPosition.BOTTOM,);
        print('xXx xc ${error.error}');
        String errorDescription = 'حدث خطأ ما حاول مرة أخرى لاحقاً';
        return WalletIntroResponse.makeError(
            error: error, errorMsg: errorDescription);
      }
    }

  }


  @override
  void onClose() {
    super.onClose();
  }
}

class AccountType{
  String? title,id;
  AccountType({this.id,this.title});
}



List <AccountType> accountType = [
  AccountType(
      id: "0",
      title: "مصارف وبنوك"
  ),
  AccountType(
      id: "1",
      title: "حسابات رقمية"
  ),
];



List <AccountType> accounts = [
  AccountType(
      id: "stc",
      title: "اس تي سي"
  ),
  AccountType(
      id: "bian",
      title: "بيان"
  ),
];


DateTime now = new DateTime.now();


List<int> month = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12

];

void checkMonth(){

  month.forEach((month) {
    if(month >= now.month){
      if(!months.contains(month)){
        months.add(month);
      }
    }
  });

}


List<int> months = [];
List<int> years = [
  now.year,
  now.year + 1,
  now.year + 2,
  now.year + 3,
  now.year + 4,
  now.year + 5,
  now.year + 6,
  now.year + 7,

];



final List<AccountType> banks = [
  AccountType(
      id: "visa",
      title: "فيزا"
  ),
  AccountType(
      id: "mastercard",
      title: "ماستر كارد"
  ),
  AccountType(
      id: "mada",
      title: "مدي"
  ),
];
