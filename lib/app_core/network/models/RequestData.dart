import 'package:advertisers/app_core/network/models/AdvertiserModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'RequestData.g.dart';

@JsonSerializable()
class RequestData {
   int? id;
   AdvertiserModel? advertiser;
  RequestData({
    this.id,this.advertiser
  });

  factory RequestData.fromJson(Map<String, dynamic> json) => _$RequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDataToJson(this);
}

