import 'package:advertisers/app_core/network/models/ProfileAdvertiserStopSettings.dart';
import 'package:advertisers/app_core/network/models/ReasonModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ProfileAdvertiserStopSettingsData.g.dart';

@JsonSerializable()
class ProfileAdvertiserStopSettingsData {


  List<ReasonModel>? reasons;
  ProfileAdvertiserStopSettings? settings;

  ProfileAdvertiserStopSettingsData({
    this.reasons,
    this.settings,

  });

  factory ProfileAdvertiserStopSettingsData.fromJson(Map<String, dynamic> json) => _$ProfileAdvertiserStopSettingsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileAdvertiserStopSettingsDataToJson(this);
}

