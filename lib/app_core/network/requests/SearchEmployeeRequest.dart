import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SearchEmployeeRequest.g.dart';
@JsonSerializable()
class SearchEmployeeRequest {

  String? type;
  String? phone;

  SearchEmployeeRequest(
      {
        this.type,
        this.phone,
        });

  SearchEmployeeRequest.fromJson(Map<String, dynamic> json) {
     phone = json['phone'];
    type = json['type'];
   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
     data['phone'] = this.phone;
    data['type'] = this.type;
    return data;
  }
}