import 'package:advertisers/app_core/network/models/AddRemoveBlackListModel.dart';
import 'package:advertisers/app_core/network/models/ChannelAndAreasModel.dart';
import 'package:advertisers/app_core/network/models/ChannelAndAreasModel.dart';

import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:json_annotation/json_annotation.dart';
part 'FormChannelsAndAreas.g.dart';

@JsonSerializable()
class FormChannelsAndAreas {
  int? status;
  String? message;
  ChannelAndAreasModel? data;

  FormChannelsAndAreas({
    this.status,
    this.message,
    this.data,
  });

  factory FormChannelsAndAreas.fromJson(Map<String, dynamic> json) =>
      _$FormChannelsAndAreasFromJson(json);

  Map<String, dynamic> toJson() => _$FormChannelsAndAreasToJson(this);
}

