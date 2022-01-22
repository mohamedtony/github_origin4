import 'dart:io';

import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'RegisterClientUserRequest.g.dart';

@JsonSerializable()
class RegisterClientUserRequest {

  String? phone,email,role;
  String? username,type;
  @JsonKey(name: 'account_name')
  String? accountName;
  @JsonKey(name: 'personal_id')
  String?    personalId;
  @JsonKey(name: 'country_id')
  String? countryId;
  @JsonKey(name: 'area_id')
  String? areaId;
  String? password;
  //MultipartFile? image;
  @JsonKey(name: 'fcm_token')
  String? fcmToken;

  RegisterClientUserRequest({ this.phone,  this.email, this.accountName, this.areaId, this.countryId, this.fcmToken,
      this.password, this.personalId, this.role, this.type, this.username});

  factory RegisterClientUserRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterClientUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterClientUserRequestToJson(this);
}