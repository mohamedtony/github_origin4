import 'dart:convert';
import 'dart:io';
import 'dart:ui';
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
                          _showBottomSheet1(context);
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
                        _registerNewAdvertiserUserController.nameController,
                    textAlignment: TextAlign.end,
                    hintText: 'name'.tr, onSaved: (value) {
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
                    width: 0,
                    itemType: 'String',
                    items: const ['عميل', 'معلن'],
                    onChanged: (val) {
                      if(val=='عميل') {
                        _registerNewAdvertiserUserController.role.value = 'user';
                      }else if(val=='معلن'){
                        _registerNewAdvertiserUserController.role.value = 'advertiser';
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
                    hintText: 'accountName'.tr, onSaved: (value) {
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
                        _registerNewAdvertiserUserController.countryCode.value=countryCodeVal.dialCode! ;
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
                    hintText: 'email'.tr, onSaved: (value) {
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
                AdvertisersGenericField(
                    obscureText: false,
                    borderColor: AppColors.borderAdvertiserRegisterColor,
                    controller: _registerNewAdvertiserUserController
                        .nationalIDController,
                    textAlignment: TextAlign.end,
                    hintText: 'nationalId'.tr, onSaved: (value) {
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
                    // return _registerNewAdvertiserUserController.validatePassword(value!);
                  },
                ),
                SizedBox(height: 16.h),
                SizedBox(
                    width: 323.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => AdvertisersDropDown(
                            hintText: 'الدولة',
                            width: 150.w,
                            items: _registerNewAdvertiserUserController
                                .countries.value,
                            onChanged: (country) {
                              _registerNewAdvertiserUserController
                                  .countryId.value = country.id.toString();
                              _registerNewAdvertiserUserController
                                  .changeAreas(country);
                            },
                          ),
                        ),
                        Obx(() => AdvertisersDropDown(
                              hintText: 'المدينة',
                              width: 150.w,
                              items: _registerNewAdvertiserUserController
                                  .areas.value,
                              onChanged: (area) {
                                _registerNewAdvertiserUserController
                                    .areaId.value = area.id.toString();
                              },
                            )),
                      ],
                    )),
                SizedBox(height: 44.6.h),
                AdvertisersButton(
                  text: 'verifyAndFollow'.tr,
                  onPressed: () {
                    _registerNewAdvertiserUserController.checkLogin(context);
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

  void _showBottomSheet1(BuildContext context) {
    ImagePicker _imagePicker = ImagePicker();
    // Future<File> imageFile;
    // ImageProvider provider;
    // String base64;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Row(
            children: <Widget>[
              IconButton(
                onPressed: () async {
                  _imagePicker
                      .pickImage(
                          source: ImageSource.camera,
                          imageQuality: 60,
                          maxWidth: 1280,
                          maxHeight: 720)
                      .then((file) async {
                    _registerNewAdvertiserUserController.savedFile.value =
                        File.fromUri(Uri.file(file!.path));
                    RegisterNewAdvertiserUserController.photo =
                        await dio.MultipartFile.fromFile(file.path,
                            filename: file.path
                                .substring(file.path.lastIndexOf("/") + 1));

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
                icon: const Icon(
                  Icons.photo_camera,
                  color: Colors.green,
                  size: 20,
                  semanticLabel: "كاميرا",
                ),
                // child:const Text(
                //   "كاميرا",
                //   style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w800,
                //       color: Colors.green),
                // )
              ),
              IconButton(
                onPressed: () async {
                  _imagePicker
                      .pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 60,
                          maxWidth: 1280,
                          maxHeight: 720)
                      .then((file) async {
                    _registerNewAdvertiserUserController.savedFile.value =
                        File.fromUri(Uri.file(file!.path));
                    RegisterNewAdvertiserUserController.photo =
                        await dio.MultipartFile.fromFile(file.path,
                            filename: file.path
                                .substring(file.path.lastIndexOf("/") + 1));
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
                icon: const Icon(
                  Icons.photo,
                  color: Colors.green,
                  size: 20,
                  semanticLabel: "المعرض",
                ),
                // label: const Text(
                //   "المعرض",
                //   style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w800,
                //       color: Colors.green),
                // )
              ),
            ],
          );
        });
  }
}
