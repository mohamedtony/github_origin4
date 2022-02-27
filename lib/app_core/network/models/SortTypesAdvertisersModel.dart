import 'package:advertisers/app_core/network/models/PeriodModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';
part 'SortTypesAdvertisersModel.g.dart';

@JsonSerializable()
class SortTypesAdvertisersModel {
  String? reply_speed;
  String? oldest;
  String? latest;
  String? top_rated;
  String? most_ads;
  String? most_followers;
  String? less_followers;
  SortTypesAdvertisersModel({
    this.reply_speed,
    this.oldest,
    this.latest,
    this.top_rated,
    this.most_ads,
    this.most_followers,
    this.less_followers,
  });

  factory SortTypesAdvertisersModel.fromJson(Map<String, dynamic> json) => _$SortTypesAdvertisersModelFromJson(json);

  Map<String, dynamic> toJson() => _$SortTypesAdvertisersModelToJson(this);
}
