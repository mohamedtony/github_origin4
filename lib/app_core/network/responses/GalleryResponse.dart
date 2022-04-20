import 'package:json_annotation/json_annotation.dart';
part 'GalleryResponse.g.dart';

@JsonSerializable()
class GalleryResponse {
  int? status;
  String? message;
  List<GalleryItem>? data;
  Pagination? pagination;

  GalleryResponse({this.status, this.message, this.data, this.pagination});

  GalleryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GalleryItem>[];
      json['data'].forEach((v) {
        data!.add(  GalleryItem.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class GalleryItem {
  int? id;
  int? sort;
  int? adsId;
  String? type;
  String? path;
  String? videoId;

  GalleryItem({this.id, this.sort, this.adsId, this.type, this.path, this.videoId});

  GalleryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sort = json['sort'];
    adsId = json['ads_id'];
    type = json['type'];
    path = json['path'];
    videoId = json['video_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['ads_id'] = this.adsId;
    data['type'] = this.type;
    data['path'] = this.path;
    data['video_id'] = this.videoId;
    return data;
  }
}

class Pagination {
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Pagination(
      {this.currentPage,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
