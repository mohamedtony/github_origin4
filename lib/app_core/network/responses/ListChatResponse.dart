
import 'package:advertisers/app_core/network/models/QuestionModel.dart';
import 'package:advertisers/app_core/network/models/RequestModelData.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:advertisers/app_core/network/models/VideoModel.dart';
import 'package:advertisers/app_core/network/models/ListChatModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ListChatResponse.g.dart';

@JsonSerializable()
class ListChatResponse {
  int? status;
  String? message;
  List<ListChatModel>? data;


  ListChatResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ListChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListChatResponseToJson(this);
}
