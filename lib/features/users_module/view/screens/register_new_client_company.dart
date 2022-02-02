import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/controller/register_new_client_company_controller.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_dropdown.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_generic_field.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_phone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class RegisterNewClientCompany extends StatelessWidget {
  RegisterNewClientCompany({Key? key}) : super(key: key);
  final RegisterNewClientCompanyController _registerNewClientCompanyController =
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
          key: _registerNewClientCompanyController
              .registerNewCompanyUserControllerKeyForm1,
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
                            child: _registerNewClientCompanyController
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
                                            _registerNewClientCompanyController
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
                  controller:
                      _registerNewClientCompanyController.companyNameController,
                  textAlignment: TextAlign.end,
                  hintText: 'companyName'.tr,
                  onSaved: (value) {
                    _registerNewClientCompanyController.companyName = value!;
                  },
                  validator: (value) {
                    return _registerNewClientCompanyController
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
                  controller:
                      _registerNewClientCompanyController.accountNameController,
                  textAlignment: TextAlign.end,
                  hintText: 'accountName'.tr,
                  onSaved: (value) {
                    _registerNewClientCompanyController.accountName = value!;
                  },
                  validator: (value) {
                    return _registerNewClientCompanyController
                        .validateAccountName(value!);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                AdvertisersGenericField(
                  obscureText: false,
                  controller: _registerNewClientCompanyController
                      .accountAdminNameController,
                  textAlignment: TextAlign.end,
                  hintText: 'accountAdminName'.tr,
                  onSaved: (value) {
                    _registerNewClientCompanyController.accountAdminName =
                        value!;
                  },
                  validator: (value) {
                    return _registerNewClientCompanyController
                        .validateAccountName(value!);
                  },
                ),

                SizedBox(
                  height: 16.h,
                ),
                Obx(() => AdvertisersPhone(
                      hintText: 'phone'.tr,
                      //enabled: false,
                      flag: false,
                      initialSelection:
                          _registerNewClientCompanyController.countryCode.value,
                      onChanged: (countryCodeVal) {
                        _registerNewClientCompanyController.countryCode.value =
                            countryCodeVal.code!;
                      },
                      controller:
                          _registerNewClientCompanyController.phoneController,
                      onSaved: (value) {
                        _registerNewClientCompanyController.phone = value!;
                      },
                      validator: (value) {
                        return _registerNewClientCompanyController
                            .validatePhone(value!);
                      },
                    )),
                SizedBox(
                  height: 16.h,
                ),
                AdvertisersGenericField(
                  obscureText: false,
                  controller:
                      _registerNewClientCompanyController.emailController,
                  textAlignment: TextAlign.end,
                  hintText: 'email'.tr,
                  onSaved: (value) {
                    _registerNewClientCompanyController.email = value!;
                  },
                  validator: (value) {
                    return _registerNewClientCompanyController
                        .validateEmail(value!);
                  },
                ),

                SizedBox(
                  height: 16.h,
                ),
                AdvertisersGenericField(
                  obscureText: false,
                  controller:
                      _registerNewClientCompanyController.recordIDController,
                  textAlignment: TextAlign.end,
                  hintText: 'recordNumber'.tr,
                  onSaved: (value) {
                    _registerNewClientCompanyController.recordNumber = value!;
                  },
                  validator: (value) {
                    return _registerNewClientCompanyController
                        .validateRecordID(value!);
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
                      _registerNewClientCompanyController.passwordController,
                  onSaved: (value) {
                    _registerNewClientCompanyController.password = value!;
                  },
                  validator: (value) {
                    return _registerNewClientCompanyController
                        .validatePassword(value!);
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
                              items: _registerNewClientCompanyController
                                  .areas.value,
                              onChanged: (area) {
                                _registerNewClientCompanyController
                                    .areaId.value = area.id.toString();
                              },
                            )),
                        Obx(
                              () => AdvertisersDropDown(
                            hintText: 'الدولة',
                            width: 150.w,
                            items: _registerNewClientCompanyController
                                .countries.value,
                            onChanged: (country) {
                              _registerNewClientCompanyController
                                  .countryId.value = country.id.toString();
                              _registerNewClientCompanyController
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
                    if (_registerNewClientCompanyController
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
                      _registerNewClientCompanyController.savedFile.value =
                          File(' ');
                      _registerNewClientCompanyController.phoneMess.value = '';
                      _registerNewClientCompanyController.nameMess.value = '';
                      _registerNewClientCompanyController.nationalIDMess.value =
                          '';
                      _registerNewClientCompanyController
                          .accountNameMess.value = '';
                      _registerNewClientCompanyController.emailMess.value = '';

                      _registerNewClientCompanyController.errorRegister.value =
                          false;
                      _registerNewClientCompanyController.isValid.value = false;

                      _registerNewClientCompanyController.checkLogin();
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
                    _registerNewClientCompanyController.savedFile.value =
                        File.fromUri(Uri.file(file!.path));
                    RegisterNewClientCompanyController.photo =
                        await dio.MultipartFile.fromFile(file.path,
                            filename: file.path
                                .substring(file.path.lastIndexOf("/") + 1));

                    //provider = FileImage(savedFile);
                    //setState(() {
                    _registerNewClientCompanyController.imageBase641.value =
                        base64Encode(_registerNewClientCompanyController
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
                    _registerNewClientCompanyController.savedFile.value =
                        File.fromUri(Uri.file(file!.path));
                    RegisterNewClientCompanyController.photo =
                        await dio.MultipartFile.fromFile(file.path,
                            filename: file.path
                                .substring(file.path.lastIndexOf("/") + 1));
                    //         provider = FileImage(savedFile);
                    //         setState(() {
                    _registerNewClientCompanyController.imageBase641.value =
                        base64Encode(_registerNewClientCompanyController
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
