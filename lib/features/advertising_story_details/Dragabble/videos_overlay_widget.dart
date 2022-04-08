import 'package:advertisers/features/advertising_story_details/Dragabble/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drag/drag_custom.dart' as dc;
import 'overlay_handler.dart';

class VideoOverlayWidget extends StatefulWidget {
  final Function? onClear;
  final Widget? widget;

  VideoOverlayWidget({this.onClear, this.widget}): assert(widget != null);

  @override
  _VideoOverlayWidgetState createState() => _VideoOverlayWidgetState();
}

class _VideoOverlayWidgetState extends State<VideoOverlayWidget> {
  OverlayHandlerProvider overlayHandlerProvider = Get.find();

  double? width;
  double? oldWidth;
  double? oldHeight;
  double? height;

  bool isInPipMode = false;

  Offset offset = Offset(0, 0);

  Widget? player;

  _onExitPipMode() {
    Future.microtask(() {
      setState(() {
        isInPipMode = false;
        width = oldWidth;
        height = oldHeight;
        offset = Offset(0, 0);
      });
    });
    Future.delayed(Duration(milliseconds: 250), () {
      overlayHandlerProvider.disablePip();
    });
  }

  _onPipMode() {
    double aspectRatio = overlayHandlerProvider.aspectRatio;

    print("true   $aspectRatio");
//    Provider.of<OverlayHandlerProvider>(context, listen: false).enablePip();
    Future.delayed(Duration(milliseconds: 100), () {
      print("true   Future.microtask");

      setState(() {
        isInPipMode = true;
        width = Constants.VIDEO_HEIGHT_PIP;
        height = (Constants.VIDEO_HEIGHT_PIP/aspectRatio) + 33;
        offset = Offset(oldWidth! - width!, oldHeight! - height! - Constants.BOTTOM_PADDING_PIP);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(width == null || height == null) {
      oldWidth = width = MediaQuery.of(context).size.width;
      oldHeight = height = MediaQuery.of(context).size.height;
    }
    return GetBuilder<OverlayHandlerProvider>(
      init: overlayHandlerProvider,
      builder: (controller){

        print("video_overlay_widget ${controller.inPipMode}");
        if(controller.inPipMode != isInPipMode) {
          isInPipMode = controller.inPipMode;
          if (isInPipMode)
            _onPipMode();
          else
            _onExitPipMode();
        }
        return AnimatedPositioned(
          duration: Duration(milliseconds: 150),
          left: offset.dx,
          top: offset.dy,
          child: Draggable(
            feedback: Container(),
            onDragStarted: () {
              print("onDragStarted");
            },
            onDragUpdate: (off) {
             /* if(!isInPipMode) return;
              if (off.dx >= 0 &&
                  off.dx < (oldWidth! - Constants.VIDEO_HEIGHT_PIP) &&
                  off.dy >= 48.0 &&
                  off.dy < (oldHeight! - Constants.VIDEO_HEIGHT_PIP -Constants.BOTTOM_PADDING_PIP)) {
//            print("Inside DragUpdate If");
                setState(() {
                  offset = off;
                });
              }*/
            },
            onDragEnd: (DraggableDetails details) {
              print("onDragEnd");
              if (details.velocity.pixelsPerSecond.dx < -1000) {
                if (widget.onClear != null) widget.onClear!();
              }
            },
            child: AnimatedContainer(
              height: height,
              width: width,
              child: widget.widget,
              duration: Duration(milliseconds: 250),
            ),
          ),
        );
      },
    );
  }
}
