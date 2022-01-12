
import 'package:advertisers/shared/network/models/Area.dart';
import 'package:advertisers/shared/network/models/Country.dart';
import 'package:advertisers/shared/network/models/LoginM.dart';
import 'package:json_annotation/json_annotation.dart';
part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse {
  int? status;
  String? message;
  LoginM? data;

  LoginResponse({
    this.status,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

