import 'dart:io';
import 'package:advertisers/app_core/network/models/TaxSettingsModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/TaxSettingsResponse.dart';
import 'package:advertisers/app_core/network/responses/advertising_requests_response.dart';
import 'package:advertisers/features/advertiser_details/sheets/urls_bottom_sheet.dart';
import 'package:advertisers/features/advertiser_invoice_input/advertiser_invoice_inputs_request.dart';
import 'package:advertisers/features/advertiser_invoice_input/advertiser_invoice_inputs_response.dart';
import 'package:advertisers/features/advertising_requests/controller/advertising_requests_controller.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide FormData , Response;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:logger/logger.dart';



class AdvertiserInvoiceInputsController extends GetxController with StateMixin<AdvertiserInvoiceInputsResponse> {
// String? dialogTitle;

  AdvertisingRequestsController _advertisingRequestsController=Get.put(AdvertisingRequestsController());

// bool? isRepricing = false;

  int? requestId;
  var endAdvertisingDate = ''.obs;
  void addendAdvertisingDate(String? endDate){
    endAdvertisingDate.value = endDate!;
    update();
  }

  List<Types>? types;

  dynamic argumentData = Get.arguments;

  // var couponDiscountPercentageEarned;
  var PlatformCommissionRate ;
  var addedTaxPercentageEarned ;


  List<InvoiceItemType> static = [];

  late String token;
  late Repository repo;

  final ApiService _apiService = Get.put(ApiService());

int paymentTypeRadioCheck = 0;

void selectPaymentTypeRadioCheck({int? paymentTypeId}){
  paymentTypeRadioCheck = paymentTypeId!;
  update();
}

List<InvoiceItemType> coastList = [];
List<InvoiceItemType> discountList = [];
List<InvoiceItemType> stableList = [];


  List<BillItems> billItemsCoastList = [];
  List<BillItems> billItemsDiscountList = [];


List<double?> sumValues =[];
List<double?> sumTotalValues =[];
var sum ;
var sumTotal;

  late TextEditingController name;
  late TextEditingController inputValue;

void setStateBehavior(){
  update();
}


  Types selectedAdvertisingType = Types(
    id: 0,
    name: ""
  );


  void selectType(Types? type){
    selectedAdvertisingType = type!;
    update();
  }



  DialogStrings dialogStrings = DialogStrings();


  void removeFromCoastsList(InvoiceItemType invoiceItem,int? id){
    coastList.remove(invoiceItem);
    sumValues.remove(num.tryParse("${invoiceItem.value}")?.toDouble());
    sumTotalValues.remove(num.tryParse("${invoiceItem.value}")?.toDouble());
    static.clear();

     // billItemsCoastList.remove(
     //     BillItems(
     //       text: invoiceItem.title,
     //       price: num.tryParse("${invoiceItem.value}")?.toDouble()
     //     )
     // );
    billItemsCoastList.removeAt(id!);

    static.add(InvoiceItemType(
        id: -1,
        title: "عمولة المنصة",
        percentage: PlatformCommissionRate??0,
        value: (PlatformCommissionRate??0 * sumTotal??0 )/ 100
    ));

    static.add(InvoiceItemType(
        id: -2,
        title: "ضريبة القيمة المضافة",
        percentage: addedTaxPercentageEarned??0,
        value: (addedTaxPercentageEarned??0 * sumTotal ??0)/ 100
    ));

    print("sumValues = > ${sumValues}");
    if(sumValues.isNotEmpty){
      sum = sumValues.reduce((a, b) => a! + b!)! + double.parse("${static[0].value}") + double.parse("${static[1].value}") ;
    }else{
      sum = 0 ;
    }

    print("sumTotalValues = > ${sumTotalValues}");
    if(sumTotalValues.isNotEmpty){
      sumTotal = sumTotalValues.reduce((a, b) => a! + b!)! + double.parse("${static[0].value}") + double.parse("${static[1].value}") ;
    }else{
      sumTotal = 0 ;
    }
    update();
  }

