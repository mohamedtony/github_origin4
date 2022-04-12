
import 'package:json_annotation/json_annotation.dart';
part 'MessageChatModel.g.dart';

@JsonSerializable()
class MessageChatModel {


  String? to_user_id,message,room;
  String? video,image,type;
 int?from_user_id;
  MessageChatModel({
    this.to_user_id,
    this.message,
    this.room,
    this.video,
    this.from_user_id,
    this.image,
    this.type
  });

  factory MessageChatModel.fromJson(Map<String, dynamic> json) => _$MessageChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageChatModelToJson(this);
}




