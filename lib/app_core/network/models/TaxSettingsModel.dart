// import 'package:advertisers/shared/network/models/PeriodModel.dart';
// import 'package:advertisers/shared/network/models/SubscriptionPivotModel.dart';
import 'package:advertisers/app_core/network/models/SubscriptionPivotModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';


part 'TaxSettingsModel.g.dart';

@JsonSerializable()
class TaxSettingsModel {
  int? tax_enable;
  int? tax_number;

  TaxSettingsModel({
    this.tax_enable,this.tax_number
  });

  factory TaxSettingsModel.fromJson(Map<String, dynamic> json) => _$TaxSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaxSettingsModelToJson(this);
}

