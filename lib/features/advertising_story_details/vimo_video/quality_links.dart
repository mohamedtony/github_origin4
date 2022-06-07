import 'package:advertisers/app_core/network/models/FileModel.dart';
import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/advertiser_profile_order_page/VideoController2.dart';
import 'package:advertisers/features/advertising_story_details/VideoController.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import "dart:collection";

//throw UnimplementedError();

class QualityLinks {
  String? videoId;

  QualityLinks(this.videoId);

  getQualitiesSync(String type, {int? id}) {
    return getQualitiesAsync(type,id:id);
  }


  Future<SplayTreeMap?> getQualitiesAsync(String type, {int? id}) async {
    try {
      final Uri? vimeoLink =
          Uri.tryParse('https://player.vimeo.com/video/${videoId!}/config');
      var response = await http.get(vimeoLink!);
      var jsonData2 = jsonDecode(response.body)['video']['duration'];
      if(type=="home"){
        VideoController videoGetxController = Get.find();
        videoGetxController.videoDuration = jsonData2;
      }
      if(type=="profile"){
        VideoController2 videoGetxController2 = Get.find();
        videoGetxController2.videoDuration = jsonData2;
      }
      if(type=="advertiser"){
        AdvertisingDetailsController videoGetxController2 = Get.find();

        var jsonData2 = jsonDecode(response.body)['video']['thumbs']['base'];
        print("jsonData2jsonData2= $jsonData2");

        videoGetxController2.attatechedFilesImageAndVideo.add(FileModel(
          videoId: videoId,
            urlVideoLink: jsonData2,
            isVideo:true,
            type:"net",
            id: id!
        ));
      }
      var jsonData =
          jsonDecode(response.body)['request']['files']['progressive'];
      SplayTreeMap videoList = SplayTreeMap.fromIterable(jsonData,
          key: (item) => "${item['quality']} ${item['fps']}",
          value: (item) => item['url']);
      return videoList;
    } catch (error) {
      print('=====> REQUEST ERROR: $error');
      return null;
    }
  }
}
