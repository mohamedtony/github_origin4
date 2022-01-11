import 'package:advertisers/shared/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CreateSubscriptionResponse.g.dart';

@JsonSerializable()
class CreateSubscriptionResponse {
  int? status;
  String? message;
  User? data;


  CreateSubscriptionResponse({
    this.status,
    this.message,
    this.data,
  });

  factory CreateSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSubscriptionResponseToJson(this);
}
