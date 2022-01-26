// import 'package:advertisers/shared/network/models/Area.dart';
// import 'package:advertisers/shared/network/models/Country.dart';
// import 'package:advertisers/shared/network/models/SubscriptionBaka.dart';
import 'package:advertisers/app_core/network/models/SubscriptionBaka.dart';
import 'package:advertisers/app_core/network/models/TaxSettingsModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'TaxSettingsResponse.g.dart';

@JsonSerializable()
class TaxSettingsResponse {
  int? status;
  String? message;
  TaxSettingsModel? data;

  TaxSettingsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory TaxSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$TaxSettingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaxSettingsResponseToJson(this);
}

