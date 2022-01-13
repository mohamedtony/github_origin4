import 'package:advertisers/shared/network/models/PeriodModel.dart';
import 'package:advertisers/shared/network/models/SubscriptionBaka.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';


part 'CreateSubscriptionModel.g.dart';

@JsonSerializable()
class CreateSubscriptionModel {
  SubscriptionBaka? subscription;
  PeriodModel? period;
  double? total;
  double? added_tax;
  double? discount;

  CreateSubscriptionModel({
    this.subscription,
    this.period,
    this.total,
    this.added_tax,
    this.discount,
  });

  factory CreateSubscriptionModel.fromJson(Map<String, dynamic> json) => _$CreateSubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSubscriptionModelToJson(this);
}

