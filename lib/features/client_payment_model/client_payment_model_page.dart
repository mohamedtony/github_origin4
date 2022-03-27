import 'dart:convert';
import 'dart:io';
import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_generic_field.dart';
import 'package:dio/dio.dart' as dio;
import 'package:advertisers/features/client_payment_model/ClientModelColor.dart';
import 'package:advertisers/features/client_payment_model/controller/client_payment_model_controller.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertiser_field_with_icon.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_dropdown.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ClientPaymentModelPage extends StatelessWidget {
   ClientPaymentModelPage({Key? key}) : super(key: key);
   ClientPaymentModelController clientPaymentModelController=Get.find();
List<String>_status=["مصارف وبنوك","حسابات رقمية"];
   String _verticalGroupValue = "حسابات رقمية";
  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd HH:mm");
    return  Scaffold(
        body: SafeArea(
          child: Container(
            height: 812.0.h,
            width: 375.0.w,
            decoration: BoxDecoration(
              color: AppColors.verifyFayrouzyFirst,
              gradient: LinearGradient(
                  colors: [
                    AppColors.verifyFayrouzyFirst.withOpacity(.99),
                    AppColors.verifyBlueSecond.withOpacity(.99),
                    AppColors.verifyGreenThird
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [-.7, 20.5, .5]),
            ),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                            width: 136.w,
                              height: 35.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ClientModelColor.boxGradientColor,
                                borderRadius: BorderRadius.circular(7),

                                                  ),
                              child: Text("نموذج العميل" ,textAlign:TextAlign.center,style:TextStyle(fontSize: 15.sp,fontFamily: "AbrilFatface-Regular",color:ClientModelColor.whiteColor )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 70.w,),

                       Align(
                        alignment:Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top:15.0,left: 20),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: SvgPicture.asset('images/arrow_back.svg',
                              // matchTextDirection: true,
                              height: 50, fit: BoxFit.fitHeight,color: Colors.white,),
                          ),
                        ),
                      ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right:6.0,bottom:6,left:6),
                  child: Container(
                    width: 375.w,
                    height: 120.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ClientModelColor.firstBackgroundColor,
                      borderRadius: BorderRadius.circular(7),
border: Border.all(color:ClientModelColor.firstBorderColor),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 18),
                          child: Row(
                            children: [
                              Text("التاجر                   :  " ,textAlign:TextAlign.right,style:TextStyle(fontSize: 16.sp,fontFamily: "AbrilFatface-Regular",color: ClientModelColor.depthBlueFont)),
                              Text(Get.parameters["advertiser"].toString(),style:TextStyle(fontSize: 16.sp,fontFamily: "AbrilFatface-Regular",color: ClientModelColor.depthBlueFont))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 18),
                          child: Row(
                            children: [
                              Text("رقم الطلب           :  " ,textAlign:TextAlign.right,style:TextStyle(fontSize: 16.sp,fontFamily: "AbrilFatface-Regular",color: ClientModelColor.greyFont)),
                              Text("${Get.parameters["requestId"].toString()}  #",style:TextStyle(fontSize: 16.sp,fontFamily: "AbrilFatface-Regular",color: ClientModelColor.depthBlueFont))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 18),
                          child: Row(
                            children: [
                              Text("قيمة الطلب         :" ,textAlign:TextAlign.right,style:TextStyle(fontSize: 16.sp,fontFamily: "AbrilFatface-Regular",color: ClientModelColor.greyFont)),
                              Text("   ${Get.parameters["total"].toString()}",style:TextStyle(fontSize: 16.sp,fontFamily: "AbrilFatface-Regular",color: ClientModelColor.depthBlueFont)),
                              Text("      ر.س",style:TextStyle(fontSize: 16.sp,fontFamily: "AbrilFatface-Regular",color: ClientModelColor.likeRedFont)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:6.0,bottom:6,left:6),
                  child: Container(
                    width: 375.w,
                    height: 575.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ClientModelColor.firstBackgroundColor,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color:ClientModelColor.firstBorderColor),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 5,),
                        Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            width: 236.w,
                            height: 35.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ClientModelColor.mediumBlueColor,
                              borderRadius: BorderRadius.circular(7),

                            ),
                            child: Text("تحويل بنكي مباشر للمعلن" ,textAlign:TextAlign.center,style:TextStyle(fontSize: 15.sp,fontFamily: "AbrilFatface-Regular",color:ClientModelColor.whiteColor )),
                          ),
                        ),
                      const  SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start :18.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("قناة الدفع" ,textAlign:TextAlign.center,style:TextStyle(fontSize: 19.sp,fontFamily: "AbrilFatface-Regular",color:ClientModelColor.greyFont )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RadioGroup<String>.builder(
                            groupValue: _verticalGroupValue,
                            onChanged: (value) => //setState(() {
                              _verticalGroupValue = value??' ',
                            //}),
                            items: _status,direction: Axis.horizontal,

                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                              textPosition: RadioButtonTextPosition.right,
                            ),
                          ),
                        ),

                      Padding(
                        padding: const EdgeInsetsDirectional.only(start:18.0,end:18),
                        child: Row(
                          children: [
                            Text("اسم قناة الدفع" ,textAlign:TextAlign.center,style:TextStyle(fontSize: 16.sp,fontFamily: "AbrilFatface-Regular",color:ClientModelColor.greyFont )),
                           const SizedBox(width: 25,),
                            AdvertisersDropDown(items: [],hintText: "stc pya",width: 214.63.w,borderColor: ClientModelColor.borderDropdownColor,areas: [Area()],),
                          ],
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Text("تاريخ التحويل" ,textAlign:TextAlign.center,style:TextStyle(fontSize: 16.sp,fontFamily: "AbrilFatface-Regular",color:ClientModelColor.greyFont )),
                              const SizedBox(width: 25,),
                              SizedBox(
                                width:214.37.w,
                                child: DateTimeField(
                                  format: format,initialValue: DateTime.now(),
                                  decoration: InputDecoration(
                                contentPadding:  EdgeInsets.symmetric(vertical: 5.0.h,horizontal: 10.w),
                                suffixIcon:Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset('images/dateTime.svg',height: 30,width: 30,fit:BoxFit.fitHeight,),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color:AppColors.borderfayrozy)
                                ),
                                filled: true,
                                disabledBorder:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color:AppColors.borderfayrozy)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color: AppColors.borderfayrozy)
                                ),
                                focusColor: AppColors.borderfayrozy,
                                fillColor:AppColors.whiteColor,
                                hintStyle:TextStyle(color: AppColors.greyColor,fontSize: 15.sp),
                               // hintText: ,
                              ),
                                  controller: clientPaymentModelController.dateController,
                                  onShowPicker: (context, currentValue) async {
                                    final date = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate: currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2100));
                                    if (date != null) {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime:
                                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                      );
                                      return date;
                                    } else {
                                      return currentValue;
                                    }
                                  },
                                ),
                              ),
                    // DateTimePicker(
                    //   initialValue: '',
                    //   firstDate: DateTime(2000),
                    //   lastDate: DateTime(2100),
                    //   dateLabelText: 'Date',
                    //   onChanged: (val) => print(val),
                    //   validator: (val) {
                    //     print(val);
                    //     return null;
                    //   },
                    //   onSaved: (val) => print(val),
                    // );
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:18.0,right:18),
                          child: Row(
                            children: [
                              Text("صورة التحويل" ,textAlign:TextAlign.center,style:TextStyle(fontSize: 16.sp,fontFamily: "AbrilFatface-Regular",color:ClientModelColor.greyFont )),
                              const SizedBox(width: 25,),
                             InkWell(
                               onTap: ()async{
                                 await showChoiceImageDialog(context);
                               },
                               child: AdvertisersFieldWithIcon(fillColor:Color(0xffF5F5F5),enabled:false,textAlignment: TextAlign.center, obscureText: false, hintText: "إضافة الصورة",hintColor:const Color(0xff041D67),suffix: Padding(
                                 padding: const EdgeInsets.all(2.0),
                                 child: Container(width:60,
                                  alignment: Alignment.center,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     gradient: LinearGradient(colors: [Color(0xff427AD0),Color(0xff48DBE1)],begin: Alignment.bottomCenter,end: Alignment.topCenter,)
                                   ),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                     Icon(Icons.add_circle_outline,color: Colors.white,),
                                     Icon(Icons.attach_file_outlined,color: Colors.white,)
                                   ],),
                                     ),
                               ),width:214.37.w,),
                             )
                                ],
                          ),
                        ),
