import 'package:advertisers/app_core/network/models/Country.dart';
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
  bool?is_liked;
  bool?in_blacklist;
  String? rate;
  bool?is_ads_in_front;
  bool?is_notified_user;
  Country?country;
  String? time_ago;


  UserAdsList({
    this.id,
    this.username,
    this.image,
    this.address,
    this.is_liked,this.time_ago,this.in_blacklist,this.country,this.rate,this.is_ads_in_front,this.is_notified_user

  });

  factory UserAdsList.fromJson(Map<String, dynamic> json) => _$UserAdsListFromJson(json);

  Map<String, dynamic> toJson() => _$UserAdsListToJson(this);
}

