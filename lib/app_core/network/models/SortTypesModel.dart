import 'package:advertisers/app_core/network/models/PeriodModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';
part 'SortTypesModel.g.dart';

@JsonSerializable()
class SortTypesModel {
  String? reply_speed;
  String? oldest;
  String? latest;
  String? top_rated;
  String? most_ads;
  String? most_followers;
  String? less_folloers;
  SortTypesModel({
    this.reply_speed,
    this.oldest,
    this.latest,
    this.top_rated,
    this.most_ads,
    this.most_followers,
    this.less_folloers,
  });

  factory SortTypesModel.fromJson(Map<String, dynamic> json) => _$SortTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SortTypesModelToJson(this);
}

