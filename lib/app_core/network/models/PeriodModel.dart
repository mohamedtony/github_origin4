import 'package:json_annotation/json_annotation.dart';
part 'PeriodModel.g.dart';

@JsonSerializable()
class PeriodModel {
  int? id;
  int? subscription_id;
  int? months_count;
  double? price;
  double? price_after_discount;
  int? free_days;
  String? free_txt;
  PeriodModel({
    this.id,
    this.subscription_id,
    this.months_count,
    this.price,
    this.price_after_discount,
    this.free_days,
    this.free_txt
  });

  String itemAsStringByName() {
    return this.months_count.toString()+" أشهر ";
  }
  factory PeriodModel.fromJson(Map<String, dynamic> json) => _$PeriodModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodModelToJson(this);
}

