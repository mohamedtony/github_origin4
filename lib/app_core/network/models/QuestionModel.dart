import 'package:advertisers/app_core/network/models/ProfileAdvertiserStopSettings.dart';
import 'package:advertisers/app_core/network/models/ReasonModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'QuestionModel.g.dart';

@JsonSerializable()
class QuestionModel {

int? id;
  String? question;
  String? answer;

QuestionModel({
    this.question,
    this.answer,this.id,

  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}

