import 'package:advertisers/features/advertising_influence_channels/controller/advertising_influence_channels_controller.dart';
import 'package:advertisers/features/advertising_influence_channels/view/widgets/advertising_influence_channels_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AdvertisingInfluenceChannelsPageListWidget extends StatelessWidget {
  // int? id;
  // bool? isChecked;
  // String? socialTitle,iconUrl,minFollower,maxFollower,men,women,boys,girls;
   AdvertisingInfluenceChannelsPageListWidget({Key? key}) : super(key: key);
   AdvertisingInfluenceChannelsController controller=Get.put(AdvertisingInfluenceChannelsController(),permanent: false);

   @override
  Widget build(BuildContext context) {
    return Obx(()=>ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: Get.find<AdvertisingInfluenceChannelsController>().channels.length,
        itemBuilder: (context, index) {
          return  Container(
            padding: EdgeInsets.only(bottom: 12),
            child: AdvertisingInfluenceChannelsPageWidget(
              advertisingChannels: Get.find<AdvertisingInfluenceChannelsController>().channels[index],
              index: index,
            ),
            );
        }));
  }
}



// class AdvertisingChannel {
//   int? id;
//   bool? isChecked;
//   String? socialTitle,iconUrl,minFollower,maxFollower,men,women,boys,girls;
//   AdvertisingChannel({
//     this.id,this.isChecked,this.boys,this.girls,this.iconUrl,this.maxFollower,this.men,this.minFollower,this.socialTitle,this.women
//   });
// }
//
// List <AdvertisingChannel> advertisingChannels = [
//   AdvertisingChannel(
//       id: 1,
//       boys: "70 % شباب",
//       maxFollower: "2500000",
//       girls: "70 % فتيات",
//       men: "70 % رجال",
//       women: "70 % نساء",
//       iconUrl: "images/snapshat_icon.png",
//       isChecked: true,
//       minFollower: "1000000",
//       socialTitle: "Snapchat .com / gdshh"
//   ),
//   AdvertisingChannel(
//       id: 2,
//       boys: "70 % شباب",
//       maxFollower: "2500000",
//       girls: "70 % فتيات",
//       men: "70 % رجال",
//       women: "70 % نساء",
//       iconUrl: "images/snapshat_icon.png",
//       isChecked: false,
//       minFollower: "1000000",
//       socialTitle: "Snapchat .com / gdshh"
//   ),
//   AdvertisingChannel(
//       id: 3,
//       boys: "70 % شباب",
//       maxFollower: "2500000",
//       girls: "70 % فتيات",
//       men: "70 % رجال",
//       women: "70 % نساء",
//       iconUrl: "images/snapshat_icon.png",
//       isChecked: false,
//       minFollower: "1000000",
//       socialTitle: "Snapchat .com / gdshh"
//   ),
// ];