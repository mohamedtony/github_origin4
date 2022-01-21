import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ChannelAndArea.g.dart';

@JsonSerializable()
class ChannelAndArea {

  List<Channel>? channels;
  List<Area>? areas;

  ChannelAndArea({this.channels, this.areas});

  factory ChannelAndArea.fromJson(Map<String, dynamic> json) => _$ChannelAndAreaFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelAndAreaToJson(this);
}

