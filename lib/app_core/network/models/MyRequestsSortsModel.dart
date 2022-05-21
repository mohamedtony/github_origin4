
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MyRequestsSortsModel.g.dart';

@JsonSerializable()
class MyRequestsSortsModel {
  String? oldest;
  String? latest;
  String? date;

  MyRequestsSortsModel({this.oldest,this.latest, this.date,});

  factory MyRequestsSortsModel.fromJson(Map<String, dynamic> json) => _$MyRequestsSortsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyRequestsSortsModelToJson(this);
}

