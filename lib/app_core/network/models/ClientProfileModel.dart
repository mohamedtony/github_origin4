import 'package:advertisers/app_core/network/models/CountryWithFlag.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ClientProfileModel.g.dart';

@JsonSerializable()
class ClientProfileModel {
  int? id;
  String? username;
  String? account_name;
  String? manager_name;
  CountryWithFlag? country;
  String? personal_id;
  String? email;
  String? phone;
  String? type;
  String? role;
  int? profile_completion;
  String? image;
  bool? blocked_at;
  int? country_id;
  int? area_id;
  String? token;
  bool? chat;
  int? followers;
  String?reply_speed;
  int?ads_count;
  String? rate;
  int? wallet;
  String? sgl;
  int?points;


  ClientProfileModel({this.id, this.username, this.manager_name,this.account_name,this.personal_id,this.email,
    this.phone,this.type,this.role,this.image,this.blocked_at,this.country_id,this.area_id,this.token,this.chat,this.country,this.followers,this.rate,this.wallet,this.ads_count,this.profile_completion,this.reply_speed,this.sgl,this.points});

  factory ClientProfileModel.fromJson(Map<String, dynamic> json) => _$ClientProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientProfileModelToJson(this);
}

