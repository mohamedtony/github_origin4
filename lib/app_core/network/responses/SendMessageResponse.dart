
import 'package:advertisers/app_core/network/models/QuestionModel.dart';
import 'package:advertisers/app_core/network/models/RequestModelData.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:advertisers/app_core/network/models/VideoModel.dart';
import 'package:advertisers/app_core/network/models/ListChatModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SendMessageResponse.g.dart';

@JsonSerializable()
class SendMessageResponse {
  int? status;
  String? message;
  Map? data;


  SendMessageResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageResponseToJson(this);
}
