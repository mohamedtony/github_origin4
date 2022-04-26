import 'package:json_annotation/json_annotation.dart';
part 'FromUserModel.g.dart';

@JsonSerializable()
class FromUserModel {
  int? id;
  String? username,image;

  FromUserModel({
    this.id,this.username,this.image
  });

  factory FromUserModel.fromJson(Map<String, dynamic> json) => _$FromUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$FromUserModelToJson(this);
}
