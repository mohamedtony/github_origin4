import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ChannelData.g.dart';

@JsonSerializable()
class ChannelData {
  int? id,user_id,channel_id;
  String? name;
  String? link;
  String? type;
  int? followers_from,followers_to,men,women,boys,girls;
  List<Area>? areas;
  int? status;
  Channel? channel;


  ChannelData({this.type,this.id, this.name,this.followers_to,this.followers_from,this.status,this.areas,this.boys,this.girls,this.link,this.men,this.women,this.channel});

  factory ChannelData.fromJson(Map<String, dynamic> json) => _$ChannelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelDataToJson(this);
}

