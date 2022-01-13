

import 'package:json_annotation/json_annotation.dart';

part 'CreateSubscriptionRequest.g.dart';

@JsonSerializable()
class CreateSubscriptionRequest {

  int? period_id;
  String? payment_method;
  int? execute;

  CreateSubscriptionRequest({this.period_id, this.payment_method,this.execute});

  factory CreateSubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriptionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSubscriptionRequestToJson(this);
}
