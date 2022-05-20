import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AddRulesRequest.g.dart';
@JsonSerializable()
class AddRulesRequest {

  List<int>?roles;


  AddRulesRequest({this.roles});

  factory AddRulesRequest.fromJson(Map<String, dynamic> json) =>
      _$AddRulesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddRulesRequestToJson(this);
}