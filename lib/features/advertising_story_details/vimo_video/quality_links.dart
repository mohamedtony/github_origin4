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

  getQualitiesSync() {
    return getQualitiesAsync();
  }
  final VideoController videoGetxController = Get.find();

  Future<SplayTreeMap?> getQualitiesAsync() async {
    try {
      final Uri? vimeoLink =
          Uri.tryParse('https://player.vimeo.com/video/${videoId!}/config');
      var response = await http.get(vimeoLink!);
      var jsonData2 = jsonDecode(response.body)['video']['duration'];
      videoGetxController.videoDuration = jsonData2;
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
