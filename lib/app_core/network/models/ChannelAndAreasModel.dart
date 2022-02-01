import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ChannelAndAreasModel.g.dart';

@JsonSerializable()
class ChannelAndAreasModel {

  List<Channel>? channels;
  List<Area>? areas;


  ChannelAndAreasModel({this.channels, this.areas});

  factory ChannelAndAreasModel.fromJson(Map<String, dynamic> json) => _$ChannelAndAreasModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelAndAreasModelToJson(this);
}

