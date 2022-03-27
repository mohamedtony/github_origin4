import 'package:json_annotation/json_annotation.dart';
part 'ShowEmployeeDetailsResponse .g.dart';

@JsonSerializable()
class ShowEmployeeDetailsResponse {
  int? status;
  String? message;
  Data? data;
  int? pagination;

  ShowEmployeeDetailsResponse(
      {this.status, this.message, this.data, this.pagination});

  ShowEmployeeDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  int? status;
  String? type;
  String? apperanceName;
  String? jobTitle;
  String? createAt;
  User? user;

  Data(
      {this.id,
        this.status,
        this.type,
        this.apperanceName,
        this.jobTitle,
        this.createAt,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    type = json['type'];
    apperanceName = json['apperance_name'];
    jobTitle = json['job_title'];
    createAt = json['create_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['type'] = this.type;
    data['apperance_name'] = this.apperanceName;
    data['job_title'] = this.jobTitle;
    data['create_at'] = this.createAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? rate;
  String? image;
  String? username;
  String? email;
  String? whatsapp;
  String? phone;

  User(
      {this.id,
        this.rate,
        this.image,
        this.username,
        this.email,
        this.whatsapp,
        this.phone});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    image = json['image'];
    username = json['username'];
    email = json['email'];
    whatsapp = json['whatsapp'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rate'] = this.rate;
    data['image'] = this.image;
    data['username'] = this.username;
    data['email'] = this.email;
    data['whatsapp'] = this.whatsapp;
    data['phone'] = this.phone;
    return data;
  }
}