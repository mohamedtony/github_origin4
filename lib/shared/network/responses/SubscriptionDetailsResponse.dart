import 'package:advertisers/shared/network/models/Area.dart';
import 'package:advertisers/shared/network/models/Country.dart';
import 'package:advertisers/shared/network/models/SubscriptionBaka.dart';
import 'package:advertisers/shared/network/models/SubscriptionDetail.dart';
import 'package:advertisers/shared/network/models/SubscriptionSettingsModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'SubscriptionDetailsResponse.g.dart';

@JsonSerializable()
class SubscriptionDetailsResponse {
  int? status;
  String? message;
  SubscriptionDetail? data;

  SubscriptionDetailsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SubscriptionDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionDetailsResponseToJson(this);
}