SizedBox(
  height: 100.h,
  child: Padding(
    padding: const EdgeInsets.only(left:18.0,right:18,top:6),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Padding(
            padding: const EdgeInsets.only(top:58.0),
            child: Container(width:115,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [Color(0xff427AD0),Color(0xff48DBE1)],begin: Alignment.bottomCenter,end: Alignment.topCenter,)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline,color: Colors.white,),
                 Text("إضافة ملحوظة",style:TextStyle(fontSize: 16.sp,fontFamily: "AbrilFatface-Regular",color:ClientModelColor.whiteColor ))
                ],),
            ),
          ),
          Obx(()=>Container(
            alignment: Alignment.bottomCenter,
            height: 110.h,
            child: Stack(
              fit:StackFit.loose,
              alignment: Alignment.topLeft,
              children: [
               Container(
                  margin: EdgeInsets.only(top: 6),
                  height: 88.w,
                  width: 88.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image:DecorationImage(image: FileImage(File(clientPaymentModelController.savedFile.value.path??' '),),fit: BoxFit.cover),),
                ),
                InkWell(
                  onTap: (){
                    clientPaymentModelController.savedFile.value=File(' ');
                  },
                  child: clientPaymentModelController.savedFile.value.path!=' '?CircleAvatar(child: CircleAvatar(child: Icon(Icons.close,size: 15,color: Colors.deepOrangeAccent,),backgroundColor: Colors.white,radius: 9,),
                    backgroundColor: Colors.deepOrangeAccent,radius: 11,):SizedBox(),
                )
              ],
            ),
          ),),
        ],
    ),
  ),

),
                        SizedBox(height: 5,),
                        AdvertisersGenericField(textAlignment: TextAlign.center, obscureText: false, controller: clientPaymentModelController.noteController, hintText: ' '),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left:18.0,right:18,bottom:8),
                          child: Row(
                            children: [
                              Text("حالة الطلب" ,textAlign:TextAlign.center,style:TextStyle(fontSize: 16.sp,fontFamily: "AbrilFatface-Regular",color:ClientModelColor.greyFont )),
                              const SizedBox(width: 45,),
                              InkWell(
                                onTap: ()async{
                                  await showChoiceImageDialog(context);
                                },
                                child: AdvertisersGenericField(fillColor:Color(0xffF5F5F5),enabled:false,textAlignment: TextAlign.center, obscureText: false, hintText: "بانتظار التحويل",hintColor:const Color(0xff041D67),

                                  width:214.37.w, controller: TextEditingController(),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     AdvertisersButton(text: 'ارسال التحويل',width:136.w , onPressed: ()async{
                       ClientPaymentModelController.photo =
                           await dio.MultipartFile.fromFile(clientPaymentModelController.savedFile.value.path,
                           filename: clientPaymentModelController.savedFile.value.path
                               .substring(clientPaymentModelController.savedFile.value.path.lastIndexOf("/") + 1));
                      Get.find<ClientPaymentModelController>().bankTransfer();
                     },backgroundColor: Colors.white,textColor: Colors.blueAccent,),
                     AdvertisersButton(text: 'رجوع',width:136.w , onPressed: (){

                     },backgroundColor: Color(0xff4391D4,)),
                   ],
                 ),
               )
              ],
            ),
          ),
        ),
      );
  }
   Future<void> showChoiceImageDialog(BuildContext context)
   {
     ImagePicker _imagePicker = ImagePicker();
     return showDialog(context: context,builder: (BuildContext context){

       return AlertDialog(
         title: Text("اختر مصدر",style: TextStyle(color: Colors.blue),),
         content: SingleChildScrollView(
           child: ListBody(
             children: [
               Divider(height: 1,color: Colors.blue,),
               ListTile(
                 onTap: () async {
                   _imagePicker
                       .pickImage(
                       source: ImageSource.gallery,
                       imageQuality: 60,
                       maxWidth: 1280,
                       maxHeight: 720)
                       .then((file) async {
                     clientPaymentModelController.file.value= File.fromUri(Uri.file(file!.path));
                     clientPaymentModelController.savedFile.value =
                         File.fromUri(Uri.file(file!.path));
                     // RegisterNewClientUserController.photo =
                     // await dio.MultipartFile.fromFile(file.path,
                     //     filename: file.path
                     //         .substring(file.path.lastIndexOf("/") + 1));
                     ClientPaymentModelController.photo =
                     await dio.MultipartFile.fromFile(clientPaymentModelController.savedFile.value.path,
                         filename: clientPaymentModelController.savedFile.value.path
                             .substring(clientPaymentModelController.savedFile.value.path.lastIndexOf("/") + 1));

                     //         provider = FileImage(savedFile);
                     //         setState(() {
                     clientPaymentModelController.imageBase641.value =
                         base64Encode(clientPaymentModelController
                             .savedFile.value
                             .readAsBytesSync());
                     //           file1=multi1;
                     //         });
                     //
                   });
                   Navigator.pop(context);
                 },
                 title: Text("المعرض"),
                 leading: Icon(Icons.account_box,color: Colors.blue,),
               ),

               Divider(height: 1,color: Colors.blue,),
               ListTile(
                 onTap: ()async {
                   _imagePicker
                       .pickImage(
                       source: ImageSource.camera,
                       imageQuality: 60,
                       maxWidth: 1280,
                       maxHeight: 720)
                       .then((file) async {
                     clientPaymentModelController.file.value= File.fromUri(Uri.file(file!.path));
                     clientPaymentModelController.savedFile.value =
                         File.fromUri(Uri.file(file!.path));
                     // RegisterNewClientUserController.photo =
                     //     await dio.MultipartFile.fromFile(file.path,
                     //         filename: file.path
                     //             .substring(file.path.lastIndexOf("/") + 1));
                     ClientPaymentModelController.photo =
                     await dio.MultipartFile.fromFile(clientPaymentModelController.savedFile.value.path,
                         filename: clientPaymentModelController.savedFile.value.path
                             .substring(clientPaymentModelController.savedFile.value.path.lastIndexOf("/") + 1));

                     //provider = FileImage(savedFile);
                     //setState(() {
                     clientPaymentModelController.imageBase641.value =
                         base64Encode(clientPaymentModelController
                             .savedFile.value
                             .readAsBytesSync());
                     //savedFile = null;
                     //logo=multi1;
                     // });
                   });

                   Navigator.pop(context);
                 },
                 title: Text("كاميرا"),
                 leading: Icon(Icons.camera,color: Colors.blue,),
               ),
             ],
           ),
         ),);
     });
   }
}
