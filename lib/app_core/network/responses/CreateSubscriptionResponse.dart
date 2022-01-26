import 'package:json_annotation/json_annotation.dart';

part 'CreateSubscriptionResponse.g.dart';

@JsonSerializable()
class CreateSubscriptionResponse {
  int? status;
  String? message;
  //CreateSubscriptionModel? data;
  dynamic data;

  CreateSubscriptionResponse({
    this.status,
    this.message,
    this.data,
  });

  factory CreateSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSubscriptionResponseToJson(this);
}
