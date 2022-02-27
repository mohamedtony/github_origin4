import 'package:advertisers/app_core/network/models/RequestData.dart';
import 'package:advertisers/app_core/network/models/RequestModelData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CreateAdvertiseRequestResponse.g.dart';

@JsonSerializable()
class CreateAdvertiseRequestResponse {
  int? status;
  String? message;
  //CreateSubscriptionModel? data;
  RequestData? data;

  CreateAdvertiseRequestResponse({
    this.status,
    this.message,
    this.data,
  });

  factory CreateAdvertiseRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAdvertiseRequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAdvertiseRequestResponseToJson(this);
}
