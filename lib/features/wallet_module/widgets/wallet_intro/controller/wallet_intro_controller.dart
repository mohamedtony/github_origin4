import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class WalletIntroController extends GetxController{

  int month = -1;
  int year = -1;


  AccountType? paymentChannelName = AccountType(
    title: "",
    id: -1
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

  int accountId = 0;

  void passAccountId(newIndex){
    accountId = newIndex;
    update();
  }

  int tabId = 0;


  void passIndex(newIndex){
    tabId = newIndex;
    update();
  }
List<int> paymentIdList = [];
  void passPaymentIndex(id){
    if(!paymentIdList.contains(id)){
      paymentIdList.add(id);
    }else{
      paymentIdList.remove(id);
    }
    update();
  }
  // passIndex(newIndex) => tabId = newIndex;

  @override
  void onClose() {
    super.onClose();
  }
}

class AccountType{
  int? id;
  String? title;
  AccountType({this.id,this.title});
}






List <AccountType> accountType = [
  AccountType(
      id: 0,
      title: "مصارف وبنوك"
  ),
  AccountType(
      id: 1,
      title: "حسابات رقمية"
  ),
];




List<int> months = [
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
List<int> years = [
  2021,
  2022,
  2023,
  2024,
  2025,
  2026,
  2027,

];



final List<AccountType> percentages = [
  AccountType(
    id: 0,
    title: "1",
  ),
  AccountType(
    id: 1,
    title: "2",
  ),
  AccountType(
    id: 2,
    title: "3",
  ),
];
