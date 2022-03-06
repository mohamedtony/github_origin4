
import 'package:json_annotation/json_annotation.dart';

part 'RefuseOrderReasonResponse.g.dart';

@JsonSerializable()
class RefuseOrderReasonResponse {
  int? status;
  String? message;
  Data? data;
  String? pagination;

  RefuseOrderReasonResponse(
      {this.status, this.message, this.data, this.pagination});

  RefuseOrderReasonResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? status;
  String? reason;
  User? user;
  User? advertiser;

  Data({this.id, this.status, this.reason, this.user, this.advertiser});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    reason = json['reason'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    advertiser = json['advertiser'] != null
        ? new User.fromJson(json['advertiser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['reason'] = this.reason;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.advertiser != null) {
      data['advertiser'] = this.advertiser!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? role;
  String? phone;
  String? image;

  User({this.id, this.username, this.role, this.phone, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    role = json['role'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['image'] = this.image;
    return data;
  }
}