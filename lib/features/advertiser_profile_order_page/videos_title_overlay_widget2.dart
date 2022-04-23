import 'package:advertisers/features/advertiser_profile_order_page/overlay_handler2.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class VideoTitleOverlayWidget2 extends StatefulWidget {
  final Function? onClear;
  final Widget? widget;

  VideoTitleOverlayWidget2({this.onClear, this.widget}): assert(widget != null);

  @override
  _VideoTitleOverlayWidgetState createState() => _VideoTitleOverlayWidgetState();
}

class _VideoTitleOverlayWidgetState extends State<VideoTitleOverlayWidget2> {
  OverlayHandlerProvider2 overlayHandlerProvider = Get.find();
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
        height = oldHeight;offset = Offset(0, 0);
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
        width = oldWidth! - 4.0;
        height = Constants.VIDEO_TITLE_HEIGHT_PIP;
        print(oldHeight! - height! - Constants.BOTTOM_PADDING_PIP);
        offset = Offset(2, oldHeight! - height! - Constants.BOTTOM_PADDING_PIP);
//        height = (Constants.VIDEO_HEIGHT_PIP/aspectRatio) + 33;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(width == null || height == null) {
      oldWidth = width = MediaQuery.of(context).size.width;
      oldHeight = height = MediaQuery.of(context).size.height;
    }
   return GetBuilder<OverlayHandlerProvider2>(
      init: overlayHandlerProvider,
      builder: (controller){print("video_overlay_widget ${controller.inPipMode}");
      if(controller.inPipMode != isInPipMode) {
        isInPipMode = controller.inPipMode;
        if (isInPipMode)
          _onPipMode();
        else
          _onExitPipMode();
      }
      print(height);
      return AnimatedPositioned(
        duration: Duration(milliseconds: 150),
        left: offset.dx,
        //top: offset.dy,
        bottom: offset.dy,
        child: Material(
          elevation: isInPipMode ? 5.0 : 0.0,
          child: AnimatedContainer(
            height: overlayHandlerProvider.isHidden?0:height,
            width: width,
            child: widget.widget,
            //margin: EdgeInsets.only(top: 100),
            duration: Duration(milliseconds: 250),
          ),
        ),
      );
      },
    );

  }
}
