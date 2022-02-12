import 'package:get/get.dart';

class AdvertiserOrderDetailsController extends GetxController {
  int? firstSeeMore = 2;
  int? secondSeeMore = 2;
  updateSeeMore({required String builderId}) {
    if (builderId == 'First') {
      if (firstSeeMore == 2) {
        firstSeeMore = null;
      } else {
        firstSeeMore = 2;
      }
    } else {
      if (secondSeeMore == 2) {
        secondSeeMore = null;
      } else {
        secondSeeMore = 2;
      }
    }

    update([builderId]);
  }

  int selectedIndex = 0;
  updateSelectedIndex({required String builderId, int mSelectedIndex = 0}) {
    selectedIndex = mSelectedIndex;
    update([builderId]);
  }
}
