import 'dart:async';
import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/users_module/app_colors.dart' as aliColors;
import 'package:advertisers/features/users_module/view/usedWidgets/advertiser_field_with_icon.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_generic_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class AddressBottomSheetAdvertiserDetailsPage extends StatelessWidget {
  ScrollController? scrollController;

  AddressBottomSheetAdvertiserDetailsPage({Key? key, this.scrollController}) : super(key: key);

  AdvertisingDetailsController controller=Get.put(AdvertisingDetailsController());
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: this.scrollController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                //margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(8.0.w),
                color: AppColors.bottomSheetTabColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30.0.h,
                      width: 140.0.w,
                      alignment: Alignment.center,
                      //padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(right: 8.0),
                      child: Text(
                        'عنوان الاعلان',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: AppColors.tabColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18.0.w),
                      child: SvgPicture.asset(
                        'images/location_icon.svg',
                        fit: BoxFit.fill,
                        height: 18.0.h,
                        width: 18.0.w,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: AppColors.dividerBottom,
                thickness: 4.0,
              ),

              Padding(
                padding:  EdgeInsetsDirectional.only(start:28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: AlignmentDirectional.centerStart,
                        child:  Text('اسم المكان',style: TextStyle(color: aliColors.AppColors.arrowBlueColor,fontSize: 16.sp),)),
                    AdvertisersGenericField(textAlignment: TextAlign.right, obscureText: false, controller: controller.placeNameController, hintText: 'اسم المكان'),
                    SizedBox(height:5.h),
                    AdvertisersFieldWithIcon(textAlignment: TextAlign.right,suffix: SizedBox(
                      width: 25.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Container(height: 40, color: aliColors.AppColors.greyColor,
                          width: 1,),
                        InkWell(
                          onTap: (){
                            _goToTheLake();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset('images/android-locate.svg'),
                          ),
                        ),

                      ],),
                    ), obscureText: false, controller: controller.placeAddressController, hintText: 'عنوان المكان'),
                  ],
                ),
              ),
              SizedBox(height: 5.h,),
              Center(
                child: SizedBox(
                  height: 226.85.h,
                  width: 322.w,
                  child: GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ),
              // floatingActionButton: FloatingActionButton.extended(
              //   onPressed: _goToTheLake,
              //   label: Text('To the lake!'),
              //   icon: Icon(Icons.directions_boat),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 135.w,
                    height: 35.h,
                    margin: EdgeInsets.only(right: 10.0.w, left: 10.0.w, top: 20.0.h),
                    child: Material(
                      elevation: 6.0,
                      shadowColor: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: AppColors.saveButtonBottomSheet,
                      child: Container(
                        /*margin: EdgeInsets.only(
                              left: 12.0, bottom: 4.0, right: 20),*/
                        alignment: Alignment.center,
                        child: Text(
                          'save'.tr,
                          style: TextStyle(
                              fontSize: 16.0.sp,
                              color: AppColors.tabColor,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 135.w,
                    height: 35.h,
                    margin: EdgeInsets.only(right: 10.0.w, left: 10.0.w, top: 20.0.h),
                    child: Material(
                      elevation: 6.0,
                      shadowColor: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: AppColors.tabColor,
                      child: Container(
                        /*margin: EdgeInsets.only(
                              left: 12.0, bottom: 4.0, right: 20),*/
                        alignment: Alignment.center,
                        child: Text(
                          'cancel'.tr,
                          style: TextStyle(
                              fontSize: 16.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