  void removeFromDiscountList(InvoiceItemType invoiceItem,int? id){
    discountList.remove(invoiceItem);
    sumValues.remove(num.tryParse("-${invoiceItem.value}")?.toDouble());

    billItemsDiscountList.removeAt(id!);
    print("sumValues = > ${sumValues}");

    static.clear();
    static.add(InvoiceItemType(
        id: -1,
        title: "عمولة المنصة",
        percentage: PlatformCommissionRate??0,
        value: (PlatformCommissionRate??0 * sumTotal??0 )/ 100
    ));

    static.add(InvoiceItemType(
        id: -2,
        title: "ضريبة القيمة المضافة",
        percentage: addedTaxPercentageEarned??0,
        value: (addedTaxPercentageEarned??0 * sumTotal ??0)/ 100
    ));

    if(sumValues.isNotEmpty){
      sum = sumValues.reduce((a, b) => a! + b!)! + double.parse("${static[0].value}") + double.parse("${static[1].value}") ;
    }else{
      sum = 0 ;
    }

     // sumTotal = [1, 2, 3].reduce((a, b) => a + b);
    update();
  }

  void onDialogOkButtonClick({bool? isCost}){
    if(name.text.isNotEmpty && inputValue.text.isNotEmpty){
      if(isCost == true){
        coastList.add(InvoiceItemType(
          id: coastList.length + 1,
          title: name.text,
          value:  num.tryParse("${inputValue.text}")?.toDouble(),
          // value: double.parse(value.text),
        ));
        sumValues.add(num.tryParse("${inputValue.text}")?.toDouble());
        sumTotalValues.add(num.tryParse("${inputValue.text}")?.toDouble());


        sum = sumValues.reduce((a, b) => a! + b!)! + double.parse("${static[0].value}") + double.parse("${static[1].value}") ;
        sumTotal = sumTotalValues.reduce((a, b) => a! + b!)! + double.parse("${static[0].value}") + double.parse("${static[1].value}") ;

        billItemsCoastList.add(
            BillItems(
                text: name.text,
                price:num.tryParse("${inputValue.text}")?.toDouble()
            )
        );

      }else{


        discountList.add(InvoiceItemType(
          id: discountList.length + 1,
          title: name.text,
          value: num.tryParse("${inputValue.text}")?.toDouble(),
        ));
        sumValues.add(num.tryParse("-${inputValue.text}")?.toDouble());
        sum = sumValues.reduce((a, b) => a! + b!)! + double.parse("${static[0].value}") + double.parse("${static[1].value}") ;
        // sumTotal = sumTotalValues.reduce((a, b) => a! + b!);

        billItemsDiscountList.add(
            BillItems(
                text: name.text,
                price:num.tryParse("${inputValue.text}")?.toDouble()
            )
        );
      }
      name.clear();
      inputValue.clear();
    }
update();

  }

