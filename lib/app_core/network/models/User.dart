


import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';


part 'User.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? phone,email,role,image;
  String? username,type;
  @JsonKey(name: 'account_name')
  String? accountName;
  @JsonKey(name: 'personal_id')
  String?    personalId;
  @JsonKey(name: 'country_id')
  int? countryId;
  @JsonKey(name: 'area_id')
  int? areaId;
  String? password;
 // MultipartFile? image;
  @JsonKey(name: 'blocked_at')
  bool? blockedAt;
  String? token;
  String? sgl;
  User({
    this.id,
    this.username,this.image,
    this.phone,
    this.email,
    this.type,
    this.role,this.personalId,
    this.password,
    this.sgl,
    this.countryId,
    this.areaId,
    this.accountName
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

