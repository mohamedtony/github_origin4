import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'RegisterClientUserResponse.g.dart';

@JsonSerializable()
class RegisterClientUserResponse {
  int? status;
  String? message;
  User? data;


  RegisterClientUserResponse({
    this.status,
    this.message,
    this.data,
  });

  factory RegisterClientUserResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterClientUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterClientUserResponseToJson(this);
}
