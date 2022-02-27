import 'package:json_annotation/json_annotation.dart';
part 'AddedTax.g.dart';

@JsonSerializable()
class AddedTax {
  int? percentage,value;

  AddedTax({this.percentage,this.value});

  factory AddedTax.fromJson(Map<String, dynamic> json) => _$AddedTaxFromJson(json);

  Map<String, dynamic> toJson() => _$AddedTaxToJson(this);
}

