import 'package:json_annotation/json_annotation.dart';
part 'Item.g.dart';

@JsonSerializable()
class Item {
  String? text;
  int? price;

  Item({this.text,this.price});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

