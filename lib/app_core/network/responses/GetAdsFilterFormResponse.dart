import 'package:advertisers/app_core/network/models/GetAdsFilterForm.dart';
import 'package:advertisers/app_core/network/models/PaginationModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'GetAdsFilterFormResponse.g.dart';

@JsonSerializable()
class GetAdsFilterFormResponse {
  int? status;
  String? message;
  GetAdsFilterForm? data;
  PaginationModel?pagination;

  GetAdsFilterFormResponse({
    this.status,
    this.message,
    this.data,
    this.pagination
  });

  factory GetAdsFilterFormResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAdsFilterFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAdsFilterFormResponseToJson(this);
}

