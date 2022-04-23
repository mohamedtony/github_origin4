import 'package:advertisers/app_core/network/models/AddRemoveBlackListModel.dart';
import 'package:advertisers/app_core/network/models/AdsListModel.dart';

import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:json_annotation/json_annotation.dart';
part 'AdDetailsResponse.g.dart';
@JsonSerializable()
class AdDetailsResponse {
  int? status;
  String? message;
  AdsListModel? data;

  AdDetailsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory AdDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$AdDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdDetailsResponseToJson(this);
}

