import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/controller/login_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_client_user_controller.dart';
import 'package:advertisers/features/users_module/controller/register_phone_controller.dart';
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

class RegisterNewClientUser extends StatelessWidget {
  RegisterNewClientUser({Key? key}) : super(key: key);
  // late File savedFile=File(' ');
  final RegisterNewClientUserController _registerNewClientUserController =
      Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: AppColors.verifyFayrouzyFirst,
          gradient: LinearGradient(
              colors: [
                AppColors.verifyFayrouzyFirst,
                AppColors.verifyBlueSecond,
                AppColors.verifyGreenThird
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 1.6, .9]),
        ),
        alignment: Alignment.topCenter,
        child: Form(
          key: _registerNewClientUserController
              .registerNewClientUserControllerFormKey,
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
                    color: AppColors.whiteColor,
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
                              color: AppColors.verifyFayrouzyFirst,
                              shape: BoxShape.circle,
                            ),
                            child: _registerNewClientUserController
                                        .savedFile.value.path ==
                                    ' '
                                ? const Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.whiteColor,
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
                                            _registerNewClientUserController
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
                            child: const Icon(
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
                  controller: _registerNewClientUserController.nameController,
                  textAlignment: TextAlign.end,
                  hintText: 'name'.tr,
                  onSaved: (value) {
                    _registerNewClientUserController.name = value!;
                  },
                  validator: (value) {
                    return _registerNewClientUserController
                        .validateUserName(value!);
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
                    if (val == 'عميل') {
                      _registerNewClientUserController.role.value = 'user';
                    } else if (val == 'معلن') {
                      _registerNewClientUserController.role.value =
                          'advertiser';
                    }
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                AdvertisersGenericField(
                  obscureText: false,
                  controller:
                      _registerNewClientUserController.accountNameController,
                  textAlignment: TextAlign.end,
                  hintText: 'accountName'.tr,
                  onSaved: (value) {
                    _registerNewClientUserController.accountName = value!;
                  },
                  validator: (value) {
                    return _registerNewClientUserController
                        .validateAccountName(value!);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                Obx(() => AdvertisersPhone(
                      hintText: 'phone'.tr,
                     // enabled: false,
                      flag: false,
                      initialSelection:
                          _registerNewClientUserController.countryCode.value,
                      onChanged: (countryCodeVal) {
                        _registerNewClientUserController.countryCode.value =
                            countryCodeVal.dialCode!;
                      },
                      controller:
                          _registerNewClientUserController.phoneController,
                      onSaved: (value) {
                        _registerNewClientUserController.phone = value!;
                      },
                      validator: (value) {
                        return _registerNewClientUserController
                            .validatePhone(value!);
                      },
                    )),
                SizedBox(
                  height: 16.h,
                ),
                AdvertisersGenericField(
                  obscureText: false,
                  controller: _registerNewClientUserController.emailController,
                  textAlignment: TextAlign.end,
                  hintText: 'email'.tr,
                  onSaved: (value) {
                    _registerNewClientUserController.email = value!;
                  },
                  validator: (value) {
                    return _registerNewClientUserController
                        .validateEmail(value!);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                AdvertisersGenericField(
                  obscureText: false,
                  controller:
                      _registerNewClientUserController.nationalIDController,
                  textAlignment: TextAlign.end,
                  hintText: 'nationalId'.tr,
                  onChanged: (val) {
                    // _registerNewClientUserController.nationalIDMessValid.value=true;
                  },
                  onSaved: (value) {
                    _registerNewClientUserController.nationalID = value!;
                  },
                  validator: (value) {
                    return _registerNewClientUserController
                        .validateNationalId(value!);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                AdvertisersGenericField(
                  hintText: 'enterPassword'.tr,
                  obscureText: true,
                  textAlignment: TextAlign.end,
                  controller:
                      _registerNewClientUserController.passwordController,
                  onSaved: (value) {
                    _registerNewClientUserController.password = value!;
                  },
                  validator: (value) {
                    // return _registerNewClientUserController.validatePassword(value!);
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
                            items: _registerNewClientUserController
                                .countries.value,
                            onChanged: (country) {
                              _registerNewClientUserController.countryId.value =
                                  country.id.toString();
                              _registerNewClientUserController
                                  .changeAreas(country);
                            },
                          ),
                        ),
                        Obx(() => AdvertisersDropDown(
                              hintText: 'المدينة',
                              width: 150.w,
                              items:
                                  _registerNewClientUserController.areas.value,
                              onChanged: (area) {
                                _registerNewClientUserController.areaId.value =
                                    area.id.toString();
                              },
                            )),
                      ],
                    )),
                SizedBox(height: 44.6.h),
                AdvertisersButton(
                  text: 'verifyAndFollow'.tr,
                  onPressed: () {
                    if (_registerNewClientUserController.savedFile.value.path ==
                        ' ') {
                      Get.snackbar(
                        "خطأ",
                        'الصورة مطلوبة',
                        icon: const Icon(Icons.person, color: Colors.red),
                        backgroundColor: Colors.yellow,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      _registerNewClientUserController.savedFile.value =
                          File(' ');
                      _registerNewClientUserController.phoneMess.value = '';
                      _registerNewClientUserController.nameMess.value = '';
                      _registerNewClientUserController.nationalIDMess.value =
                          '';
                      _registerNewClientUserController.accountNameMess.value =
                          '';
                      _registerNewClientUserController.emailMess.value = '';

                      _registerNewClientUserController.errorRegister.value =
                          false;
                      _registerNewClientUserController.isValid.value = false;
                      _registerNewClientUserController.checkLogin();
                    }
                  },
                  backgroundColor: AppColors.verifyButtonColor,
                  textColor: AppColors.verifyTextColor,
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
                    _registerNewClientUserController.savedFile.value =
                        File.fromUri(Uri.file(file!.path));
                    RegisterNewClientUserController.photo =
                        await dio.MultipartFile.fromFile(file.path,
                            filename: file.path
                                .substring(file.path.lastIndexOf("/") + 1));

                    //provider = FileImage(savedFile);
                    //setState(() {
                    _registerNewClientUserController.imageBase641.value =
                        base64Encode(_registerNewClientUserController
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
                    _registerNewClientUserController.savedFile.value =
                        File.fromUri(Uri.file(file!.path));
                    RegisterNewClientUserController.photo =
                        await dio.MultipartFile.fromFile(file.path,
                            filename: file.path
                                .substring(file.path.lastIndexOf("/") + 1));
                    //         provider = FileImage(savedFile);
                    //         setState(() {
                    _registerNewClientUserController.imageBase641.value =
                        base64Encode(_registerNewClientUserController
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
