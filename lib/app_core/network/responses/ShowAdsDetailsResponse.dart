import 'package:json_annotation/json_annotation.dart';
part 'ShowAdsDetailsResponse.g.dart';

@JsonSerializable()
class ShowAdsDetailsResponse {
  int? status;
  String? message;
  Data? data;
  String? pagination;

  ShowAdsDetailsResponse(
      {this.status, this.message, this.data, this.pagination});

  ShowAdsDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  String? statusTxt;
  String? startedAt;
  int? showApp;
  int? showProfile;
  bool? isFavourite;
  bool? hasComment;
  String? type;
  AdsType? adsType;
  AdsRequest? adsRequest;
  List<String>? areas;
  Location? location;
  String? description;
  int? attachmentPreviewDuration;
  List<String>? attachments;
  User? user;
  int? comments;
  int? favourites;
  bool? isLiked;
  int? likes;
  bool? isDisliked;
  int? dislikes;
  int? shares;
  int? views;
  String? image;
  String? video;
  String? timeAgo;

  Data(
      {this.id,
        this.status,
        this.statusTxt,
        this.startedAt,
        this.showApp,
        this.showProfile,
        this.isFavourite,
        this.hasComment,
        this.type,
        this.adsType,
        this.adsRequest,
        this.areas,
        this.location,
        this.description,
        this.attachmentPreviewDuration,
        this.attachments,
        this.user,
        this.comments,
        this.favourites,
        this.isLiked,
        this.likes,
        this.isDisliked,
        this.dislikes,
        this.shares,
        this.views,
        this.image,
        this.video,
        this.timeAgo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    statusTxt = json['status_txt'];
    startedAt = json['started_at'];
    showApp = json['show_app'];
    showProfile = json['show_profile'];
    isFavourite = json['is_favourite'];
    hasComment = json['has_comment'];
    type = json['type'];
    adsType = json['ads_type'] != null
        ? new AdsType.fromJson(json['ads_type'])
        : null;
    adsRequest = json['ads_request'] != null
        ? new AdsRequest.fromJson(json['ads_request'])
        : null;
    areas = json['areas'].cast<String>();
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    description = json['description'];
    attachmentPreviewDuration = json['attachment_preview_duration'];
    attachments = json['attachments'].cast<String>();
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    comments = json['comments'];
    favourites = json['favourites'];
    isLiked = json['is_liked'];
    likes = json['likes'];
    isDisliked = json['is_disliked'];
    dislikes = json['dislikes'];
    shares = json['shares'];
    views = json['views'];
    image = json['image'];
    video = json['video'];
    timeAgo = json['time_ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['status_txt'] = this.statusTxt;
    data['started_at'] = this.startedAt;
    data['show_app'] = this.showApp;
    data['show_profile'] = this.showProfile;
    data['is_favourite'] = this.isFavourite;
    data['has_comment'] = this.hasComment;
    data['type'] = this.type;
    if (this.adsType != null) {
      data['ads_type'] = this.adsType!.toJson();
    }
    if (this.adsRequest != null) {
      data['ads_request'] = this.adsRequest!.toJson();
    }
    data['areas'] = this.areas;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['description'] = this.description;
    data['attachment_preview_duration'] = this.attachmentPreviewDuration;
    data['attachments'] = this.attachments;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['comments'] = this.comments;
    data['favourites'] = this.favourites;
    data['is_liked'] = this.isLiked;
    data['likes'] = this.likes;
    data['is_disliked'] = this.isDisliked;
    data['dislikes'] = this.dislikes;
    data['shares'] = this.shares;
    data['views'] = this.views;
    data['image'] = this.image;
    data['video'] = this.video;
    data['time_ago'] = this.timeAgo;
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

class AdsRequest {
  int? id;
  UserOfAdsReq? user;
  String? addedAt;
  String? title;
  String? description;
  Advertiser? advertiser;
  Location? location;
  ProductType? productType;
  String? type;
  List<String>? attachments;
  Copon? copon;
  List<Links>? links;
  List<Channels>? channels;

  AdsRequest(
      {this.id,
        this.user,
        this.addedAt,
        this.title,
        this.description,
        this.advertiser,
        this.location,
        this.productType,
        this.type,
        this.attachments,
        this.copon,
        this.links,
        this.channels});

  AdsRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new UserOfAdsReq.fromJson(json['user']) : null;
    addedAt = json['added_at'];
    title = json['title'];
    description = json['description'];
    advertiser = json['advertiser'] != null
        ? new Advertiser.fromJson(json['advertiser'])
        : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    productType = json['product_type'] != null
        ? new ProductType.fromJson(json['product_type'])
        : null;
    type = json['type'];
    attachments = json['attachments'].cast<String>();
    copon = json['copon'] != null ? new Copon.fromJson(json['copon']) : null;
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    if (json['channels'] != null) {
      channels = <Channels>[];
      json['channels'].forEach((v) {
        channels!.add(new Channels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['added_at'] = this.addedAt;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.advertiser != null) {
      data['advertiser'] = this.advertiser!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.productType != null) {
      data['product_type'] = this.productType!.toJson();
    }
    data['type'] = this.type;
    data['attachments'] = this.attachments;
    if (this.copon != null) {
      data['copon'] = this.copon!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    if (this.channels != null) {
      data['channels'] = this.channels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserOfAdsReq {
  int? id;
  String? username;
  String? country;
  String? area;
  String? phone;

  UserOfAdsReq({this.id, this.username, this.country, this.area, this.phone});

  UserOfAdsReq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    country = json['country'];
    area = json['area'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['country'] = this.country;
    data['area'] = this.area;
    data['phone'] = this.phone;
    return data;
  }
}

class Advertiser {
  int? id;
  String? username;
  String? role;
  String? phone;
  String? image;
  String? rate;

  Advertiser(
      {this.id, this.username, this.role, this.phone, this.image, this.rate});

  Advertiser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    role = json['role'];
    phone = json['phone'];
    image = json['image'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['rate'] = this.rate;
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

class Copon {
  int? id;
  int? sort;
  int? status;
  String? code;
  String? type;
  int? discount;
  String? startedAt;
  String? endedAt;
  String? name;
  String? image;
  String? marketerRatio;
  int? uses;
  String? description;
  int? userId;
  int? adsRequestId;
  String? discountType;
  String? link;
  String? storeName;
  int? usesCount;
  int? viewsCount;
  int? sharesCount;

  Copon(
      {this.id,
        this.sort,
        this.status,
        this.code,
        this.type,
        this.discount,
        this.startedAt,
        this.endedAt,
        this.name,
        this.image,
        this.marketerRatio,
        this.uses,
        this.description,
        this.userId,
        this.adsRequestId,
        this.discountType,
        this.link,
        this.storeName,
        this.usesCount,
        this.viewsCount,
        this.sharesCount});

  Copon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sort = json['sort'];
    status = json['status'];
    code = json['code'];
    type = json['type'];
    discount = json['discount'];
    startedAt = json['started_at'];
    endedAt = json['ended_at'];
    name = json['name'];
    image = json['image'];
    marketerRatio = json['marketer_ratio'];
    uses = json['uses'];
    description = json['description'];
    userId = json['user_id'];
    adsRequestId = json['ads_request_id'];
    discountType = json['discount_type'];
    link = json['link'];
    storeName = json['store_name'];
    usesCount = json['uses_count'];
    viewsCount = json['views_count'];
    sharesCount = json['shares_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['status'] = this.status;
    data['code'] = this.code;
    data['type'] = this.type;
    data['discount'] = this.discount;
    data['started_at'] = this.startedAt;
    data['ended_at'] = this.endedAt;
    data['name'] = this.name;
    data['image'] = this.image;
    data['marketer_ratio'] = this.marketerRatio;
    data['uses'] = this.uses;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    data['ads_request_id'] = this.adsRequestId;
    data['discount_type'] = this.discountType;
    data['link'] = this.link;
    data['store_name'] = this.storeName;
    data['uses_count'] = this.usesCount;
    data['views_count'] = this.viewsCount;
    data['shares_count'] = this.sharesCount;
    return data;
  }
}

class Links {
  int? id;
  int? sort;
  int? adsId;
  String? name;
  String? link;

  Links({this.id, this.sort, this.adsId, this.name, this.link});

  Links.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sort = json['sort'];
    adsId = json['ads_id'];
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['ads_id'] = this.adsId;
    data['name'] = this.name;
    data['link'] = this.link;
    return data;
  }
}

class Channels {
  int? id;
  int? sort;
  bool? inline;
  String? name;
  int? channelType;
  String? image;
  bool? blockedAt;
  Pivot? pivot;

  Channels(
      {this.id,
        this.sort,
        this.inline,
        this.name,
        this.channelType,
        this.image,
        this.blockedAt,
        this.pivot});

  Channels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sort = json['sort'];
    inline = json['inline'];
    name = json['name'];
    channelType = json['channel_type'];
    image = json['image'];
    blockedAt = json['blocked_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['inline'] = this.inline;
    data['name'] = this.name;
    data['channel_type'] = this.channelType;
    data['image'] = this.image;
    data['blocked_at'] = this.blockedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? adsId;
  int? channelId;

  Pivot({this.adsId, this.channelId});

  Pivot.fromJson(Map<String, dynamic> json) {
    adsId = json['ads_id'];
    channelId = json['channel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ads_id'] = this.adsId;
    data['channel_id'] = this.channelId;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? image;
  String? address;

  User({this.id, this.username, this.image, this.address});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    image = json['image'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['image'] = this.image;
    data['address'] = this.address;
    return data;
  }
}
