import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ShowAddsListResponse.g.dart';

@JsonSerializable()
class ShowAddsListResponse {
  int? status;
  String? message;
  List<AddModel>? data;
  Pagination? pagination;

  ShowAddsListResponse({this.status, this.message, this.data, this.pagination});

  ShowAddsListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AddModel>[];
      json['data'].forEach((v) {
        data!.add(new AddModel.fromJson(v));
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

class AddModel {
  int? id;
  String? status;
  String? startedAt;
  String? statusTxt;
  int? showApp;
  int? showProfile;
  String? type;
  bool? isFavourite;
  bool? hasComment;
  AdsType? adsType;
  User? user;
  int? comments;
  int? favourites;
  int? likes;
  int? dislikes;
  int? shares;
  int? views;
  String? description;
  String? image;
  String? video;

  AddModel(
      {this.id,
        this.status,
        this.statusTxt,
        this.showApp,
        this.showProfile,
        this.type,
        this.isFavourite,
        this.hasComment,
        this.adsType,
        this.user,
        this.comments,
        this.favourites,
        this.likes,
        this.dislikes,
        this.shares,
        this.views,
        this.description,
        this.image,
        this.video,
      this.startedAt});

  AddModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    statusTxt = json['status_txt'];
    startedAt = json['started_at'];
    showApp = json['show_app'];
    showProfile = json['show_profile'];
    type = json['type'];
    isFavourite = json['is_favourite'];
    hasComment = json['has_comment'];
    adsType = json['ads_type']!=null ? AdsType.fromJson(json['ads_type']) : null;
    user = json['user'] != null ?   User.fromJson(json['user']) : null;
    comments = json['comments'];
    favourites = json['favourites'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    shares = json['shares'];
    views = json['views'];
    description = json['description'];
    image = json['image'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['status_txt'] = this.statusTxt;
    data['started_at'] = this.startedAt;
    data['show_app'] = this.showApp;
    data['show_profile'] = this.showProfile;
    data['type'] = this.type;
    data['is_favourite'] = this.isFavourite;
    data['has_comment'] = this.hasComment;
    data['ads_type'] = this.adsType;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['comments'] = this.comments;
    data['favourites'] = this.favourites;
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    data['shares'] = this.shares;
    data['views'] = this.views;
    data['description'] = this.description;
    data['image'] = this.image;
    data['video'] = this.video;
    return data;
  }
}

class AdsType {
  int? id;
  int? sort;
  String? name;
  int? status;

  AdsType({this.id, this.sort, this.name, this.status});

  AdsType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sort = json['sort'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['name'] = this.name;
    data['status'] = this.status;
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
  Null? prevPageUrl;
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