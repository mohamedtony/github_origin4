

import 'package:json_annotation/json_annotation.dart';

part 'CreateSubscriptionRequest.g.dart';

@JsonSerializable()
class CreateSubscriptionRequest {

  int? period_id;
  String? payment_method;
  int? execute;
  @JsonKey(includeIfNull: false)
  int? copon_id;

  CreateSubscriptionRequest({this.period_id, this.payment_method,this.execute,this.copon_id});

  factory CreateSubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriptionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSubscriptionRequestToJson(this);
}
