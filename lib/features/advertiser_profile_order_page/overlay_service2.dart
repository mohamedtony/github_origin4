import 'package:advertisers/features/advertiser_profile_order_page/overlay_handler2.dart';
import 'package:advertisers/features/advertiser_profile_order_page/videos_title_overlay_widget2.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/videos_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverlayService2 {
  OverlayHandlerProvider2 overlayHandlerProvider = Get.find();
  List<OverlayEntry> overLays = [];
  addVideosOverlay(BuildContext context, Widget widget) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => VideoOverlayWidget(
        onClear: () {
          overlayHandlerProvider.removeOverlay(context);
        },
        widget: widget,
      ),
    );

    overlayHandlerProvider.insertOverlay(context, overlayEntry);
  }
  addVideoTitleOverlay(BuildContext context, Widget widget) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => VideoTitleOverlayWidget2(
        onClear: () {
          overlayHandlerProvider.removeOverlay(context);
        },
        widget: widget,
      ),
    );

    overlayHandlerProvider.insertOverlay(context, overlayEntry);
  }

  addVideoTitleOverlay2(BuildContext context, Widget widget) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => VideoTitleOverlayWidget2(
        onClear: () {
          overlayHandlerProvider.removeOverlay(context);
        },
        widget: widget,
      ),
    );

    overlayHandlerProvider.insertOverlay2(context, overlayEntry);
  }

}