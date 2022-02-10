import 'dart:io';

import 'package:advertisers/app_core/network/models/CoponModel.dart';
import 'package:advertisers/app_core/network/models/CreateSubscriptionModel.dart';
import 'package:advertisers/app_core/network/models/CreateSuscriptionWithReciet.dart';
import 'package:advertisers/app_core/network/requests/CreateSubscriptionRequest.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/controller/choose_baka_controller.dart';
import 'package:advertisers/app_core/network/models/SubscriptionDetail.dart';
import 'package:advertisers/features/users_module/view/cards/advantages_baka_card.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:advertisers/shared/loading_downloading_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
class BakaDetailsController extends GetxController{
  GlobalKey<FormState> pakaDetailsFormKey=GlobalKey<FormState>( );

  late TextEditingController pakaTimeController;
  late TextEditingController discountCodeController;
  final ChooseBakaController _chooseBakaController = Get.find();



  var phone='';
  var logoPath=''.obs;
  var imageBase641=''.obs;
  Rx<SubscriptionDetail> subscriptionBakaDetail=SubscriptionDetail().obs;
  Rx<CreateSubscriptionModel> createSubscriptionModel=CreateSubscriptionModel().obs;
  //Repository repo=Repository();
  RxList<String> items=<String>[].obs;
  var periodId=-1.obs;
  Rx<double> priceAfterDiscount =  (-0.1).obs;
  int coponId =-1;
  var paymentMethod = ''.obs;
  //final paymentIndex=-1.obs;
  final paymentIndex = Rxn<int>(-1);
  String? pdfReciept;

  //for downloading
  String? fileFullPath;
  String? urlPdf;
  bool _allowWriteFile=false;
  var progress = ' 0 '.obs;
  var isLoading = true.obs;
  RegisterClientUserResponse? registerClientUserResponse;
  String? myToken;
  @override
   void onInit() async {
    //repo.postWithImageMultipart({})

    pakaTimeController=TextEditingController();
    discountCodeController=TextEditingController();
/*    var json  = await storage.read("data");
    registerClientUserResponse = RegisterClientUserResponse.fromJson(json);

    if(registerClientUserResponse?.data?.token!=null){
      print("mToken"+registerClientUserResponse!.data!.token!);

    }*/
     myToken  = await storage.read("token");
     print("Token= $myToken");
    client!.createSubscriptions(CreateSubscriptionRequest(execute: 0,payment_method: "STC",period_id: _chooseBakaController.selectedBakaId), "Bearer "+myToken!).then((value) {
      if(value.data!=null&&value.status==200){
        //subscriptionBakaDetail = value.data!;
        //print("mTotal: "+value.data!.total!.toString());
        // if(value.data.total!=null){
        priceAfterDiscount.value = (CreateSubscriptionModel.fromJson(value.data)).total!;
        createSubscriptionModel.value= (CreateSubscriptionModel.fromJson(value.data));
        isLoading.value = false;
        //update();
        //}
      }
      if(value.message!=null&&value.message!.isNotEmpty) {
        Fluttertoast.showToast(
          msg: value.message ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.6),
          textColor: Colors.white,
          fontSize: 14.0,
        );
      }

    });
    client!.getSubscriptionDetails(_chooseBakaController.selectedBakaId).then((value){
      if(value.data!=null&&value.status==200){
        //subscriptionBaka.value = value.data!;
        //print("BakaDetails"+ value.data!.settings![0].name!);
        subscriptionBakaDetail.value = value.data! ;
        subscriptionBakaDetail.value.settings?.forEach((element) {
          if(element!=null && element.name!=null) {
            //print("ininininininini");
           // print(element.name);
            items.value.add(element.name!);
          }
        });
      ///  update();
        buildItems(items);
      }
    });
    super.onInit();
  }
  String? validateDropDown(String timeStr){
    if (timeStr.length<3){
      return 'يجب اختيار مدة الاشتراك';
    }
    return null;
  }

  var blocOfWidgets=[].obs;
  RxList<Widget> itemsAsWidgets=<Widget>[].obs;
  // List<List<String>> blocOfWidgetst=[];
  // List<String> itemsAsWidgetst=[];

  RxList buildItems(List<String> items){

    // List<List<Widget>> blocOfWidgets=[];
    // List<Widget> itemsAsWidgets=[];

    int counter=0,iterate=(items.length/9).floor();
    for(String text in items){
      print(text);
      itemsAsWidgets.add(AdvantagesBakaCard(//key: UniqueKey(),
        text: text,
      ),);
      print(itemsAsWidgets.length%9);
      if(itemsAsWidgets.length%9==0){

        print(itemsAsWidgets.length);
        blocOfWidgets.add(itemsAsWidgets.toList());
        counter++;
        itemsAsWidgets.clear();
      }else if(blocOfWidgets.isNotEmpty&&itemsAsWidgets.isNotEmpty&&counter>0&&itemsAsWidgets.length<9&&items.length>9&&counter<iterate){

        blocOfWidgets.add(itemsAsWidgets.toList());
        print(itemsAsWidgets.length);
        counter++;
      }else if(blocOfWidgets.isNotEmpty&&itemsAsWidgets.isNotEmpty&&counter==0&&itemsAsWidgets.length<9&&items.length<9){
        blocOfWidgets.add(itemsAsWidgets.toList());
        // return [];
        print(itemsAsWidgets.length);
        //counter++;
      }
      else if(itemsAsWidgets.length==items.length&& counter==0){
        blocOfWidgets.add(itemsAsWidgets.toList());
      }
    }
    print('>>>>>>>>>>>>>>>>>>>>>>>>> ${20%9}');
    return blocOfWidgets;

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

    pakaTimeController.dispose();
   // _chooseBakaController.changeBakaID(-1);
    super.onClose();
  }

  // void changePeriod(int id) {
  //   periodId = id;
  //   client!.createSubscriptions(CreateSubscriptionRequest(execute: 0,payment_method: "STC",period_id: id), "Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value) {
  //     if(value.data!=null&&value.status==200){
  //       //subscriptionBakaDetail = value.data!;
  //       print("mTotal: "+value.data!.total!.toString());
  //      // if(value.data.total!=null){
  //         priceAfterDiscount.value =value.data!.total!  ;
  //         ///update();
  //       //}
  //     }
  //   });
