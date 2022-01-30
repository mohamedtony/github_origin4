import 'package:advertisers/features/home_page/model/SelectedSocialMedia.dart';
import 'package:get/get.dart';

class FindOrderAdvertisersController extends GetxController {
  RxList<SelectedSocialMedia> items = <SelectedSocialMedia>[].obs;

  List<String> images=['الاسرع ردا','الاقدم','الاعلى تقييما','الاعلى تقييما','الاعلى تقييما'];
  @override
  void onInit() {
    // TODO: implement onInit
    SelectedSocialMedia selectedSocialMedia =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia);
    SelectedSocialMedia selectedSocialMedia1 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia1);
    SelectedSocialMedia selectedSocialMedia2 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia2);
    SelectedSocialMedia selectedSocialMedia3 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia3);
    SelectedSocialMedia selectedSocialMedia4 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia4);
    SelectedSocialMedia selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    super.onInit();

  }
  void changeTabIndex(int indexCome,bool isTap) {
    if(items.value[indexCome].isTapped!.value==true){
      items.value[indexCome].isTapped!.value=false;
    }else{
      items.value[indexCome].isTapped!.value=true;
    }

    /*int index  = items.value.indexWhere((element) => element.tabIndex==indexCome);
    //items.value[index];
    if(index!=null) {
      items.value.removeWhere((element) =>
      element.tabIndex == index && element.isTapped);
    }else{
      items.value.add(SelectedSocialMedia(tabIndex: indexCome, isTapped: true));
    }*/
    // update();
  }
}
