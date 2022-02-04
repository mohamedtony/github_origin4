import 'package:get/get.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class CoponsPageController extends GetxController {
  var isOpend = false;
  var position = -1;
  void changeStatus(bool isOpend,int position) {
    this.isOpend = isOpend;
    this.position = position;
    update();
  }
}