import 'package:json_annotation/json_annotation.dart';
part 'MyPointsModel.g.dart';

@JsonSerializable()
class MyPointsModel {
  int? percentage,value;

  MyPointsModel({this.percentage,this.value});

  factory MyPointsModel.fromJson(Map<String, dynamic> json) => _$MyPointsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyPointsModelToJson(this);
}

