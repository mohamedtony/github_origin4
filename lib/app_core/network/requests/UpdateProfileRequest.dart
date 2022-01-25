import 'package:json_annotation/json_annotation.dart';

part 'UpdateProfileRequest.g.dart';

@JsonSerializable()
class UpdateProfileRequest {

  String?username;
  String?role;
  String?type;
  String?account_name;
  String?phone;
  String?email;
  String?personal_id;
  int? country_id;
  int? area_id;
  @JsonKey(includeIfNull: false)
  String? password;
  @JsonKey(includeIfNull: false)
  String? fcm_token;
  @JsonKey(includeIfNull: false)
  int? chat;




  UpdateProfileRequest({this.phone,this.username,this.type,this.role,this.chat,this.area_id,this.country_id,this.personal_id,this.email,this.account_name,this.fcm_token,this.password});

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}