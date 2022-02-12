import 'package:advertisers/app_core/network/models/TaxSettingsModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/TaxSettingsResponse.dart';
import 'package:advertisers/features/advertiser_details/sheets/urls_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class AdvertiserInvoiceInputsController extends GetxController{
// String? dialogTitle;

int paymentTypeRadioCheck = 0;

void selectPaymentTypeRadioCheck({int? paymentTypeId}){
  paymentTypeRadioCheck = paymentTypeId!;
  update();
}

List<InvoiceItemType> coastList = [];
List<InvoiceItemType> discountList = [];
List<InvoiceItemType> stableList = [];

List<double?> sumValues =[];
List<double?> sumTotalValues =[];
var sum ;
var sumTotal;

  late TextEditingController name;
  late TextEditingController value;

void setStateBehavior(){
  update();
}


  String selectedAdvertisingType = '';


  void selectType(String? item){
    selectedAdvertisingType = "$item";
    update();
  }

  DialogStrings dialogStrings = DialogStrings();


  void removeFromCoastsList(InvoiceItemType invoiceItem){
    coastList.remove(invoiceItem);
    sumValues.remove(num.tryParse("${invoiceItem.value}")?.toDouble());
    sumTotalValues.remove(num.tryParse("${invoiceItem.value}")?.toDouble());
    print("sumValues = > ${sumValues}");
    if(sumValues.isNotEmpty){
      sum = sumValues.reduce((a, b) => a! + b!);
    }else{
      sum = 0 ;
    }

    print("sumTotalValues = > ${sumTotalValues}");
    if(sumTotalValues.isNotEmpty){
      sumTotal = sumTotalValues.reduce((a, b) => a! + b!);
    }else{
      sumTotal = 0 ;
    }
    update();
  }

  void removeFromDiscountList(InvoiceItemType invoiceItem){
    discountList.remove(invoiceItem);
    sumValues.remove(num.tryParse("-${invoiceItem.value}")?.toDouble());
    // sumValues.remove();
    print("sumValues = > ${sumValues}");
    if(sumValues.isNotEmpty){
      sum = sumValues.reduce((a, b) => a! + b!);
    }else{
      sum = 0 ;
    }

     // sumTotal = [1, 2, 3].reduce((a, b) => a + b);
    update();
  }

  void onDialogOkButtonClick({bool? isCost}){
    if(name.text.isNotEmpty && value.text.isNotEmpty){
      if(isCost == true){
        coastList.add(InvoiceItemType(
          id: coastList.length + 1,
          title: name.text,
          value:  num.tryParse("${value.text}")?.toDouble(),
          // value: double.parse(value.text),
        ));
        sumValues.add(num.tryParse("${value.text}")?.toDouble());
        sumTotalValues.add(num.tryParse("${value.text}")?.toDouble());


        sum = sumValues.reduce((a, b) => a! + b!);
        sumTotal = sumTotalValues.reduce((a, b) => a! + b!);
      }else{

        discountList.add(InvoiceItemType(
          id: discountList.length + 1,
          title: name.text,
          value: num.tryParse("${value.text}")?.toDouble(),
        ));
        sumValues.add(num.tryParse("-${value.text}")?.toDouble());
        sum = sumValues.reduce((a, b) => a! + b!);
        // sumTotal = sumTotalValues.reduce((a, b) => a! + b!);
      }
      name.clear();
      value.clear();
    }
update();

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
    value.clear();

  }



  @override
  void onInit() {
    name = TextEditingController();
    value = TextEditingController();
    super.onInit();
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
  String? title,percentage;
  double? value;
  InvoiceItemType({this.id,this.title,this.value,this.percentage});
}

class PaymentType {
  int? id;
  String? title;
  PaymentType({this.id,this.title});
}

