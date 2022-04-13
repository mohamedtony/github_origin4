import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverlayHandlerProvider  extends GetxController{

   OverlayEntry? overlayEntry;
  double _aspectRatio = 1.77;
  bool inPipMode = false;
  bool isHidden =true;

  enablePip(double aspect) {
    inPipMode = true;
    _aspectRatio = aspect;
    print("$inPipMode enablePip");
    update();
  }

  disablePip() {
    inPipMode = false;
    print("$inPipMode disablePip");
    update();
  }

  get overlayActive => overlayEntry != null;
  get aspectRatio => _aspectRatio;

  insertOverlay(BuildContext context, OverlayEntry overlay) {
    if(overlayEntry != null) {
      overlayEntry?.remove();
    }
    overlayEntry = null;
    inPipMode = false;
    Overlay.of(context,/*rootOverlay: true,*/)?.insert(overlay);
    overlayEntry = overlay;
  }
   insertOverlay2(BuildContext context, OverlayEntry overlay) {
     /*if(overlayEntry != null) {
       overlayEntry?.remove();
     }
     overlayEntry = null;
     inPipMode = false;*/

     Overlay.of(context)?.insert(/*overlayEntry!,above:*/ overlay,above: overlayEntry);

     //overlayEntry = overlay;
   }

  removeOverlay(BuildContext context) {
    if(overlayEntry != null) {
      overlayEntry?.remove();
    }
    overlayEntry = null;
  }

  void updateHidden(bool bool) {
    isHidden = bool;
    update();
  }

}