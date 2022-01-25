import 'package:advertisers/app_core/network/models/CountriesAreasModel.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:advertisers/app_core/network/models/User2.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetUseLocationsResponse.g.dart';

@JsonSerializable()
class GetUseLocationsResponse {
  int? status;
  String? message;
  CountriesAreasModel? data;
  // CreateSubscriptionModel? data;

  GetUseLocationsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetUseLocationsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUseLocationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUseLocationsResponseToJson(this);
}
