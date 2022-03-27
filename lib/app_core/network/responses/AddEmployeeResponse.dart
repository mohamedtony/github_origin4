import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:json_annotation/json_annotation.dart';
part 'AddEmployeeResponse.g.dart';

@JsonSerializable()
class AddEmployeeResponse {
  int? status;
  String? message;
  Employee? data;
  String? pagination;

  AddEmployeeResponse(
      {this.status, this.message, this.data, this.pagination});

  AddEmployeeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Employee.fromJson(json['data']) : null;
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['pagination'] = this.pagination;
    return data;
  }
}
