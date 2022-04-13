import 'package:advertisers/app_core/network/models/ProfileAdvertiserStopSettings.dart';
import 'package:advertisers/app_core/network/models/ReasonModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'UserAdsList.g.dart';

@JsonSerializable()
class UserAdsList {

  int? id;
  String? username;
  String? image;
  String? address;

  UserAdsList({
    this.id,
    this.username,
    this.image,
    this.address

  });

  factory UserAdsList.fromJson(Map<String, dynamic> json) => _$UserAdsListFromJson(json);

  Map<String, dynamic> toJson() => _$UserAdsListToJson(this);
}

