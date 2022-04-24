import 'package:advertisers/app_core/network/models/AdvertiserModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'RepliedMessage.g.dart';

@JsonSerializable()
class RepliedMessage {
  
int? id;
String? message_type;
String? message;
String?  sent_at;
String?  sent_from;
String? replied_message;      
  RepliedMessage({
    this.id,this.message_type,this.message,this.replied_message,this.sent_at,this.sent_from
  });

  factory RepliedMessage.fromJson(Map<String, dynamic> json) => _$RepliedMessageFromJson(json);

  Map<String, dynamic> toJson() => _$RepliedMessageToJson(this);
}

