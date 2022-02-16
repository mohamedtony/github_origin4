import 'package:advertisers/app_core/network/models/BlockedUserModel.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersFromModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'GetAdvertisersFormResponse.g.dart';
@JsonSerializable()
class GetAdvertisersFormResponse {
  int? status;
  String? message;
 GetAdvertisersFromModel? data;


  GetAdvertisersFormResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetAdvertisersFormResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAdvertisersFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAdvertisersFormResponseToJson(this);
}
