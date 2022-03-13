import 'package:advertisers/app_core/network/models/BlockedUserModel.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/ReasonModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'GetCancelReasonsResponse.g.dart';

@JsonSerializable()
class GetCancelReasonsResponse {
  int? status;
  String? message;
  List<ReasonModel>? data;


  GetCancelReasonsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetCancelReasonsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCancelReasonsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCancelReasonsResponseToJson(this);
}
