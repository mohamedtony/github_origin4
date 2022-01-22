// import 'package:advertisers/shared/network/models/Area.dart';
// import 'package:advertisers/shared/network/models/Country.dart';
// import 'package:advertisers/shared/network/models/SubscriptionBaka.dart';
import 'package:advertisers/app_core/network/models/SubscriptionBaka.dart';
import 'package:json_annotation/json_annotation.dart';
part 'SubscruptionResponse.g.dart';

@JsonSerializable()
class SubscruptionResponse {
  int? status;
  String? message;
  List<SubscriptionBaka>? data;

  SubscruptionResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SubscruptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscruptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscruptionResponseToJson(this);
}

