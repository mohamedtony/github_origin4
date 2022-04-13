import 'package:advertisers/app_core/network/models/AddRemoveBlackListModel.dart';
import 'package:advertisers/app_core/network/models/AdsListModel.dart';

import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:json_annotation/json_annotation.dart';
part 'GetAdsListResponse.g.dart';

@JsonSerializable()
class GetAdsListResponse {
  int? status;
  String? message;
  List<AdsListModel>? data;

  GetAdsListResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetAdsListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAdsListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAdsListResponseToJson(this);
}

