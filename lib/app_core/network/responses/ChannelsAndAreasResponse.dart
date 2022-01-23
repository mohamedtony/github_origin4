import 'package:advertisers/app_core/network/models/AddRemoveBlackListModel.dart';
import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/ChannelAndArea.dart';

import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ChannelsAndAreasResponse.g.dart';

@JsonSerializable()
class ChannelsAndAreasResponse {
  int? status;
  String? message;
  ChannelAndArea? data;
  ChannelsAndAreasResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ChannelsAndAreasResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelsAndAreasResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelsAndAreasResponseToJson(this);
}

