
import 'package:advertisers/app_core/network/models/RepliedMessage.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MessageChatModel.g.dart';

@JsonSerializable()
class MessageChatModel {


  String? to_user_id,message,room;
  String? video,image,type;
 int?from_user_id;
 RepliedMessage? replied_message;
  MessageChatModel({
    this.to_user_id,
    this.message,
    this.room,
    this.video,
    this.from_user_id,
    this.image,
    this.type,this.replied_message,
  });

  factory MessageChatModel.fromJson(Map<String, dynamic> json) => _$MessageChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageChatModelToJson(this);
}




