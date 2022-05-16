import 'dart:convert';

import 'package:advertisers/app_core/network/models/FromUserModel.dart';
import 'package:advertisers/app_core/network/models/ListChatModel.dart';
import 'package:advertisers/app_core/network/models/MessageChatModel.dart';
import 'package:advertisers/app_core/network/models/RepliedMessage.dart';
import 'package:advertisers/app_core/network/models/ToUserModel.dart';
import 'package:advertisers/app_core/network/requests/MessageChatModelRequest.dart';
import 'package:advertisers/features/chat/controller/chat_messages_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:map_picker/map_picker.dart';
import 'package:location/location.dart'as location;
import 'package:geocoding/geocoding.dart';
// import 'package:map_pin_picker/map_pin_picker.dart';
class LocationShare extends StatefulWidget {
  LocationShare({required this.latitude,required this.longitude,
    required this.room,required this.fromUserId,required this.toUserId,Key? key}) : super(key: key);
  double latitude=41.311158,longitude=69.279737;
  int fromUserId;
  String toUserId,room;
  @override
  _LocationShareState createState() => _LocationShareState();
}

class _LocationShareState extends State<LocationShare> {
 // ChatMessagesController _chatMessagesController=Get.put(ChatMessagesController());
  ChatMessagesController _chatMessagesController=Get.find();
  final _controller = Completer<GoogleMapController>();
  MapPickerController mapPickerController = MapPickerController();

  late CameraPosition cameraPosition =CameraPosition(
    target: LatLng(widget.latitude, widget.longitude),
    zoom: 14.4746,
  );

  var textController = TextEditingController();
@override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MapPicker(
            // pass icon widget
            iconWidget: SvgPicture.asset(
              "assets/location_icon.svg",
              height: 60,
            ),
            //add map picker controller
            mapPickerController: mapPickerController,
            child: GoogleMap(
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              // hide location button
              myLocationButtonEnabled: true,
              mapType: MapType.normal,
              //  camera position
              initialCameraPosition: cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMoveStarted: () {
                // notify map is moving
                mapPickerController.mapMoving!();
                textController.text = "checking ...";
              },
              onCameraMove: (cameraPosition) {
                this.cameraPosition = cameraPosition;
              },
              onCameraIdle: () async {
                // notify map stopped moving
                mapPickerController.mapFinishedMoving!();
                //get address name from camera position
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude,
                );

                // update the ui with the address
                textController.text =
                '${placemarks.first.name}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}';
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top + 20,
            width: MediaQuery.of(context).size.width - 50,
            height: 50,
            child: TextFormField(
              maxLines: 3,
              textAlign: TextAlign.center,
              readOnly: true,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero, border: InputBorder.none),
              controller: textController,
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: SizedBox(
              height: 50,
              child: TextButton(
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Color(0xFFFFFFFF),
                    fontSize: 19,
                    // height: 19/19,
                  ),
                ),
                onPressed: () {
                  FromUserModel? fromUserModel;
                  ToUserModel? toUserModel;
                  fromUserModel=FromUserModel.fromJson(jsonDecode(Get.parameters["from_user"]??''));
                  toUserModel=ToUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
                  if( _chatMessagesController.replied.value==false){
                    _chatMessagesController.messagesChat.add(ListChatModel(
                        message_type: "location",
                        message: '${widget.latitude}-${widget.longitude}',
                        to_user: toUserModel,
                        from_user: fromUserModel,
                        from_me: true,
                        uploaded: false,
                        room: widget.room, sent_at: DateFormat("dd MMM yyyy hh:mm:ss").format(DateTime.now()) ,//DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()) ,
                        //id:event.));
                        id: int.parse(Get.parameters["id"].toString())));

                  }else {

                    _chatMessagesController
                        .messagesChat.add(
                        ListChatModel(
                            message_type: "location",
                            message: '${widget.latitude}-${widget.longitude}',
                            to_user: toUserModel,
                            from_user: fromUserModel,
                            sent_at: DateFormat("dd MMM yyyy hh:mm:ss").format(DateTime.now()),
                            from_me: true,
                            uploaded: false,
                            room: widget.room,
                            replied_message: RepliedMessage(
                                id: _chatMessagesController
                                    .messagesChat[_chatMessagesController
                                    .chatIndex.value]
                                    .id??0,
                                message: _chatMessagesController
                                    .messagesChat[_chatMessagesController
                                    .chatIndex.value]
                                    .message,
                                message_type: _chatMessagesController
                                    .messagesChat[_chatMessagesController
                                    .chatIndex.value]
                                    .message_type,
                                replied_message: '${widget.latitude}-${widget.longitude}')));

                  }
                  SchedulerBinding.instance?.addPostFrameCallback((_) {
                    _chatMessagesController.itemScrollController?.scrollTo(
                        index: _chatMessagesController.messagesChat.length - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutCubic);

                    // _scrollController.animateTo(_height * index,
                    //     duration: const Duration(seconds: 2), curve: Curves.easeIn);
                  });
                  _chatMessagesController.sendMessage(message:MessageChatModelRequest(room: widget.room,message:'${widget.latitude}-${widget.longitude}',type: "location",
                      from_user_id: widget.fromUserId,
                      to_user_id: widget.toUserId),);
                  Get.back();
                 // print(
                  //     "Location ${cameraPosition.target.latitude} ${cameraPosition.target.longitude}");
                  // print("Address: ${textController.text}");
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFA3080C)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}