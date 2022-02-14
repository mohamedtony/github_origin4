import 'package:json_annotation/json_annotation.dart';
part 'ProfileAdvertiserStopSettings.g.dart';

@JsonSerializable()
class ProfileAdvertiserStopSettings {
  
 
 String? stop_account;
  String? stop_reason_id;
  String? stop_from;
  String? stop_to;
  String? stop_text;

  ProfileAdvertiserStopSettings({
    this.stop_account,
    this.stop_from,
    this.stop_to,
    this.stop_text,
  });

  factory ProfileAdvertiserStopSettings.fromJson(Map<String, dynamic> json) => _$ProfileAdvertiserStopSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileAdvertiserStopSettingsToJson(this);
}

