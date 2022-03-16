import 'package:advertisers/app_core/network/models/PartenerModel.dart';
import 'package:advertisers/app_core/network/models/QuestionModel.dart';
import 'package:advertisers/app_core/network/models/RequestModelData.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PartenersSuccessResponse.g.dart';

@JsonSerializable()
class PartenersSuccessResponse {
  int? status;
  String? message;
  List<PartnerModel>? data;


  PartenersSuccessResponse({
    this.status,
    this.message,
    this.data,
  });

  factory PartenersSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$PartenersSuccessResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PartenersSuccessResponseToJson(this);
}
