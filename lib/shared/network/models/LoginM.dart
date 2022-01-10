

import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';


part 'LoginM.g.dart';

@JsonSerializable()
class LoginM {
  int? id;
  String? username;

  LoginM({
    this.id,
    this.username,

  });

  factory LoginM.fromJson(Map<String, dynamic> json) => _$LoginMFromJson(json);

  Map<String, dynamic> toJson() => _$LoginMToJson(this);
}

