import 'package:advertisers/app_core/network/models/BlockedUserModel.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/GetCategoryModel.dart';
import 'package:advertisers/app_core/network/requests/GetGallaryRequestFilter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'GetGalleryFilterResponse.g.dart';

@JsonSerializable()
class GetGalleryFilterResponse {
  int? status;
  String? message;
  GetGallaryRequestFilter? data;


  GetGalleryFilterResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetGalleryFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGalleryFilterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetGalleryFilterResponseToJson(this);
}
