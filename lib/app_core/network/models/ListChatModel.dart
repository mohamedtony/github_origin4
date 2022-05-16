import 'package:advertisers/app_core/network/models/FromUserModel.dart';
import 'package:advertisers/app_core/network/models/RepliedMessage.dart';
import 'package:advertisers/app_core/network/models/ToUserModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ListChatModel.g.dart';

@JsonSerializable()
class ListChatModel {
  int? id,not_seen,forward,sent_at_timestamp;
  String? room,sent_at,sent_from;
  String? message_type;
  String? message;
  bool? from_me,starred,uploaded;
  FromUserModel? from_user;
  ToUserModel? to_user;
  RepliedMessage? replied_message;

  ListChatModel({
    this.id,
    this.room,
    this.message_type,this.uploaded,
    this.message,
    this.from_me,this.to_user,this.from_user,
    this.not_seen,
    this.sent_at,this.sent_at_timestamp,
    this.sent_from,this.replied_message,this.starred,this.forward
  });

  factory ListChatModel.fromJson(Map<String, dynamic> json) => _$ListChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListChatModelToJson(this);
}

