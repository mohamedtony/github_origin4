import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AddEmployeeRequest.g.dart';
@JsonSerializable()
class AddEmployeeRequest {

  String? type;
  String? username;
  String? email;
  String? phone;
  String? jobTitle;
  String? apperanceName;

  AddEmployeeRequest(
      {
        this.type,
        this.username,
        this.email,
        this.phone,
        this.jobTitle,
        this.apperanceName,
        });

  AddEmployeeRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    apperanceName = json['apperance_name'];
    jobTitle = json['job_title'];
    username = json['username'];
   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['apperance_name'] = this.apperanceName;
    data['job_title'] = this.jobTitle;
    data['username'] = this.username;
    return data;
  }
}