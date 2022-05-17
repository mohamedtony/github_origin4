import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SetRulesRequest.g.dart';
@JsonSerializable()
class SetRulesRequest {
  List<int>? roles;

  SetRulesRequest({this.roles});

  SetRulesRequest.fromJson(Map<String, dynamic> json) {
    roles = json['roles'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roles'] = this.roles;
    return data;
  }
}