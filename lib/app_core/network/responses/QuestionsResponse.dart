import 'package:advertisers/app_core/network/models/QuestionModel.dart';
import 'package:advertisers/app_core/network/models/RequestModelData.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'QuestionsResponse.g.dart';

@JsonSerializable()
class QuestionsResponse {
  int? status;
  String? message;
  List<QuestionModel>? data;


  QuestionsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}
