import 'package:advertisers/app_core/network/models/GetMyRequestsFilterForm.dart';
import 'package:advertisers/app_core/network/models/RequestModelData.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'MyRequestFiltersResponse.g.dart';

@JsonSerializable()
class MyRequestFiltersResponse {
  int? status;
  String? message;
  GetMyRequestsFilterForm? data;


  MyRequestFiltersResponse({
    this.status,
    this.message,
    this.data,
  });

  factory MyRequestFiltersResponse.fromJson(Map<String, dynamic> json) =>
      _$MyRequestFiltersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyRequestFiltersResponseToJson(this);
}
