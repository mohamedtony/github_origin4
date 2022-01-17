import 'package:json_annotation/json_annotation.dart';
part 'ClientProfileModel.g.dart';

@JsonSerializable()
class ClientProfileModel {
  int? id;
  String? username;
  String? account_name;
  String? personal_id;
  String? email;
  String? phone;
  String? type;
  String? role;
  String? image;
  bool? blocked_at;
  int? country_id;
  int? area_id;
  String? token;

  ClientProfileModel({this.id, this.username, this.account_name,this.personal_id,this.email,
    this.phone,this.type,this.role,this.image,this.blocked_at,this.country_id,this.area_id,this.token});

  factory ClientProfileModel.fromJson(Map<String, dynamic> json) => _$ClientProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientProfileModelToJson(this);
}

