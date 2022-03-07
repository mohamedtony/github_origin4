import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:json_annotation/json_annotation.dart';
part 'CommissionModel.g.dart';

@JsonSerializable()
class CommissionModel {
  int? percentage,value;



  CommissionModel({this.value,this.percentage});

  factory CommissionModel.fromJson(Map<String, dynamic> json) => _$CommissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommissionModelToJson(this);
}

