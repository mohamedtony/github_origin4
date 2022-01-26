import 'package:advertisers/app_core/network/models/Company.dart';
import 'package:advertisers/app_core/network/models/SettingAdvertiserModel.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SettingsAdvertiserProfileResponse.g.dart';

@JsonSerializable()
class SettingsAdvertiserProfileResponse {
  int? status;
  String? message;
  List<SettingAdvertiserModel>? data;


  SettingsAdvertiserProfileResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SettingsAdvertiserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingsAdvertiserProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsAdvertiserProfileResponseToJson(this);
}
