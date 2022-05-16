
import 'package:json_annotation/json_annotation.dart';
part 'ReportsRulesResponse.g.dart';

@JsonSerializable()
class ReportsRulesResponse {
  int? status;
  String? message;
  Data? data;
  String? pagination;

  ReportsRulesResponse({this.status, this.message, this.data, this.pagination});

  ReportsRulesResponse.fromJson(Map<String, dynamic> json) {
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
  bool? goalsShow;
  bool? goalsAddEdit;
  bool? goalsDelete;

  Data({this.show, this.goalsShow, this.goalsAddEdit, this.goalsDelete});

  Data.fromJson(Map<String, dynamic> json) {
    show = json['show'];
    goalsShow = json['goals_show'];
    goalsAddEdit = json['goals_add_edit'];
    goalsDelete = json['goals_delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show'] = this.show;
    data['goals_show'] = this.goalsShow;
    data['goals_add_edit'] = this.goalsAddEdit;
    data['goals_delete'] = this.goalsDelete;
    return data;
  }
}