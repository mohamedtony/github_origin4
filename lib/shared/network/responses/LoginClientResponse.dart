import 'package:advertisers/shared/network/models/CreateSubscriptionModel.dart';
import 'package:advertisers/shared/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'LoginClientResponse.g.dart';

@JsonSerializable()
class LoginClientResponse {
  int? status;
  String? message;
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
