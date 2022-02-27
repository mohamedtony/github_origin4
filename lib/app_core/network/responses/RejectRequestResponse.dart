import 'package:advertisers/app_core/network/models/Company.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'RejectRequestResponse.g.dart';

@JsonSerializable()
class RejectRequestResponse {
  int? status;
  String? message;
  ReasonDataModel? data;


  RejectRequestResponse({
    this.status,
    this.message,
    this.data,
  });

  factory RejectRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$RejectRequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RejectRequestResponseToJson(this);
}