/*    if(subscriptionBakaDetail.periods!=null) {
      PeriodModel periodModel = subscriptionBakaDetail.periods!.firstWhere((element) => element.id == id);
      if(periodModel!=null){
        priceAfterDiscount = periodModel.price_after_discount!;
        update();
      }
    }*/

  void changePeriod(int id) {
    periodId = id;
    client!.createSubscriptions(CreateSubscriptionRequest(execute: 0,payment_method: "STC",period_id: id),"Bearer "+myToken!).then((value) {
      if(value.data!=null&&value.status==200){
        priceAfterDiscount.value = (CreateSubscriptionModel.fromJson(value.data)).total!;
        createSubscriptionModel.value = CreateSubscriptionModel.fromJson(value.data);
        Logger().i(value.data);
        //update();
        //  Get.toNamed('/payVerification');
      }
    });
/*    if(subscriptionBakaDetail.periods!=null) {
      PeriodModel periodModel = subscriptionBakaDetail.periods!.firstWhere((element) => element.id == id);
      if(periodModel!=null){
        priceAfterDiscount = periodModel.price_after_discount!;
        update();
      }
    }*/
  }

  void payNow(BuildContext context) {
    //periodId = id;
    Logger().i(CreateSubscriptionRequest(execute: 1,payment_method: paymentMethod.value,period_id: periodId,copon_id: coponId==-1?null:coponId).toJson());
    Logger().i("Bearer $myToken");

    client!.createSubscriptions(CreateSubscriptionRequest(execute: 1,payment_method: paymentMethod.value,period_id: periodId,copon_id: coponId==-1?null:coponId), "Bearer "+myToken!).then((value) {
      print("mMessage"+value.message!);
      if(value.status==200){
        // String msg = value.message.toString();
        pdfReciept = CreateSuscriptionWithReciet.fromJson(value.data!).pdf;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:  Text('لقد تم تسجيلك بنجاح !',style: TextStyle(color: AppColors.whiteColor,fontSize: 17,fontFamily: 'Arabic-Regular'),),
        ));
        Navigator.of(context).pop();
        Get.toNamed('/successfulPayingPage');
      }else if(value.status==400) {
        if (value.message != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message!, style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 17,
                fontFamily: 'Arabic-Regular'),),
          ));
        }
        Navigator.of(context).pop();
        Get.offAllNamed('/Home');
      }
    });
