import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'CheckPhoneModel.g.dart';

@JsonSerializable()
class CheckPhoneModel {

  bool? exists,has_code;


  CheckPhoneModel({this.exists,this.has_code});

  factory CheckPhoneModel.fromJson(Map<String, dynamic> json) => _$CheckPhoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckPhoneModelToJson(this);
}

