
import 'package:json_annotation/json_annotation.dart';
part 'EmployeesRulesResponse.g.dart';

@JsonSerializable()
class EmployeesRulesResponse {
  int? status;
  String? message;
  Data? data;
  String? pagination;

  EmployeesRulesResponse(
      {this.status, this.message, this.data, this.pagination});

  EmployeesRulesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  bool? show;
  bool? addEdit;
  bool? delete;
  bool? status;
  bool? history;

  Data({this.show, this.addEdit, this.delete, this.status, this.history});

  Data.fromJson(Map<String, dynamic> json) {
    show = json['show'];
    addEdit = json['add_edit'];
    delete = json['delete'];
    status = json['status'];
    history = json['history'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show'] = this.show;
    data['add_edit'] = this.addEdit;
    data['delete'] = this.delete;
    data['status'] = this.status;
    data['history'] = this.history;
    return data;
  }
}
