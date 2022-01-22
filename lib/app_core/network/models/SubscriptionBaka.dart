//import 'package:advertisers/shared/network/models/PeriodModel.dart';
import 'package:advertisers/app_core/network/models/PeriodModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';


part 'SubscriptionBaka.g.dart';

@JsonSerializable()
class SubscriptionBaka {
  int? id;
  String? name;
  double? commission;
  String? image;
  int? subscribers_count;
  PeriodModel? first_period;
  SubscriptionBaka({
    this.id,
    this.name,
    this.commission,
    this.subscribers_count,
    this.image,
    this.first_period
  });

  factory SubscriptionBaka.fromJson(Map<String, dynamic> json) => _$SubscriptionBakaFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionBakaToJson(this);
}

