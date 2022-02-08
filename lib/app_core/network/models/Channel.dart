import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Channel.g.dart';

@JsonSerializable()
class Channel {
  int? id;
  String? name;
  int? channel_type;
  String? image;
  @JsonKey(ignore: true)
  var isTapped = false.obs;

  Channel({this.id, this.name, this.image,this.channel_type});

  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}

