import 'package:advertisers/features/add_advertiser_channel/add_advertiser_channel.dart';
import 'package:get/get.dart';

class AddAdvertiserChannelController extends GetxController {


  List<int>? checkList = [];
  List<int>? checkCitiesCountriesIds = [];
  List <CitiesCountries> citiesCountriesController = [

  ];

  void addToList (item){
    if(!checkCitiesCountriesIds!.contains(item.id)){
      checkCitiesCountriesIds!.add(item.id);
      citiesCountriesController.add(CitiesCountries(id: item.id,name: item.name));
    }
    update();
  }

  void removeFromList (item){
    citiesCountriesController.remove(item);
    update();
  }

  void addRemoveCheckList(id){
    if(checkList!.contains(id)){
      checkList!.remove(id);
    }else{
      checkList!.add(id);
    }
    update();
  }


  bool isChecked = false;
  void changeChecked(){
    if(isChecked == false){
      isChecked = true;
    }else{
      isChecked = false;
    }
    update();
  }





  @override
  void onClose() {

    super.onClose();
  }
}



