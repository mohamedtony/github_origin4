import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AddCommentRequest.g.dart';
@JsonSerializable()
class AddCommentRequest {

  String? comment;
  int? clientId;

  AddCommentRequest(
      {
        this.comment,
        this.clientId,
        });

  AddCommentRequest.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    clientId = json['client_id'];
   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['client_id'] = this.clientId;
    return data;
  }
}