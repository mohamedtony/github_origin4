import 'package:advertisers/app_core/network/models/User.dart';
import 'package:advertisers/app_core/network/models/User2.dart';
import 'package:json_annotation/json_annotation.dart';

part 'LoginClientResponse.g.dart';

@JsonSerializable()
class LoginClientResponse {
  int? status;
  String? message;
  User? data;
  CreateSubscriptionModel? data;

  LoginClientResponse({
    this.status,
    this.message,
    this.data,
  });

  factory LoginClientResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginClientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginClientResponseToJson(this);
}
