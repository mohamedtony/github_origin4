import 'dart:io';

import 'package:advertisers/features/home_page/model/SelectedSocialMedia.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AttatchementPageController extends GetxController {
  RxList<SelectedSocialMedia> items = <SelectedSocialMedia>[].obs;
  final ImagePicker _picker = ImagePicker();
  var realImages =[].obs;
  List<XFile>? images2;
  List<String> images=['images/snapshat_icon.png','images/instegram.png',
    'images/twitter.png','images/youtube.png','images/facebook.png','images/whatsup.png',];
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
  }

  void deleteImage(int index){
    realImages?.removeAt(index);
  }
  Future<void> pickImages() async {
    images2 = await _picker.pickMultiImage();
    if(images2!=null && images2!.isNotEmpty){
      print("imagemm"+images2.toString());
      realImages.clear();
      images2?.forEach((element) {
        realImages.add(File(element.path));
      });
    }

  }
}
