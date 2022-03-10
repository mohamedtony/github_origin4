import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/controller/login_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_advertiser_company_controller.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_dropdown.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_generic_field.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_phone.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class RegisterNewAdvertiserCompany extends StatelessWidget {
  RegisterNewAdvertiserCompany({Key? key}) : super(key: key);
  final RegisterNewAdvertiserCompanyController
      _registerNewAdvertiserCompanyController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.whiteColor,
        // decoration:const BoxDecoration(
        //   color:AppColors.verifyFayrouzyFirst,
        //   gradient: LinearGradient(colors: [AppColors.verifyFayrouzyFirst,AppColors.verifyBlueSecond,AppColors.verifyGreenThird],
        //       begin: Alignment.topCenter,end: Alignment.bottomCenter ,stops:[0,1.6,.9]),
        // ),
        alignment: Alignment.topCenter,
        child: Form(
          key: _registerNewAdvertiserCompanyController
              .registerNewAdvertiserCompanyControllerKeyForm,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 79.44.h,
                  width: 76.44.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColors.greyColor,
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      InkWell(
                        onTap: () {
                          showChoiceImageDialog(context);
                        },
                        child: Obx(
                          () => Container(
                            height: 76.44.h,
                            width: 76.44.w,
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                            ),
                            child: _registerNewAdvertiserCompanyController
                                        .savedFile.value.path ==
                                    ' '
                                ? const Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.verifyFayrouzyFirst,
                                    size: 50,
                                  )
                                : Container(
                                    height: 76.44.h,
                                    width: 76.44.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.verifyFayrouzyFirst,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: FileImage(
                                            _registerNewAdvertiserCompanyController
                                                .savedFile.value,
                                          ),
                                          fit: BoxFit.fill,
                                        )),
                                    // child: Image.file(_registerNewClientUserController
                                    //     .savedFile.value,fit: BoxFit.fill,),
                                  ),
                            //  child:   SvgPicture.asset('images/camera.svg',height: 26.13.h,width:34.84.w,fit: BoxFit.fitWidth),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(top: 2.0.h, end: 0.w),
                        child: Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 25,
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 28.62.h,
                ),

                AdvertisersGenericField(
                  obscureText: false,
                  controller: _registerNewAdvertiserCompanyController
                      .companyNameController,
                  textAlignment: TextAlign.end,
                  hintText: 'companyName'.tr,
                  borderColor: AppColors.borderAdvertiserRegisterColor,
                  onSaved: (value) {
                    _registerNewAdvertiserCompanyController.companyName =
                        value!;
                  },
                  validator: (value) {
                    return _registerNewAdvertiserCompanyController
                        .validateCompanyName(value!);
                  },
                ),
                // SizedBox(height: 15.h,),
                // AdvertisersDropDown(hintText: 'type'.tr,width: 0,),
                // SizedBox(height: 15.h,),
                SizedBox(
                  height: 16.h,
                ),
                AdvertisersGenericField(
                  obscureText: false,
                  borderColor: AppColors.borderAdvertiserRegisterColor,
                  controller: _registerNewAdvertiserCompanyController
                      .accountNameController,
                  onSaved: (value) {
                    _registerNewAdvertiserCompanyController.accountName =
                        value!;
                  },
                  validator: (value) {
                    return _registerNewAdvertiserCompanyController
                        .validateAccountName(value!);
                  },
                  textAlignment: TextAlign.end,
                  hintText: 'accountName'.tr,
                ),
                SizedBox(
                  height: 16.h,
                ),
                AdvertisersGenericField(
                  obscureText: false,
                  borderColor: AppColors.borderAdvertiserRegisterColor,
                  controller: _registerNewAdvertiserCompanyController
                      .accountAdminNameController,
                  textAlignment: TextAlign.end,
                  hintText: 'accountAdminName'.tr,
                  onSaved: (value) {
                    _registerNewAdvertiserCompanyController.accountAdminName =
                        value!;
                  },
                  validator: (value) {
                    return _registerNewAdvertiserCompanyController
                        .validateAccountName(value!);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                Obx(() => AdvertisersPhone(
                      hintText: 'phone'.tr,
                      enabled: false,
                      flag: false,
                      initialSelection: _registerNewAdvertiserCompanyController
                          .countryCode.value,
                      borderColor: AppColors.borderAdvertiserRegisterColor,
                      onChanged: (countryCodeVal) {
                        _registerNewAdvertiserCompanyController
                            .countryCode.value = countryCodeVal.code!;
                      },
                      controller: _registerNewAdvertiserCompanyController
                          .phoneController,
                      onSaved: (value) {
                        _registerNewAdvertiserCompanyController.phone = value!;
                      },
                      validator: (value) {
                        return _registerNewAdvertiserCompanyController
                            .validatePhone(value!);
                      },
                    )),
                SizedBox(
                  height: 16.h,
                ),
                AdvertisersGenericField(
                  obscureText: false,
                  borderColor: AppColors.borderAdvertiserRegisterColor,
                  controller:
                      _registerNewAdvertiserCompanyController.emailController,
                  textAlignment: TextAlign.end,
                  hintText: 'email'.tr,
                  onSaved: (value) {
                    _registerNewAdvertiserCompanyController.email = value!;
                  },
                  validator: (value) {
                    return _registerNewAdvertiserCompanyController
                        .validateEmail(value!);
                  },
                ),

                SizedBox(
                  height: 16.h,
                ),
                AdvertisersGenericField(
                  obscureText: false,
                  keyboardType:TextInputType.number,
                  borderColor: AppColors.borderAdvertiserRegisterColor,
                  controller: _registerNewAdvertiserCompanyController
                      .recordIDController,
                  textAlignment: TextAlign.end,
                  hintText: 'recordNumber'.tr,
                  onSaved: (value) {
                    _registerNewAdvertiserCompanyController.recordNumber =
                        value!;
                  },
                  validator: (value) {
                    return _registerNewAdvertiserCompanyController
                        .validateRecordID(value!);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),

                AdvertisersGenericField(
                  hintText: 'enterPassword'.tr,
                  borderColor: AppColors.borderAdvertiserRegisterColor,
                  obscureText: true,
                  textAlignment: TextAlign.end,
                  controller: _registerNewAdvertiserCompanyController
                      .passwordController,
                  onSaved: (value) {
                    _registerNewAdvertiserCompanyController.password = value!;
                  },
                  validator: (value) {
                     return _registerNewAdvertiserCompanyController.validatePassword(value!);
                  },
                ),
                SizedBox(height: 16.h),
                SizedBox(
                    width: 323.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Obx(() => AdvertisersDropDown(
                              hintText: 'المدينة',
                              width: 150.w,
                              items: _registerNewAdvertiserCompanyController
                                  .areas.value,
                              onChanged: (area) {
                                _registerNewAdvertiserCompanyController
                                    .areaId.value = area.id.toString();
                              },
                            )),
                        Obx(
                              () => AdvertisersDropDown(
                            hintText: 'الدولة',
                            width: 150.w,
                            items: _registerNewAdvertiserCompanyController
                                .countries.value,
                            onChanged: (country) {
                              _registerNewAdvertiserCompanyController
                                  .countryId.value = country.id.toString();
                              _registerNewAdvertiserCompanyController
                                  .changeAreas(country);
                            },
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 44.6.h),
                AdvertisersButton(
                  text: 'verifyAndFollow'.tr,
                  onPressed: () {
                    if (_registerNewAdvertiserCompanyController
                            .savedFile.value.path ==
                        ' ') {
                      Get.snackbar(
                        "خطأ",
                        'الصورة مطلوبة',
                        icon: const Icon(Icons.person, color: Colors.red),
                        backgroundColor: Colors.yellow,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      // _registerNewAdvertiserCompanyController.savedFile.value =
                      //     File(' ');
                      _registerNewAdvertiserCompanyController.phoneMess.value =
                          '';
                      _registerNewAdvertiserCompanyController.nameMess.value =
                          '';
                      _registerNewAdvertiserCompanyController
                          .nationalIDMess.value = '';
                      _registerNewAdvertiserCompanyController
                          .accountNameMess.value = '';
                      _registerNewAdvertiserCompanyController.emailMess.value =
                          '';

                      _registerNewAdvertiserCompanyController
                          .errorRegister.value = false;
                      _registerNewAdvertiserCompanyController.isValid.value =
                          false;

                      _registerNewAdvertiserCompanyController.checkLogin();
                    }
                  },
                ),
                SizedBox(height: 22.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _showBottomSheet1(BuildContext context) {
  //   ImagePicker _imagePicker = ImagePicker();
  //   // Future<File> imageFile;
  //   // ImageProvider provider;
  //   // String base64;
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return SizedBox(
  //           // width: 375.w,
  //           child: Row(
  //             children: <Widget>[
  //               ElevatedButton.icon(
  //                 label: Text("كاميرا"),
  //                 onPressed: () async {
  //                   _imagePicker
  //                       .pickImage(
  //                       source: ImageSource.camera,
  //                       imageQuality: 60,
  //                       maxWidth: 1280,
  //                       maxHeight: 720)
  //                       .then((file) async {
  //                     _registerNewAdvertiserCompanyController.file.value= File.fromUri(Uri.file(file!.path));
  //                     _registerNewAdvertiserCompanyController.savedFile.value =
  //                         File.fromUri(Uri.file(file!.path));
  //                     // RegisterNewClientUserController.photo =
  //                     //     await dio.MultipartFile.fromFile(file.path,
  //                     //         filename: file.path
  //                     //             .substring(file.path.lastIndexOf("/") + 1));
  //                     RegisterNewAdvertiserCompanyController.photo =
  //                     await dio.MultipartFile.fromFile(_registerNewAdvertiserCompanyController.savedFile.value.path,
  //                         filename: _registerNewAdvertiserCompanyController.savedFile.value.path
  //                             .substring(_registerNewAdvertiserCompanyController.savedFile.value.path.lastIndexOf("/") + 1));
  //
  //                     //provider = FileImage(savedFile);
  //                     //setState(() {
  //                     _registerNewAdvertiserCompanyController.imageBase641.value =
  //                         base64Encode(_registerNewAdvertiserCompanyController
  //                             .savedFile.value
  //                             .readAsBytesSync());
  //                     //savedFile = null;
  //                     //logo=multi1;
  //                     // });
  //                   });
  //                   Navigator.pop(context);
  //                 },
  //                 icon:SizedBox(
  //                   // width: 200,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     children:[
  //                       Icon(Icons.photo_camera),
  //
  //                     ],
  //
  //
  //                   ),
  //                 ),
  //                 // child:const Text(
  //                 //   "كاميرا",
  //                 //   style: TextStyle(
  //                 //       fontSize: 16,
  //                 //       fontWeight: FontWeight.w800,
  //                 //       color: Colors.green),
  //                 // )
  //               ),
  //               SizedBox(width:10.w),
  //               ElevatedButton.icon(
  //                 label:  Text("المعرض"),
  //                 onPressed: () async {
  //                   _imagePicker
  //                       .pickImage(
  //                       source: ImageSource.gallery,
  //                       imageQuality: 60,
  //                       maxWidth: 1280,
  //                       maxHeight: 720)
  //                       .then((file) async {
  //                     _registerNewAdvertiserCompanyController.file.value= File.fromUri(Uri.file(file!.path));
  //                     _registerNewAdvertiserCompanyController.savedFile.value =
  //                         File.fromUri(Uri.file(file!.path));
  //                     // RegisterNewClientUserController.photo =
  //                     // await dio.MultipartFile.fromFile(file.path,
  //                     //     filename: file.path
  //                     //         .substring(file.path.lastIndexOf("/") + 1));
  //                     RegisterNewAdvertiserCompanyController.photo =
  //                     await dio.MultipartFile.fromFile(_registerNewAdvertiserCompanyController.savedFile.value.path,
  //                         filename: _registerNewAdvertiserCompanyController.savedFile.value.path
  //                             .substring(_registerNewAdvertiserCompanyController.savedFile.value.path.lastIndexOf("/") + 1));
  //
  //                     //         provider = FileImage(savedFile);
  //                     //         setState(() {
  //                     _registerNewAdvertiserCompanyController.imageBase641.value =
  //                         base64Encode(_registerNewAdvertiserCompanyController
  //                             .savedFile.value
  //                             .readAsBytesSync());
  //                     //           file1=multi1;
  //                     //         });
  //                     //
  //                   });
  //                   Navigator.pop(context);
  //                 },
  //                 icon:Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children:[
  //                     Icon(Icons.photo),
  //
  //                   ],
  //
  //
  //                 ),
  //
  //                 // label: const Text(
  //                 //   "المعرض",
  //                 //   style: TextStyle(
  //                 //       fontSize: 16,
  //                 //       fontWeight: FontWeight.w800,
  //                 //       color: Colors.green),
  //                 // )
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }
  Future<void> showChoiceImageDialog(BuildContext context)
  {
    ImagePicker _imagePicker = ImagePicker();
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("اختر",style: TextStyle(color: Colors.blue),),
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
                    _registerNewAdvertiserCompanyController.file.value= File.fromUri(Uri.file(file!.path));
                    _registerNewAdvertiserCompanyController.savedFile.value =
                        File.fromUri(Uri.file(file!.path));
                    // RegisterNewClientUserController.photo =
                    // await dio.MultipartFile.fromFile(file.path,
                    //     filename: file.path
                    //         .substring(file.path.lastIndexOf("/") + 1));
                    RegisterNewAdvertiserCompanyController.photo =
                    await dio.MultipartFile.fromFile(_registerNewAdvertiserCompanyController.savedFile.value.path,
                        filename: _registerNewAdvertiserCompanyController.savedFile.value.path
                            .substring(_registerNewAdvertiserCompanyController.savedFile.value.path.lastIndexOf("/") + 1));

                    //         provider = FileImage(savedFile);
                    //         setState(() {
                    _registerNewAdvertiserCompanyController.imageBase641.value =
                        base64Encode(_registerNewAdvertiserCompanyController
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
                    _registerNewAdvertiserCompanyController.file.value= File.fromUri(Uri.file(file!.path));
                    _registerNewAdvertiserCompanyController.savedFile.value =
                        File.fromUri(Uri.file(file!.path));
                    // RegisterNewClientUserController.photo =
                    //     await dio.MultipartFile.fromFile(file.path,
                    //         filename: file.path
                    //             .substring(file.path.lastIndexOf("/") + 1));
                    RegisterNewAdvertiserCompanyController.photo =
                    await dio.MultipartFile.fromFile(_registerNewAdvertiserCompanyController.savedFile.value.path,
                        filename: _registerNewAdvertiserCompanyController.savedFile.value.path
                            .substring(_registerNewAdvertiserCompanyController.savedFile.value.path.lastIndexOf("/") + 1));

                    //provider = FileImage(savedFile);
                    //setState(() {
                    _registerNewAdvertiserCompanyController.imageBase641.value =
                        base64Encode(_registerNewAdvertiserCompanyController
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
