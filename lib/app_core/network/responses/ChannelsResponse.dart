import 'package:advertisers/app_core/network/models/AddRemoveBlackListModel.dart';

import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ChannelsResponse.g.dart';

@JsonSerializable()
class ChannelsResponse {
  int? status;
  String? message;
  List<ChannelData>? data;

  ChannelsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ChannelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelsResponseToJson(this);
}

