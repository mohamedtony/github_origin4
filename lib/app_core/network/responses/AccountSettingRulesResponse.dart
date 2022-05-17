
import 'package:json_annotation/json_annotation.dart';
part 'AccountSettingRulesResponse.g.dart';

@JsonSerializable()
class AccountSettingRulesResponse {
  int? status;
  String? message;
  Data? data;
  String? pagination;

  AccountSettingRulesResponse(
      {this.status, this.message, this.data, this.pagination});

  AccountSettingRulesResponse.fromJson(Map<String, dynamic> json) {
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

  Data({this.show, this.addEdit});

  Data.fromJson(Map<String, dynamic> json) {
    show = json['show'];
    addEdit = json['add_edit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show'] = this.show;
    data['add_edit'] = this.addEdit;
    return data;
  }
}