
import 'package:json_annotation/json_annotation.dart';
part 'MyAdsRulesResponse.g.dart';

@JsonSerializable()
class MyAdsRulesResponse {
  int? status;
  String? message;
  Data? data;
  String? pagination;

  MyAdsRulesResponse({this.status, this.message, this.data, this.pagination});

  MyAdsRulesResponse.fromJson(Map<String, dynamic> json) {
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
  bool? refresh;
  bool? showIn;
  bool? showDetails;

  Data(
      {this.show,
        this.addEdit,
        this.delete,
        this.refresh,
        this.showIn,
        this.showDetails});

  Data.fromJson(Map<String, dynamic> json) {
    show = json['show'];
    addEdit = json['add_edit'];
    delete = json['delete'];
    refresh = json['refresh'];
    showIn = json['show_in'];
    showDetails = json['show_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show'] = this.show;
    data['add_edit'] = this.addEdit;
    data['delete'] = this.delete;
    data['refresh'] = this.refresh;
    data['show_in'] = this.showIn;
    data['show_details'] = this.showDetails;
    return data;
  }
}