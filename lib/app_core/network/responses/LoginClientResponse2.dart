import 'package:advertisers/app_core/network/models/User.dart';
import 'package:advertisers/app_core/network/models/User2.dart';
import 'package:json_annotation/json_annotation.dart';

part 'LoginClientResponse2.g.dart';

@JsonSerializable()
class LoginClientResponse2 {

  int? status;
  String? message;
  Data? data;
  String? pagination;

  LoginClientResponse2({this.status, this.message, this.data, this.pagination});

  LoginClientResponse2.fromJson(Map<String, dynamic> json) {
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
  String? username;
  String? accountName;
  String? companyName;
  String? managerName;
  String? sgl;
  Country? country;
  String? personalId;
  String? email;
  String? phone;
  String? type;
  String? role;
  String? gender;
  int? profileCompletion;
  String? image;
  bool? chat;
  bool? blockedAt;
  int? countryId;
  int? areaId;
  int? followers;
  String? rate;
  int? wallet;
  int? points;
  String? replySpeed;
  int? adsCount;
  bool? notifiable;
  List<Owners>? owners;
  String? token;

  Data(
  {this.id,
  this.username,
  this.accountName,
  this.companyName,
  this.managerName,
  this.sgl,
  this.country,
  this.personalId,
  this.email,
  this.phone,
  this.type,
  this.role,
  this.gender,
  this.profileCompletion,
  this.image,
  this.chat,
  this.blockedAt,
  this.countryId,
  this.areaId,
  this.followers,
  this.rate,
  this.wallet,
  this.points,
  this.replySpeed,
  this.adsCount,
  this.notifiable,
  this.owners,
  this.token});

  Data.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  username = json['username'];
  accountName = json['account_name'];
  companyName = json['company_name'];
  managerName = json['manager_name'];
  sgl = json['sgl'];
  country =
  json['country'] != null ? new Country.fromJson(json['country']) : null;
  personalId = json['personal_id'];
  email = json['email'];
  phone = json['phone'];
  type = json['type'];
  role = json['role'];
  gender = json['gender'];
  profileCompletion = json['profile_completion'];
  image = json['image'];
  chat = json['chat'];
  blockedAt = json['blocked_at'];
  countryId = json['country_id'];
  areaId = json['area_id'];
  followers = json['followers'];
  rate = json['rate'];
  wallet = json['wallet'];
  points = json['points'];
  replySpeed = json['reply_speed'];
  adsCount = json['ads_count'];
  notifiable = json['notifiable'];
  if (json['owners'] != null) {
  owners = <Owners>[];
  json['owners'].forEach((v) {
  owners!.add(new Owners.fromJson(v));
  });
  }
  token = json['token'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['username'] = this.username;
  data['account_name'] = this.accountName;
  data['company_name'] = this.companyName;
  data['manager_name'] = this.managerName;
  data['sgl'] = this.sgl;
  if (this.country != null) {
  data['country'] = this.country!.toJson();
  }
  data['personal_id'] = this.personalId;
  data['email'] = this.email;
  data['phone'] = this.phone;
  data['type'] = this.type;
  data['role'] = this.role;
  data['gender'] = this.gender;
  data['profile_completion'] = this.profileCompletion;
  data['image'] = this.image;
  data['chat'] = this.chat;
  data['blocked_at'] = this.blockedAt;
  data['country_id'] = this.countryId;
  data['area_id'] = this.areaId;
  data['followers'] = this.followers;
  data['rate'] = this.rate;
  data['wallet'] = this.wallet;
  data['points'] = this.points;
  data['reply_speed'] = this.replySpeed;
  data['ads_count'] = this.adsCount;
  data['notifiable'] = this.notifiable;
  if (this.owners != null) {
  data['owners'] = this.owners!.map((v) => v.toJson()).toList();
  }
  data['token'] = this.token;
  return data;
  }
  }

  class Country {
  int? id;
  String? name;
  String? image;

  Country({this.id, this.name, this.image});

  Country.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  name = json['name'];
  image = json['image'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['name'] = this.name;
  data['image'] = this.image;
  return data;
  }
  }

  class Owners {
  int? id;
  int? sort;
  int? status;
  int? userId;
  int? employeeId;
  String? createdAt;
  String? updatedAt;
  String? type;
  String? jobTitle;
  String? apperanceName;
  Owner? owner;

  Owners(
  {this.id,
  this.sort,
  this.status,
  this.userId,
  this.employeeId,
  this.createdAt,
  this.updatedAt,
  this.type,
  this.jobTitle,
  this.apperanceName,
  this.owner});

  Owners.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  sort = json['sort'];
  status = json['status'];
  userId = json['user_id'];
  employeeId = json['employee_id'];
  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
  type = json['type'];
  jobTitle = json['job_title'];
  apperanceName = json['apperance_name'];
  owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['sort'] = this.sort;
  data['status'] = this.status;
  data['user_id'] = this.userId;
  data['employee_id'] = this.employeeId;
  data['created_at'] = this.createdAt;
  data['updated_at'] = this.updatedAt;
  data['type'] = this.type;
  data['job_title'] = this.jobTitle;
  data['apperance_name'] = this.apperanceName;
  if (this.owner != null) {
  data['owner'] = this.owner!.toJson();
  }
  return data;
  }
  }

  class Owner {
  int? id;
  String? username;
  String? image;
  String? rate;

  Owner({this.id, this.username, this.image, this.rate});

  Owner.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  username = json['username'];
  image = json['image'];
  rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['username'] = this.username;
  data['image'] = this.image;
  data['rate'] = this.rate;
  return data;
  }
  }