  Future<AdvertiserInvoiceInputsResponse> addRequestBillPost(
      {AdvertiserInvoiceInputsRequest? request,int? requestId}) async {
    FormData formData = FormData.fromMap(request!.toJson());
    print("XXXX formData.fields XXXXX=>${formData.fields}");
    try {
      final Response response = await _apiService.dioClient.post(
        'https://advertiser.cefour.com/api/v1/requests/$requestId/bill',
        data: formData,
      );

     var data =  AdvertiserInvoiceInputsResponse.fromJson(response.data);

      Get.snackbar(
        "${data.message}",
        "",
        snackPosition: SnackPosition.BOTTOM,);
      return data;

    } on DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // change(null, status: RxStatus.error(
        //     'حدث خطأ ما ${error.response?.statusCode}'));
        Get.snackbar(
          'حدث خطأ ما ${error.response?.statusCode}',
          "",
          // icon: const Icon(Icons.person, color: Colors.red),
          // backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
        return AdvertiserInvoiceInputsResponse.fromJsonError(
            json: error.response?.data, error: error);
      } else if (error.error is SocketException) {
        print('xXx xc ${error.error}');

        // change(null,
            // status: RxStatus.error(
            //     'لا يوجد اتصال بالانترنت ${error.response?.statusCode}'));
        Get.snackbar(
          'لا يوجد اتصال بالانترنت ${error.response?.statusCode}',
          "",
          // icon: const Icon(Icons.person, color: Colors.red),
          // backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
        return AdvertiserInvoiceInputsResponse.makeError(
            error: error, errorMsg:  'لا يوجد إتصال بالشبكة');
      } else {
        // change(null,
        //     status: RxStatus.error(
        //         'لا يوجد اتصال بالانترنت ${error.response?.statusCode}'));
        Get.snackbar(
          'حدث خطأ ما حاول مرة أخرى لاحقا${error.response?.statusCode}',
          "",
          // icon: const Icon(Icons.person, color: Colors.red),
          // backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
        print('xXx xc ${error.error}');
        String errorDescription = 'حدث خطأ ما حاول مرة أخرى لاحقاً';
        return AdvertiserInvoiceInputsResponse.makeError(
            error: error, errorMsg: errorDescription);
      }
    }

  }



  Future<AdvertiserInvoiceInputsResponse> editRequestBillPut(
      {AdvertiserInvoiceInputsRequest? request,int? requestId}) async {
    FormData formData = FormData.fromMap(request!.toJson());
    print("XXXX formData.fields XXXXX=>${formData.fields}");
    try {
      final Response response = await _apiService.dioClient.post(
        'https://advertiser.cefour.com/api/v1/requests/$requestId/bill',
        data: formData,
      );

      var data =  AdvertiserInvoiceInputsResponse.fromJson(response.data);

      Get.snackbar(
        "${data.message}",
        "",
        snackPosition: SnackPosition.BOTTOM,);
      return data;

    } on DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // change(null, status: RxStatus.error(
        //     'حدث خطأ ما ${error.response?.statusCode}'));
        Get.snackbar(
          'حدث خطأ ما ${error.response?.statusCode}',
          "",
          // icon: const Icon(Icons.person, color: Colors.red),
          // backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
        return AdvertiserInvoiceInputsResponse.fromJsonError(
            json: error.response?.data, error: error);
      } else if (error.error is SocketException) {
        print('xXx xc ${error.error}');

        // change(null,
        // status: RxStatus.error(
        //     'لا يوجد اتصال بالانترنت ${error.response?.statusCode}'));
        Get.snackbar(
          'لا يوجد اتصال بالانترنت ${error.response?.statusCode}',
          "",
          // icon: const Icon(Icons.person, color: Colors.red),
          // backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
        return AdvertiserInvoiceInputsResponse.makeError(
            error: error, errorMsg:  'لا يوجد إتصال بالشبكة');
      } else {
        // change(null,
        //     status: RxStatus.error(
        //         'لا يوجد اتصال بالانترنت ${error.response?.statusCode}'));
        Get.snackbar(
          'حدث خطأ ما حاول مرة أخرى لاحقا${error.response?.statusCode}',
          "",
          // icon: const Icon(Icons.person, color: Colors.red),
          // backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
        print('xXx xc ${error.error}');
        String errorDescription = 'حدث خطأ ما حاول مرة أخرى لاحقاً';
        return AdvertiserInvoiceInputsResponse.makeError(
            error: error, errorMsg: errorDescription);
      }
    }

  }


  /// With Dio
  void fetchShowRequestBill({int? requestId}) async {

    if(_advertisingRequestsController.isRepricing == true){
      String url ='https://advertiser.cefour.com/api/v1/requests/$requestId/bill';
      try {
        final dio.Response response = await _apiService.dioClient.get(
          url,
        );

        final data = AdvertiserInvoiceInputsResponse.fromJson(response.data);
        selectType(Types(name: data.data!.adsType!.name,id: data.data!.adsType!.id));
        // if(discountList){}
        data.data!.discounts!.forEach((discount) {
          discountList.add(InvoiceItemType(
            id: discountList.length + 1,
            title: discount.text,
            value: num.tryParse("${discount.price}")?.toDouble(),
          ));
          sumValues.add(num.tryParse("-${discount.price}")?.toDouble());
          sum = sumValues.reduce((a, b) => a! + b!)! + double.parse("${static[0].value}") + double.parse("${static[1].value}") ;
          // sumTotal = sumTotalValues.reduce((a, b) => a! + b!);

          billItemsDiscountList.add(BillItems(
            text:discount.text,
            price: num.tryParse("${discount.price}")?.toDouble(),
          ));
        });

        data.data!.items!.forEach((coast) {
          coastList.add(InvoiceItemType(
            id: discountList.length + 1,
            title: coast.text,
            value: num.tryParse("${coast.price}")?.toDouble(),
          ));
          sumValues.add(num.tryParse("${coast.price}")?.toDouble());
          sum = sumValues.reduce((a, b) => a! + b!)! + double.parse("${static[0].value}") + double.parse("${static[1].value}") ;
          // sumTotal = sumTotalValues.reduce((a, b) => a! + b!);

          billItemsCoastList.add(BillItems(
            text: coast.text,
            price: num.tryParse("${coast.price}")?.toDouble(),
          ));
        });




        change(data, status: RxStatus.success());
        Logger().i(response!.data);
      } on dio.DioError catch (error) {
        if (error.response?.statusCode == 401 ||
            error.response?.statusCode == 422) {
          // Error occurred while fetching data
          change(null, status: RxStatus.error(
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
      update();
    }


  }




/// With Dio
void fetchBillInfo() async {
  String url ='https://advertiser.cefour.com/api/v1/requests_bill_form';
  print("XXXURLXXX+++> $url");
  try {

    final dio.Response response = await _apiService.dioClient.get(
      url,
    );

    final data = AdvertiserInvoiceInputsResponse.fromJson(response.data);

     PlatformCommissionRate = data.data!.commission;
     addedTaxPercentageEarned = data.data!.addedTax;
    types = data.data!.types!;
    static.add(InvoiceItemType(
        id: -1,
        title: "عمولة المنصة",
        percentage: PlatformCommissionRate??0,
        value: (PlatformCommissionRate??0 * sumTotal??0 )/ 100
    ));


    static.add(InvoiceItemType(
        id: -2,
        title: "ضريبة القيمة المضافة",
        percentage: addedTaxPercentageEarned??0,
        value: (addedTaxPercentageEarned??0 * sumTotal ??0)/ 100
    ));


    change(data, status: RxStatus.success());
    Logger().i(response!.data);
  } on dio.DioError catch (error) {
    if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 422) {
      // Error occurred while fetching data
      change(null, status: RxStatus.error(
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



void clickCostDiscount({bool? isCost}){
    if(isCost == true){
      dialogStrings = DialogStrings(
        dialogName: "إضافة عنصر تكلفة",
        title: "اكتب اسم التكلفة",
        value: "اكتب قيمة التكلفة",
      );

    }else{
      dialogStrings = DialogStrings(
        dialogName: "إضافة عنصر الخصم",
        title: "اكتب اسم الخصم",
        value: "اكتب قيمة الخصم",
      );

    }
    name.clear();
    inputValue.clear();

  }

Advertiser? user;

  @override
  void onInit() {
    types?.clear();
    selectType(Types(name: "",id: 0));
    // user = Get.arguments;
    name = TextEditingController();
    inputValue = TextEditingController();
    fetchBillInfo();
    // fetchShowRequestBill();
    fetchShowRequestBill();
    super.onInit();
  }

void reset(){
  // types?.clear();
  selectType(Types(name: "",id: 0));
  endAdvertisingDate = ''.obs;
  // static.clear();
  paymentTypeRadioCheck = 0;
  coastList.clear();
  discountList.clear();
  stableList.clear();
  sumValues.clear();
  sumTotalValues.clear();
   selectedAdvertisingType = Types(
      id: 0,
      name: ""
  );
  sum = 0;
  sumTotal = 0;
  billItemsCoastList.clear();
  billItemsDiscountList.clear();
}

  @override
  onReady(){
    super.onReady();

    // user = Get.arguments;

    // update();
  }

  String? validatePhone(String phone){
    if (phone.isEmpty){
    }
    return null;
  }
}




class DialogStrings{
  String? dialogName,title,value;
  DialogStrings({this.value,this.title,this.dialogName});
}

class InvoiceItemType {
  int? id;
  String? title;
  int? percentage;
  double? value;
  InvoiceItemType({this.id,this.title,this.value,this.percentage});
}

class PaymentType {
  int? id;
  String? title;
  PaymentType({this.id,this.title});
}

