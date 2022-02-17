import 'package:advertisers/app_core/network/models/RequestModelData.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'MyRequestsResponse.g.dart';

@JsonSerializable()
class MyRequestsResponse {
  int? status;
  String? message;
  RequestModelData? data;


  MyRequestsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory MyRequestsResponse.fromJson(Map<String, dynamic> json) =>
      _$MyRequestsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyRequestsResponseToJson(this);
}
