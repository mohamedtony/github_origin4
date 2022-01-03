import 'package:get/get.dart';

class SelectedSocialMedia {
  int? tabIndex = -1;
  RxBool? isTapped = false.obs;
  // SelectedSocialMedia.({ this.tabIndex, this.isTapped});
   changeMyModel(int tabIndex,bool isTapped){
     this.tabIndex = tabIndex;
     this.isTapped!.value = isTapped;
   }
}
