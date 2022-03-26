import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Operation.g.dart';
@JsonSerializable()
class Operation {
  int? id;
  int? employeeId;
  String? action;
  String? actionableType;
  int? actionableId;
  Actionable? actionable;

  Operation(
      {this.id,
        this.employeeId,
        this.action,
        this.actionableType,
        this.actionableId,
        this.actionable});

  Operation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    action = json['action'];
    actionableType = json['actionable_type'];
    actionableId = json['actionable_id'];
    actionable = json['actionable'] != null
        ? new Actionable.fromJson(json['actionable'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['action'] = this.action;
    data['actionable_type'] = this.actionableType;
    data['actionable_id'] = this.actionableId;
    if (this.actionable != null) {
      data['actionable'] = this.actionable!.toJson();
    }
    return data;
  }
}

class Actionable {
  int? id;
  bool? inline;
  String? type;
  int? userId;
  int? advertiserId;
  String? status;
  int? repeatCount;
  String? title;
  int? adsTypeId;
  int? categoryId;
  String? description;
  String? addedAt;
  String? dateType;
  String? endedAt;
  String? offerEndedAt;
  String? offerStartedAt;
  String? startedAt;
  Location? location;
  String? notes;
  String? rejectReason;
  String? createdAt;
  String? updatedAt;
  String? planFile;

  Actionable(
      {this.id,
        this.inline,
        this.type,
        this.userId,
        this.advertiserId,
        this.status,
        this.repeatCount,
        this.title,
        this.adsTypeId,
        this.categoryId,
        this.description,
        this.addedAt,
        this.dateType,
        this.endedAt,
        this.offerEndedAt,
        this.offerStartedAt,
        this.startedAt,
        this.location,
        this.notes,
        this.rejectReason,
        this.createdAt,
        this.updatedAt,
        this.planFile});

  Actionable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inline = json['inline'];
    type = json['type'];
    userId = json['user_id'];
    advertiserId = json['advertiser_id'];
    status = json['status'];
    repeatCount = json['repeat_count'];
    title = json['title'];
    adsTypeId = json['ads_type_id'];
    categoryId = json['category_id'];
    description = json['description'];
    addedAt = json['added_at'];
    dateType = json['date_type'];
    endedAt = json['ended_at'];
    offerEndedAt = json['offer_ended_at'];
    offerStartedAt = json['offer_started_at'];
    startedAt = json['started_at'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    notes = json['notes'];
    rejectReason = json['reject_reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    planFile = json['plan_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inline'] = this.inline;
    data['type'] = this.type;
    data['user_id'] = this.userId;
    data['advertiser_id'] = this.advertiserId;
    data['status'] = this.status;
    data['repeat_count'] = this.repeatCount;
    data['title'] = this.title;
    data['ads_type_id'] = this.adsTypeId;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['added_at'] = this.addedAt;
    data['date_type'] = this.dateType;
    data['ended_at'] = this.endedAt;
    data['offer_ended_at'] = this.offerEndedAt;
    data['offer_started_at'] = this.offerStartedAt;
    data['started_at'] = this.startedAt;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['notes'] = this.notes;
    data['reject_reason'] = this.rejectReason;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['plan_file'] = this.planFile;
    return data;
  }
}

class Location {
  String? lat;
  String? lng;
  String? name;
  String? address;

  Location({this.lat, this.lng, this.name, this.address});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['name'] = this.name;
    data['address'] = this.address;
    return data;
  }
}