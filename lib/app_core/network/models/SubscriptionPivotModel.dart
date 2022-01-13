// import 'package:advertisers/shared/network/models/PeriodModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';


part 'SubscriptionPivotModel.g.dart';

@JsonSerializable()
class SubscriptionPivotModel {
  int? subscription_id;
  int? subscription_setting_id;

  SubscriptionPivotModel({
    this.subscription_id,
    this.subscription_setting_id,
  });

  factory SubscriptionPivotModel.fromJson(Map<String, dynamic> json) => _$SubscriptionPivotModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionPivotModelToJson(this);
}

