import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Employee.g.dart';
@JsonSerializable()
class Employee {
  int? id;
  int? status;
  String? type;
  String? apperanceName;
  String? jobTitle;
  String? createAt;
  User? user;

  Employee(
      {this.id,
        this.status,
        this.type,
        this.apperanceName,
        this.jobTitle,
        this.createAt,
        this.user});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    type = json['type'];
    apperanceName = json['apperance_name'];
    jobTitle = json['job_title'];
    createAt = json['create_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['type'] = this.type;
    data['apperance_name'] = this.apperanceName;
    data['job_title'] = this.jobTitle;
    data['create_at'] = this.createAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}