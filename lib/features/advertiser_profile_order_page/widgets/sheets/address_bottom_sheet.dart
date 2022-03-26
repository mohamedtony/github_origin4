import 'dart:async';

import 'package:advertisers/features/advertiser_profile_order_page/controller/AdvertiserProfileOrderController.dart';
import 'package:advertisers/features/request_advertise_module/controller/address_bottom_sheet_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/adertising_channels_controller.dart';
import 'package:advertisers/features/request_advertise_module/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/users_module/app_colors.dart' as aliColors;
import 'package:advertisers/features/request_advertise_module/controller/request_advertise_controller.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertiser_field_with_icon.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_generic_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class AddressBottomSheet extends StatefulWidget {
  ScrollController? scrollController;

  AddressBottomSheet({Key? key, this.scrollController}) : super(key: key);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(	24.774265, 46.738586),
    zoom: 14.4746,
  );

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  AddressBottomSheetController addressBottomSheetController=Get.put(AddressBottomSheetController());

  AdvertiserProfileOrderController advertiserProfileController = Get.find();

/*  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);*/
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
      controller: this.widget.scrollController,
        //physics: NeverScrollableScrollPhysics(),
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
                    AdvertisersGenericField(textAlignment: TextAlign.right, obscureText: false, controller: advertiserProfileController.placeNameController, hintText: 'اسم المكان'),
                    SizedBox(height:5.h),
                    AdvertisersFieldWithIcon(textAlignment: TextAlign.right,suffix: SizedBox(
                      width: 25.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Container(height: 40, color: aliColors.AppColors.greyColor,
                          width: 1,),
                        InkWell(
                         /* onTap: (){
                            _goToTheLake();
                          },*/
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset('images/android-locate.svg'),
                          ),
                        ),

                      ],),
                    ), obscureText: false, controller: advertiserProfileController.placeAddressController, hintText: 'عنوان المكان'),
                  ],
                ),
              ),
              SizedBox(height: 5.h,),
              Center(
                child: SizedBox(
                  height: 226.85.h,
                  width: 322.w,
                  child: Obx(()=>GoogleMap(
                    markers: advertiserProfileController.marker.value,
                    onTap: (val){
                      advertiserProfileController.onMapClicked(position:val);
                    },
                    mapType: MapType.terrain,
                    initialCameraPosition: AddressBottomSheet._kGooglePlex,
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                    rotateGesturesEnabled: true,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    onMapCreated: (GoogleMapController googleMapController) {
                      //advertiserProfileController.mapController.complete(controller);
                      if (!advertiserProfileController.mapController.isCompleted) advertiserProfileController.mapController.complete(googleMapController);
                      advertiserProfileController.googleMapController = googleMapController;
                      advertiserProfileController.getLocation();
                    },
                     gestureRecognizers: Set()
                      ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                      ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
                      ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
                      ..add(Factory<VerticalDragGestureRecognizer>(
                              () => VerticalDragGestureRecognizer())),
                  )),
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
                    child: InkWell(
                      onTap: (){
                        advertiserProfileController.onLocationClickedSaved(context);
                      },
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
                  ),
                  Container(
                    width: 135.w,
                    height: 35.h,
                    margin: EdgeInsets.only(right: 10.0.w, left: 10.0.w, top: 20.0.h),
                    child: InkWell(
                      onTap: (){
                        advertiserProfileController.isLocationClickedSaved.value = false;
                        Get.back();
                      },
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
                               'إستعادة',
                            style: TextStyle(
                                fontSize: 16.0.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          ),
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
  @override
  void dispose() {
    // TODO: implement dispose
    if(advertiserProfileController.isLocationClickedSaved.isFalse){
      advertiserProfileController.placeAddressController.text='';
      advertiserProfileController.placeNameController.text='';
      advertiserProfileController.latLng=null;
      advertiserProfileController.marker.value = Set();
    }
    super.dispose();
  }
}
