
import 'package:json_annotation/json_annotation.dart';
part 'MangeAdvertisersAccountsRulesResponse.g.dart';

@JsonSerializable()
class MangeAdvertisersAccountsRulesResponse {
  int? status;
  String? message;
  Data? data;
  String? pagination;

  MangeAdvertisersAccountsRulesResponse(
      {this.status, this.message, this.data, this.pagination});

  MangeAdvertisersAccountsRulesResponse.fromJson(Map<String, dynamic> json) {
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
  bool? manage;

  Data({this.show, this.manage});

  Data.fromJson(Map<String, dynamic> json) {
    show = json['show'];
    manage = json['manage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show'] = this.show;
    data['manage'] = this.manage;
    return data;
  }
}