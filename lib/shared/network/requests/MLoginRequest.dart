import 'package:json_annotation/json_annotation.dart';

part 'MLoginRequest.g.dart';

@JsonSerializable()
class MLoginRequest {

  String? phone;
  String? password;
  String? fcm_token;

  MLoginRequest({this.phone, this.password,this.fcm_token});

  factory MLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$MLoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MLoginRequestToJson(this);
}

