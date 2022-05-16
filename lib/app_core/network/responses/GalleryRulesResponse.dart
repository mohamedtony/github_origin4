
import 'package:json_annotation/json_annotation.dart';
part 'GalleryRulesResponse.g.dart';

@JsonSerializable()
class GalleryRulesResponse {
  int? status;
  String? message;
  Data? data;
  String? pagination;

  GalleryRulesResponse({this.status, this.message, this.data, this.pagination});

  GalleryRulesResponse.fromJson(Map<String, dynamic> json) {
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
  bool? save;
  bool? repost;
  bool? delete;

  Data({this.show, this.save, this.repost, this.delete});

  Data.fromJson(Map<String, dynamic> json) {
    show = json['show'];
    save = json['save'];
    repost = json['repost'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show'] = this.show;
    data['save'] = this.save;
    data['repost'] = this.repost;
    data['delete'] = this.delete;
    return data;
  }
}