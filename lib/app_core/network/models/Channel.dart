import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Channel.g.dart';

@JsonSerializable()
class Channel {
  int? id;
  String? name;
  int? channel_type;
  String? image;


  Channel({this.id, this.name, this.image,this.channel_type});

  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}

