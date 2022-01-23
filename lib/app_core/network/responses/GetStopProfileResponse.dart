import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/ProfileAdvertiserStopSettingsData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetStopProfileResponse.g.dart';

@JsonSerializable()
class GetStopProfileResponse {
  int? status;
  String? message;
  ProfileAdvertiserStopSettingsData? data;


  GetStopProfileResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetStopProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStopProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetStopProfileResponseToJson(this);
}
