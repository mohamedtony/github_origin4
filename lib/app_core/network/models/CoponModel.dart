
import 'package:json_annotation/json_annotation.dart';
part 'CoponModel.g.dart';

@JsonSerializable()
class CoponModel {
  int? copon_id;
  double? total;
  double? discount;

  CoponModel({this.copon_id, this.total, this.discount});

  factory CoponModel.fromJson(Map<String, dynamic> json) => _$CoponModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoponModelToJson(this);
}

