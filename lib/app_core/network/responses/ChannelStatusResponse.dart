import 'package:advertisers/app_core/network/models/AddRemoveBlackListModel.dart';

import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:advertisers/app_core/network/models/StatusChannelModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ChannelStatusResponse.g.dart';

@JsonSerializable()
class ChannelStatusResponse {
  int? status;
  String? message;
  StatusChannelModel? data;

  ChannelStatusResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ChannelStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelStatusResponseToJson(this);
}

