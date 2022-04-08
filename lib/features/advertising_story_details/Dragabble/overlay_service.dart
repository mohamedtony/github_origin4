import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/videos_overlay_widget.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/videos_title_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverlayService {
  OverlayHandlerProvider overlayHandlerProvider = Get.find();
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
      builder: (context) => VideoTitleOverlayWidget(
        onClear: () {
          overlayHandlerProvider.removeOverlay(context);
        },
        widget: widget,
      ),
    );

    overlayHandlerProvider.insertOverlay(context, overlayEntry);
  }

}