/*    if(subscriptionBakaDetail.periods!=null) {
      PeriodModel periodModel = subscriptionBakaDetail.periods!.firstWhere((element) => element.id == id);
      if(periodModel!=null){
        priceAfterDiscount = periodModel.price_after_discount!;
        update();
      }
    }*/
  }

  void changePayMethod(String payMethod, int index) {
    paymentMethod.value = payMethod;
    // someNumber.value
    paymentIndex.value = index;

  }

  void checkCopon(context) {
    LoadingDailog().showLoading(context);
    print("controller= "+discountCodeController.text);
    client!.checkCopon(discountCodeController.text!=null && discountCodeController.text.isNotEmpty && discountCodeController.text!="" ? discountCodeController.text:"123123", periodId,"Bearer "+myToken!).then((value) {
      print("mMessage"+value.message!);
      if(value.status==200&&value.data!=null){
        // String msg = value.message.toString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:  Text('تم تطبيق كوبون الخصم بنجاح !',style: TextStyle(color: AppColors.whiteColor,fontSize: 17,fontFamily: 'Arabic-Regular'),),
        ));
        Navigator.of(context).pop();
        //Get.toNamed('/successfulPayingPage');
        priceAfterDiscount.value = (CoponModel.fromJson(value.data)).total!;
        coponId = (CoponModel.fromJson(value.data)).copon_id!;
        //update();
      }else{
        Navigator.of(context).pop();
      }
    });
  }

  downloadPDf(String url,BuildContext context){
    print('here');
    getDirectoryPath().then((path) async {
      String extension=url.substring(url.lastIndexOf("/"));
      File file=File(path+"$extension");
      if(file.existsSync())
      {
        if(file!=null){
          print('here');
          await OpenFile.open(file.path);
        }
        Get.offAllNamed('/Home');
        return;
      }

      await downloadFile(url,"$path/$extension",file,context);

    });
  }

  Future downloadFile(String url,path,File file,BuildContext context) async {
    if(!_allowWriteFile)
    {
      await requestWritePermission();
    }
    try{
      LoadingDownloadingDailog().showLoading(context);
      final response = await dio?.get(url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0
          )
          ,onReceiveProgress: (rec,total){

            progress.value=" % "+((rec/total)*100).toStringAsFixed(0);
            print(progress.value);
          });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:  Text('تم حفظ الفاتورة بنجاح !',style: TextStyle(color: AppColors.whiteColor,fontSize: 17,fontFamily: 'Arabic-Regular'),),
      ));
      Navigator.of(context).pop();
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response?.data);
      await raf.close();

      if(file!=null){
        await OpenFile.open(file.path);
      }
      Get.offAllNamed('/Home');
    }catch( e)
    {
      Navigator.of(context).pop();
      print(e.toString());
    }
  }

  Future<String>getDirectoryPath() async {
    String? externalStorageDirPath ;
    if (Platform.isAndroid) {
       /*final directory = await getApplicationDocumentsDirectory();
       externalStorageDirPath = directory.path;*/
      externalStorageDirPath = '/storage/emulated/0/Download';
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }


    //Directory? appDocDirectory = await path_provider.getExternalStorageDirectory();
    Directory directory= await new Directory(externalStorageDirPath!);
    // Directory directory= await new Directory(externalStorageDirPath +'/'+'dir').create(recursive: true);

    return directory.path;
  }

  Future<void> requestWritePermission() async {

    if (await Permission.storage.request().isGranted) {
      // setState(() {
      _allowWriteFile = true;

      // });
    }else
    {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }

  }
  }

  // void changePayMethod(String payMethod, int index) {
  //   paymentMethod.value = payMethod;
  //  // someNumber.value
  //   paymentIndex.value = index;
  //
  // }
//}