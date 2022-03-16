import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:dio/dio.dart' as dio;
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/controller/login_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_advertiser_user_controller.dart';
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

class RegisterNewAdvertiserUser extends StatelessWidget {
  RegisterNewAdvertiserUser({Key? key}) : super(key: key);
  final RegisterNewAdvertiserUserController
      _registerNewAdvertiserUserController = Get.find();
  @override
  Widget build(BuildContext context) {
    Get.reload(force: true,);
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
          key: _registerNewAdvertiserUserController
              .registerNewAdvertiserUserControllerFormKey,
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
                            child: _registerNewAdvertiserUserController
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
                                        color: AppColors.whiteColor,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: FileImage(
                                            _registerNewAdvertiserUserController
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
                      // Container(
                      //   height:76.44.h,
                      //   width:76.44.w,
                      //   decoration:const BoxDecoration(
                      //     color: AppColors.whiteColor,
                      //     shape: BoxShape.circle,),
                      //   child: Icon(Icons.camera_alt_outlined,color: AppColors.blueAccentColor,size: 50,),
                      // child:   SvgPicture.asset('images/camera.svg',height: 26.13.h,width:34.84.w,fit: BoxFit.fitWidth),

                      // image:  DecorationImage(image: svg.Svg('images/notLogo.svg'),fit: BoxFit.fill)),
                      // ),
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
                  borderColor: AppColors.borderAdvertiserRegisterColor,
                  controller:
                      _registerNewAdvertiserUserController.accountNameController,
                  textAlignment: TextAlign.end,
                  hintText: 'name'.tr,
                  onSaved: (value) {
                    _registerNewAdvertiserUserController.accountName = value!;
                  },
                  validator: (value) {
                    return _registerNewAdvertiserUserController
                        .validateAccountName(value!);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                AdvertisersDropDown(
                  hintText: 'type'.tr,
                  width: 0,showSearchBox: false,
                  areas:[Area()],
                  itemType: 'String',
                  items: const ['ذكر', 'أنثى'],
                  onChanged: (val) {
                    if (val == 'ذكر') {
                      _registerNewAdvertiserUserController.gender.value = 'male';
                    } else if (val == 'أنثى') {
                      _registerNewAdvertiserUserController.gender.value =
                      'female';
                    }
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                AdvertisersGenericField(
                  obscureText: false,
                  borderColor: AppColors.borderAdvertiserRegisterColor,
                  controller: _registerNewAdvertiserUserController
                      .accountNameController,
                  textAlignment: TextAlign.end,
                  hintText: 'accountName'.tr,
                  onSaved: (value) {
                    _registerNewAdvertiserUserController.accountName = value!;
                  },
                  validator: (value) {
                    return _registerNewAdvertiserUserController
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
                      borderColor: AppColors.borderAdvertiserRegisterColor,
                      initialSelection: _registerNewAdvertiserUserController
                          .countryCode.value,
                      onChanged: (countryCodeVal) {
                        _registerNewAdvertiserUserController.countryCode.value =
                            countryCodeVal.dialCode!;
                      },
                      controller:
                          _registerNewAdvertiserUserController.phoneController,
                      onSaved: (value) {
                        _registerNewAdvertiserUserController.phone = value!;
                      },
                      validator: (value) {
                        return _registerNewAdvertiserUserController
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
                      _registerNewAdvertiserUserController.emailController,
                  textAlignment: TextAlign.end,
                  hintText: 'email'.tr,
                  onSaved: (value) {
                    _registerNewAdvertiserUserController.email = value!;
                  },
                  validator: (value) {
                    return _registerNewAdvertiserUserController
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
                  controller:
                      _registerNewAdvertiserUserController.nationalIDController,
                  textAlignment: TextAlign.end,
                  hintText: 'nationalId'.tr,
                  onSaved: (value) {
                    _registerNewAdvertiserUserController.nationalID = value!;
                  },
                  validator: (value) {
                    return _registerNewAdvertiserUserController
                        .validateNationalId(value!);
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
                  controller:
                      _registerNewAdvertiserUserController.passwordController,
                  onSaved: (value) {
                    _registerNewAdvertiserUserController.password = value!;
                  },
                  validator: (value) {
                    return _registerNewAdvertiserUserController
                        .validatePassword(value!);
                  },
                ),
                SizedBox(height: 16.h),
                SizedBox(
                    width: 323.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Obx(() =>InkWell(
                          onTap: (){
                            _registerNewAdvertiserUserController.empty.value=false;
                          },
                          child: AdvertisersDropDown(
                            // key: ValueKey('clientCity'),
                            hintText: 'المدينة',itemType: 'city',
                            empty: _registerNewAdvertiserUserController.empty.value,
                            areas: Get.find<RegisterNewAdvertiserUserController>().areas??[],
                            width: 150.w,
                            items:
                            _registerNewAdvertiserUserController.areas.value,
                            onChanged: (area) {
                              _registerNewAdvertiserUserController.areaId.value =
                                  area.id.toString();
                              _registerNewAdvertiserUserController.empty.value=false;
                            },
                          ),
                        )),
                        Obx(
                              () => AdvertisersDropDown(
                            hintText: 'الدولة',
                            key: ValueKey('clientCountry'),
                            empty:false,
                            width: 150.w,
                            areas:[Area()],
                            items: _registerNewAdvertiserUserController
                                .countries.value,
                            onChanged: (country) {
                              _registerNewAdvertiserUserController.empty.value=true;
                              _registerNewAdvertiserUserController.countryId.value =
                                  country.id.toString();
                              Get.find<RegisterNewAdvertiserUserController>().country.value=country;
                              _registerNewAdvertiserUserController
                                  .changeAreas(country);



                            }, onBeforeChanged: (l,v){
                                _registerNewAdvertiserUserController.empty.value=true;
                            return Future.value(true);
                          },
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 44.6.h),

                AdvertisersButton(
                  text: 'verifyAndFollow'.tr,
                  onPressed: () {
                    if (_registerNewAdvertiserUserController
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
                      // _registerNewAdvertiserUserController.savedFile.value =
                      //     File(' ');
                      _registerNewAdvertiserUserController.phoneMess.value = '';
                      _registerNewAdvertiserUserController.nameMess.value = '';
                      _registerNewAdvertiserUserController
                          .nationalIDMess.value = '';
                      _registerNewAdvertiserUserController
                          .accountNameMess.value = '';
                      _registerNewAdvertiserUserController.emailMess.value = '';

                      _registerNewAdvertiserUserController.errorRegister.value =
                          false;
                      _registerNewAdvertiserUserController.isValid.value =
                          false;
                      _registerNewAdvertiserUserController.checkLogin();
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
  //                     _registerNewAdvertiserUserController.file.value= File.fromUri(Uri.file(file!.path));
  //                     _registerNewAdvertiserUserController.savedFile.value =
  //                         File.fromUri(Uri.file(file!.path));
  //                     // RegisterNewClientUserController.photo =
  //                     //     await dio.MultipartFile.fromFile(file.path,
  //                     //         filename: file.path
  //                     //             .substring(file.path.lastIndexOf("/") + 1));
  //                     RegisterNewAdvertiserUserController.photo =
  //                     await dio.MultipartFile.fromFile(_registerNewAdvertiserUserController.savedFile.value.path,
  //                         filename: _registerNewAdvertiserUserController.savedFile.value.path
  //                             .substring(_registerNewAdvertiserUserController.savedFile.value.path.lastIndexOf("/") + 1));
  //
  //                     //provider = FileImage(savedFile);
  //                     //setState(() {
  //                     _registerNewAdvertiserUserController.imageBase641.value =
  //                         base64Encode(_registerNewAdvertiserUserController
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
  //                     _registerNewAdvertiserUserController.file.value= File.fromUri(Uri.file(file!.path));
  //                     _registerNewAdvertiserUserController.savedFile.value =
  //                         File.fromUri(Uri.file(file!.path));
  //                     // RegisterNewClientUserController.photo =
  //                     // await dio.MultipartFile.fromFile(file.path,
  //                     //     filename: file.path
  //                     //         .substring(file.path.lastIndexOf("/") + 1));
  //                     RegisterNewAdvertiserUserController.photo =
  //                     await dio.MultipartFile.fromFile(_registerNewAdvertiserUserController.savedFile.value.path,
  //                         filename: _registerNewAdvertiserUserController.savedFile.value.path
  //                             .substring(_registerNewAdvertiserUserController.savedFile.value.path.lastIndexOf("/") + 1));
  //
  //                     //         provider = FileImage(savedFile);
  //                     //         setState(() {
  //                     _registerNewAdvertiserUserController.imageBase641.value =
  //                         base64Encode(_registerNewAdvertiserUserController
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
                    _registerNewAdvertiserUserController.file.value= File.fromUri(Uri.file(file!.path));
                    _registerNewAdvertiserUserController.savedFile.value =
                        File.fromUri(Uri.file(file!.path));
                    // RegisterNewClientUserController.photo =
                    // await dio.MultipartFile.fromFile(file.path,
                    //     filename: file.path
                    //         .substring(file.path.lastIndexOf("/") + 1));
                    RegisterNewAdvertiserUserController.photo =
                    await dio.MultipartFile.fromFile(_registerNewAdvertiserUserController.savedFile.value.path,
                        filename: _registerNewAdvertiserUserController.savedFile.value.path
                            .substring(_registerNewAdvertiserUserController.savedFile.value.path.lastIndexOf("/") + 1));

                    //         provider = FileImage(savedFile);
                    //         setState(() {
                    _registerNewAdvertiserUserController.imageBase641.value =
                        base64Encode(_registerNewAdvertiserUserController
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
                    _registerNewAdvertiserUserController.file.value= File.fromUri(Uri.file(file!.path));
                    _registerNewAdvertiserUserController.savedFile.value =
                        File.fromUri(Uri.file(file!.path));
                    // RegisterNewClientUserController.photo =
                    //     await dio.MultipartFile.fromFile(file.path,
                    //         filename: file.path
                    //             .substring(file.path.lastIndexOf("/") + 1));
                    RegisterNewAdvertiserUserController.photo =
                    await dio.MultipartFile.fromFile(_registerNewAdvertiserUserController.savedFile.value.path,
                        filename: _registerNewAdvertiserUserController.savedFile.value.path
                            .substring(_registerNewAdvertiserUserController.savedFile.value.path.lastIndexOf("/") + 1));

                    //provider = FileImage(savedFile);
                    //setState(() {
                    _registerNewAdvertiserUserController.imageBase641.value =
                        base64Encode(_registerNewAdvertiserUserController
                            .savedFile.value
                            .readAsBytesSync());
                    //savedFile = null;
                    //logo=multi1;
                    // });
                  });

                  Navigator.pop(context);
                },
                title: Text("الكاميرا"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }
}


