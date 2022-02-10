// import 'package:advertisers/shared/network/models/PeriodModel.dart';
// import 'package:advertisers/shared/network/models/SubscriptionPivotModel.dart';
// import 'package:advertisers/shared/network/models/SubscriptionSettingsModel.dart';
import 'package:advertisers/app_core/network/models/PeriodModel.dart';
import 'package:advertisers/app_core/network/models/SubscriptionSettingsModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';


part 'SubscriptionDetail.g.dart';

@JsonSerializable()
class SubscriptionDetail {
  int? id;
  String? name;
  double? commission;
  String? image;
  int? subscribers_count;
  PeriodModel? first_period;
  List<SubscriptionSettingsModel>? settings;
  List<PeriodModel>? periods;
  String? free_txt;


  SubscriptionDetail({
    this.id,
    this.name,
    this.commission,
    this.subscribers_count,
    this.image,
    this.settings,
    this.periods,
    this.first_period,
    this.free_txt
  });

  factory SubscriptionDetail.fromJson(Map<String, dynamic> json) => _$SubscriptionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionDetailToJson(this);
}

