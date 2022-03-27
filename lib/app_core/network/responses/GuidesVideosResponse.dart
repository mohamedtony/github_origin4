import 'package:advertisers/app_core/network/models/QuestionModel.dart';
import 'package:advertisers/app_core/network/models/RequestModelData.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:advertisers/app_core/network/models/VideoModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GuidesVideosResponse.g.dart';

@JsonSerializable()
class GuidesVideosResponse {
  int? status;
  String? message;
  List<VideoModel>? data;


  GuidesVideosResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GuidesVideosResponse.fromJson(Map<String, dynamic> json) =>
      _$GuidesVideosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GuidesVideosResponseToJson(this);
}
