
import 'package:advertisers/app_core/network/models/RepliedMessage.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MessageChatModelRequest.g.dart';

@JsonSerializable()
class MessageChatModelRequest {


  String? to_user_id,message,room;
  String? video,image,type;
  int?from_user_id;
  int? message_id;
  MessageChatModelRequest({
    this.to_user_id,
    this.message,
    this.room,
    this.video,
    this.from_user_id,
    this.image,
    this.type,this.message_id,
  });

  factory MessageChatModelRequest.fromJson(Map<String, dynamic> json) => _$MessageChatModelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MessageChatModelRequestToJson(this);
}




