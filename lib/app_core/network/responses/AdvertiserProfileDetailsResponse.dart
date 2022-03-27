import 'package:advertisers/app_core/network/models/AdvertiserProfileModel.dart';
import 'package:advertisers/app_core/network/models/ChannelAndArea.dart';
import 'package:json_annotation/json_annotation.dart';
part 'AdvertiserProfileDetailsResponse.g.dart';

@JsonSerializable()
class AdvertiserProfileDetailsResponse {
  int? status;
  String? message;
  AdvertiserProfileModel? data;
  AdvertiserProfileDetailsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory AdvertiserProfileDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$AdvertiserProfileDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertiserProfileDetailsResponseToJson(this);
}

