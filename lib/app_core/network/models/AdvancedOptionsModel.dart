import 'package:json_annotation/json_annotation.dart';
part 'AdvancedOptionsModel.g.dart';

@JsonSerializable()
class AdvancedOptionsModel {
  int? chat_in_orders,
  contant_in_orders,
  whatsapp_in_orders,
  chat_out_orders ,
  stop_receiving_orders,
  profile_ads_views,
  profile_followers_count,
  profile_rate,
  profile_reply_speed,
  profile_ads_count,
  profile_manager;

  AdvancedOptionsModel({this.chat_in_orders,this.chat_out_orders,this.contant_in_orders,this.profile_ads_count,this.profile_ads_views,this.profile_followers_count,
  this.profile_manager,this.profile_rate,this.profile_reply_speed,this.stop_receiving_orders,this.whatsapp_in_orders});

  factory AdvancedOptionsModel.fromJson(Map<String, dynamic> json) => _$AdvancedOptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdvancedOptionsModelToJson(this);
}

