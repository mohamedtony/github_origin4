import 'package:advertisers/app_core/network/models/AdvancedOptionsModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetAdvancedOptionsResponse.g.dart';

@JsonSerializable()
class GetAdvancedOptionsResponse {
  int? status;
  String? message;
  //CreateSubscriptionModel? data;
  AdvancedOptionsModel? data;

  GetAdvancedOptionsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetAdvancedOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAdvancedOptionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAdvancedOptionsResponseToJson(this);
}
