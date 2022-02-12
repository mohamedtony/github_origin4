// import 'package:advertisers/shared/network/models/PeriodModel.dart';
// import 'package:advertisers/shared/network/models/SubscriptionPivotModel.dart';
import 'package:advertisers/app_core/network/models/SubscriptionPivotModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';


part 'SubscriptionSettingsModel.g.dart';

@JsonSerializable()
class SubscriptionSettingsModel {
  int? id;
  String? name;
  String? key;
  String?value;
  String? group;
  SubscriptionPivotModel? pivot;

  SubscriptionSettingsModel({
    this.id,
    this.name,
    this.key,
    this.group,
    this.pivot,
    this.value
  });

  factory SubscriptionSettingsModel.fromJson(Map<String, dynamic> json) => _$SubscriptionSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionSettingsModelToJson(this);
}

