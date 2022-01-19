import 'package:advertisers/app_core/network/models/BlockedUserModel.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/GetCategoryModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'GetCategoriesResponse.g.dart';

@JsonSerializable()
class GetCategoriesResponse {
  int? status;
  String? message;
  GetCategoryModel? data;


  GetCategoriesResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesResponseToJson(this);
}
