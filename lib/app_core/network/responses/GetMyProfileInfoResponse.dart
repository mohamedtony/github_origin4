import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetMyProfileInfoResponse.g.dart';

@JsonSerializable()
class GetMyProfileInfoResponse {
  int? status;
  String? message;
  ClientProfileModel? data;


  GetMyProfileInfoResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetMyProfileInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMyProfileInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyProfileInfoResponseToJson(this);
}
