import 'package:advertisers/app_core/network/models/BlockedUserModel.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersModel.dart';
import 'package:advertisers/app_core/network/models/PaginationModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'GetAdvertisersResponse.g.dart';

@JsonSerializable()
class GetAdvertisersResponse {
  int? status;
  String? message;
  List<GetAdvertisersModel>? data;
  PaginationModel? pagination;

  GetAdvertisersResponse({
    this.status,
    this.message,
    this.data,
    this.pagination
  });

  factory GetAdvertisersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAdvertisersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAdvertisersResponseToJson(this);
}
