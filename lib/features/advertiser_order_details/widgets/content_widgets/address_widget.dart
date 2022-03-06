import 'dart:async';

import 'package:advertisers/app_core/network/responses/AdvertiserOrderDetailsResponse.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressWidget extends StatelessWidget {

  Address address=Address();
  AddressWidget({Key? key,required this.address}) : super(key: key);


  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target:  LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  final Completer<GoogleMapController> _controller = Completer();



  @override
  Widget build(BuildContext context) {
    return Content(
      // hasNote: false,
      title: address.address??'عنوان موقع الاعلان',
      iconUrl: 'images/map_marker.png',
      child:               Center(
        child: SizedBox(
          height: 300,
          // width: 322.w,
          child: GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: LatLng(double.parse("${address.lat}"), double.parse("${address.lng}")),//LatLng(37.42796133580664, -122.085749655962),
              zoom: 14.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ),
    );
  }
}
