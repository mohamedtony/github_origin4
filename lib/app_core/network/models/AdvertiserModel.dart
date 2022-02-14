
import 'package:json_annotation/json_annotation.dart';


part 'AdvertiserModel.g.dart';

@JsonSerializable()
class AdvertiserModel {
  int? id;
  String? username;
  String? role;
  String? image;




  AdvertiserModel({this.id, this.username, this.role,this.image});

  factory AdvertiserModel.fromJson(Map<String, dynamic> json) => _$AdvertiserModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertiserModelToJson(this);
}

