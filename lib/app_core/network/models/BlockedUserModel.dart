import 'package:json_annotation/json_annotation.dart';


part 'BlockedUserModel.g.dart';

@JsonSerializable()
class BlockedUserModel {
  int? id;
  String? username;
  String? image;
  bool? chat;


  BlockedUserModel({this.id, this.username, this.image,this.chat});

  factory BlockedUserModel.fromJson(Map<String, dynamic> json) => _$BlockedUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlockedUserModelToJson(this);
}

