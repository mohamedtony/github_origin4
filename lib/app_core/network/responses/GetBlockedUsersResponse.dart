import 'package:advertisers/app_core/network/models/BlockedUserModel.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'GetBlockedUsersResponse.g.dart';

@JsonSerializable()
class GetBlockedUsersResponse {
  int? status;
  String? message;
  List<BlockedUserModel>? data;


  GetBlockedUsersResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetBlockedUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBlockedUsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBlockedUsersResponseToJson(this);
}
