
import 'package:json_annotation/json_annotation.dart';
part 'OrdersRulesResponse.g.dart';

@JsonSerializable()
class OrdersRulesResponse {
  int? status;
  String? message;
  Data? data;
  String? pagination;

  OrdersRulesResponse({this.status, this.message, this.data, this.pagination});

  OrdersRulesResponse.fromJson(Map<String, dynamic> json) {
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
  bool? showAll;
  bool? pricing;
  bool? repricing;
  bool? reject;
  bool? confirmTransfer;
  bool? execute;
  bool? showDetails;
  bool? showBill;

  Data(
      {this.showAll,
        this.pricing,
        this.repricing,
        this.reject,
        this.confirmTransfer,
        this.execute,
        this.showDetails,
        this.showBill});

  Data.fromJson(Map<String, dynamic> json) {
    showAll = json['show_all'];
    pricing = json['pricing'];
    repricing = json['repricing'];
    reject = json['reject'];
    confirmTransfer = json['confirm_transfer'];
    execute = json['execute'];
    showDetails = json['show_details'];
    showBill = json['show_bill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show_all'] = this.showAll;
    data['pricing'] = this.pricing;
    data['repricing'] = this.repricing;
    data['reject'] = this.reject;
    data['confirm_transfer'] = this.confirmTransfer;
    data['execute'] = this.execute;
    data['show_details'] = this.showDetails;
    data['show_bill'] = this.showBill;
    return data;
  }
}