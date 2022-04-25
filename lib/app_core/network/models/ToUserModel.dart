import 'package:json_annotation/json_annotation.dart';
part 'ToUserModel.g.dart';

@JsonSerializable()
class ToUserModel {
  int? id;
  String? username,image;

  ToUserModel({
    this.id,this.username,this.image
  });

  factory ToUserModel.fromJson(Map<String, dynamic> json) => _$ToUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ToUserModelToJson(this);
}
