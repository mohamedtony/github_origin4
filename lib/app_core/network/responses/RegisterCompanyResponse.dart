import 'package:advertisers/app_core/network/models/Company.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'RegisterCompanyResponse.g.dart';

@JsonSerializable()
class RegisterCompanyResponse {
  int? status;
  String? message;
  Company? data;


  RegisterCompanyResponse({
    this.status,
    this.message,
    this.data,
  });

  factory RegisterCompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterCompanyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterCompanyResponseToJson(this);
}
