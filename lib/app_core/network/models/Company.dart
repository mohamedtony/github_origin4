


import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';


part 'Company.g.dart';

@JsonSerializable()
class Company {
  int? id;
  String? phone,email,role;
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
  String? image;
  @JsonKey(name: 'blocked_at')
  bool? blockedAt;
  String? token;

  Company({
    this.id,
    this.username,
    this.phone,
    this.email,
    this.type,
    this.role,this.personalId,
    this.password,
    this.image,
    this.countryId,
    this.areaId,
    this.accountName
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

