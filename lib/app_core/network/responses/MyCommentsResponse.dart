import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MyCommentsResponse.g.dart';

@JsonSerializable()
class MyCommentsResponse {
  int? status;
  String? message;
  Data? data;
  Pagination? pagination;

  MyCommentsResponse({this.status, this.message, this.data, this.pagination});

  MyCommentsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  int? commentsCount;
  int? likes;
  int? dislikes;
  int? replies;
  List<Comments>? comments;

  Data(
      {this.commentsCount,
        this.likes,
        this.dislikes,
        this.replies,
        this.comments});

  Data.fromJson(Map<String, dynamic> json) {
    commentsCount = json['comments_count'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    replies = json['replies'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }else{
      comments = <Comments>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments_count'] = this.commentsCount;
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    data['replies'] = this.replies;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int? id;
  int? commentId;
  int? sort;
  String? commentType;
  int? adsId;
  int? userId;
  String? comment;
  String? createdAt;
  User? user;
  List<Replies>? replies;

  Comments(
      {this.id,
        this.commentId,
        this.sort,
        this.commentType,
        this.adsId,
        this.userId,
        this.comment,
        this.createdAt,
        this.user,
        this.replies});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commentId = json['comment_id'];
    sort = json['sort'];
    commentType = json['comment_type'];
    adsId = json['ads_id'];
    userId = json['user_id'];
    comment = json['comment'];
    createdAt = json['created_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['replies'] != null) {
      replies = <Replies>[];
      json['replies'].forEach((v) {
        replies!.add(new Replies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment_id'] = this.commentId;
    data['sort'] = this.sort;
    data['comment_type'] = this.commentType;
    data['ads_id'] = this.adsId;
    data['user_id'] = this.userId;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.replies != null) {
      data['replies'] = this.replies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? image;
  String? rate;

  User({this.id, this.username, this.image, this.rate});

  User.fromJson(Map<String, dynamic> json) {
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

class Replies {
  int? id;
  int? commentId;
  int? sort;
  String? commentType;
  int? adsId;
  int? userId;
  String? comment;
  String? createdAt;
  User? user;

  Replies(
      {this.id,
        this.commentId,
        this.sort,
        this.commentType,
        this.adsId,
        this.userId,
        this.comment,
        this.createdAt,
        this.user});

  Replies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commentId = json['comment_id'];
    sort = json['sort'];
    commentType = json['comment_type'];
    adsId = json['ads_id'];
    userId = json['user_id'];
    comment = json['comment'];
    createdAt = json['created_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment_id'] = this.commentId;
    data['sort'] = this.sort;
    data['comment_type'] = this.commentType;
    data['ads_id'] = this.adsId;
    data['user_id'] = this.userId;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Pagination {
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  Null? nextPageUrl;
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
