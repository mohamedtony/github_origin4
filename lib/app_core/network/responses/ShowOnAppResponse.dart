import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ShowOnAppResponse.g.dart';

@JsonSerializable()
class ShowOnAppResponse {
  int? status;
  String? message;
  Data? data;
  int? pagination;

  ShowOnAppResponse(
      {this.status, this.message, this.data, this.pagination});

  ShowOnAppResponse.fromJson(Map<String, dynamic> json) {
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
  int? show;

  Data({this.show});

  Data.fromJson(Map<String, dynamic> json) {
    show = json['show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show'] = this.show;
    return data;
  }
}