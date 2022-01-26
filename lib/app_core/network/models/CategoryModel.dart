import 'package:json_annotation/json_annotation.dart';
part 'CategoryModel.g.dart';

@JsonSerializable()
class CategoryModel {
  int? id;
  String? name;

  String itemAsStringByName() {
    return this.name!;
  }

  CategoryModel({this.id, this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

