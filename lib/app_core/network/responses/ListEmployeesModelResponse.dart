import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ListEmployeesModelResponse.g.dart';
@JsonSerializable()
class ListEmployeesModelResponse {
  int? status;
  String? message;
  List<Employee>? employee;
  int? pagination;

  ListEmployeesModelResponse({this.status, this.message, this.employee, this.pagination});

  ListEmployeesModelResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      employee = <Employee>[];
      json['data'].forEach((v) {
        employee!.add(  Employee.fromJson(v));
      });
    }
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.employee != null) {
      data['data'] = this.employee!.map((v) => v.toJson()).toList();
    }
    data['pagination'] = this.pagination;
    return data;
  }
}



