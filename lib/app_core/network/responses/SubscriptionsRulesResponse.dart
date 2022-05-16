
import 'package:json_annotation/json_annotation.dart';
part 'SubscriptionsRulesResponse.g.dart';

@JsonSerializable()
class SubscriptionsRulesResponse {
  int? status;
  String? message;
  Data? data;
  String? pagination;

  SubscriptionsRulesResponse(
      {this.status, this.message, this.data, this.pagination});

  SubscriptionsRulesResponse.fromJson(Map<String, dynamic> json) {
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
  bool? upgrade;
  bool? renew;
  bool? payments;
  bool? stop;

  Data({this.show, this.upgrade, this.renew, this.payments, this.stop});

  Data.fromJson(Map<String, dynamic> json) {
    show = json['show'];
    upgrade = json['upgrade'];
    renew = json['renew'];
    payments = json['payments'];
    stop = json['stop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show'] = this.show;
    data['upgrade'] = this.upgrade;
    data['renew'] = this.renew;
    data['payments'] = this.payments;
    data['stop'] = this.stop;
    return data;
  }
}