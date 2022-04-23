import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AddReplyOnCommentRequest.g.dart';
@JsonSerializable()
class AddReplyOnCommentRequest {

  String? comment;
  int? commentId;

  AddReplyOnCommentRequest(
      {
        this.comment,
        this.commentId,
        });

  AddReplyOnCommentRequest.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    commentId = json['comment_id'];
   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['comment_id'] = this.commentId;
    return data;
  }
}