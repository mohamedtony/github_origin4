import 'package:json_annotation/json_annotation.dart';
part 'DiscountModel.g.dart';

@JsonSerializable()
class DiscountModel {
  String? text;
  int? price;

  DiscountModel({this.text,this.price});

  factory DiscountModel.fromJson(Map<String, dynamic> json) => _$DiscountModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountModelToJson(this);
}

