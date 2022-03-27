
import 'package:advertisers/app_core/network/models/AdvertiserStatistics.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/SocialsModel.dart';
import 'package:json_annotation/json_annotation.dart';


part 'AdvertiserProfileModel.g.dart';

@JsonSerializable()
class AdvertiserProfileModel {
  int? id;
  String? username,account_name,company_name,manager_name;
  String? role,rate,email,phone,type,gender;
  String? image,added_from,reply_speed;
  int? followers,ads_count;
  List<Channel>? channels;
  bool? is_followed;

  AdvertiserProfileModel({this.id, this.username, this.role,this.image,this.type,this.channels,
    this.rate,this.reply_speed,this.added_from,this.manager_name,this.company_name,this.phone,this.ads_count,this.account_name,this.email,this.followers,this.gender,this.is_followed});

  factory AdvertiserProfileModel.fromJson(Map<String, dynamic> json) => _$AdvertiserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertiserProfileModelToJson(this);
}

