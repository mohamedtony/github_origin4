
class AdvertisingRequestsResponse {
  int? status;
  String? message;
  List<Data>? data;
  Pagination? pagination;
  dynamic error;
  String? errorMsg;

  AdvertisingRequestsResponse.makeError({this.error, this.errorMsg});
  AdvertisingRequestsResponse.fromJsonError({
    required Map<String, dynamic> json,
    this.error,
  }) {
    status = json['status'];
    // message = json['message'];
  }
  AdvertisingRequestsResponse(
      {this.status, this.message, this.data, this.pagination});

  AdvertisingRequestsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  bool? canEdit;
  User? user;
  String? createdAt;
  ProductType? productType;
  String? title;
  String? description;
  String? status;
  User? advertiser;
  int? comments;
  int? views;

  Data(
      {this.id,
        this.canEdit,
        this.user,
        this.createdAt,
        this.productType,
        this.title,
        this.description,
        this.status,
        this.advertiser,
        this.comments,
        this.views});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    canEdit = json['can_edit'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    productType = json['product_type'] != null
        ? new ProductType.fromJson(json['product_type'])
        : null;
    title = json['title'];
    description = json['description'];
    status = json['status'];
    advertiser = json['advertiser'] != null
        ? new User.fromJson(json['advertiser'])
        : null;
    comments = json['comments'];
    views = json['views'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['can_edit'] = this.canEdit;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['created_at'] = this.createdAt;
    if (this.productType != null) {
      data['product_type'] = this.productType!.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    if (this.advertiser != null) {
      data['advertiser'] = this.advertiser!.toJson();
    }
    data['comments'] = this.comments;
    data['views'] = this.views;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? role;
  String? image;

  User({this.id, this.username, this.role, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    role = json['role'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['role'] = this.role;
    data['image'] = this.image;
    return data;
  }
}

class ProductType {
  int? id;
  String? name;

  ProductType({this.id, this.name});

  ProductType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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

