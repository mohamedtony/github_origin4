
import 'package:json_annotation/json_annotation.dart';
part 'RequestResponseForAds.g.dart';
@JsonSerializable()
class RequestResponseForAds {
  int? status;
  String? message;
  Data? data;
  String? pagination;

  RequestResponseForAds(
      {this.status, this.message, this.data, this.pagination});

  RequestResponseForAds.fromJson(Map<String, dynamic> json) {
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
  String? dateType;
  String? status;
  String? statusTxt;
  bool? inline;
  ProductType? productType;
  Advertiser? advertiser;
  Advertiser? user;
  ProductType? adsType;
  List<Channels>? channels;
  String? description;
  List<Attachments>? attachments;
  List<Links>? links;
  Address? address;
  Copon? copon;
  String? notes;
  String? planFile;
  String? addedAt;
  String? startedAt;
  String? endedAt;
  String? offerEndedAt;
  String? addedTo;
  int? repeatCount;

  Data(
      {this.id,
        this.dateType,
        this.status,
        this.statusTxt,
        this.inline,
        this.productType,
        this.advertiser,
        this.user,
        this.adsType,
        this.channels,
        this.description,
        this.attachments,
        this.links,
        this.address,
        this.copon,
        this.notes,
        this.planFile,
        this.addedAt,
        this.startedAt,
        this.endedAt,
        this.offerEndedAt,
        this.addedTo,
        this.repeatCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateType = json['date_type'];
    status = json['status'];
    statusTxt = json['status_txt'];
    inline = json['inline'];
    productType = json['product_type'] != null
        ? new ProductType.fromJson(json['product_type'])
        : null;
    advertiser = json['advertiser'] != null
        ? new Advertiser.fromJson(json['advertiser'])
        : null;
    user = json['user'] != null ? new Advertiser.fromJson(json['user']) : null;
    adsType = json['ads_type'] != null
        ? new ProductType.fromJson(json['ads_type'])
        : null;
    if (json['channels'] != null) {
      channels = <Channels>[];
      json['channels'].forEach((v) {
        channels!.add(new Channels.fromJson(v));
      });
    }
    description = json['description'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    copon = json['copon'];
    notes = json['notes'];
    planFile = json['plan_file'];
    addedAt = json['added_at'];
    startedAt = json['started_at'];
    endedAt = json['ended_at'];
    offerEndedAt = json['offer_ended_at'];
    addedTo = json['added_to'];
    repeatCount = json['repeat_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_type'] = this.dateType;
    data['status'] = this.status;
    data['status_txt'] = this.statusTxt;
    data['inline'] = this.inline;
    if (this.productType != null) {
      data['product_type'] = this.productType!.toJson();
    }
    if (this.advertiser != null) {
      data['advertiser'] = this.advertiser!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.adsType != null) {
      data['ads_type'] = this.adsType!.toJson();
    }
    if (this.channels != null) {
      data['channels'] = this.channels!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['copon'] = this.copon;
    data['notes'] = this.notes;
    data['plan_file'] = this.planFile;
    data['added_at'] = this.addedAt;
    data['started_at'] = this.startedAt;
    data['ended_at'] = this.endedAt;
    data['offer_ended_at'] = this.offerEndedAt;
    data['added_to'] = this.addedTo;
    data['repeat_count'] = this.repeatCount;
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

class Advertiser {
  int? id;
  String? username;
  String? phone;
  String? whatsapp;
  String? image;
  String? companyName;
  String? rate;
  int? payments;
  String? addedFrom;
  Requests? requests;
  Socials? socials;

  Advertiser(
      {this.id,
        this.username,
        this.phone,
        this.whatsapp,
        this.image,
        this.companyName,
        this.rate,
        this.payments,
        this.addedFrom,
        this.requests,
        this.socials});

  Advertiser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    image = json['image'];
    companyName = json['company_name'];
    rate = json['rate'];
    payments = json['payments'];
    addedFrom = json['added_from'];
    requests = json['requests'] != null
        ? new Requests.fromJson(json['requests'])
        : null;
    socials =
    json['socials'] != null ? new Socials.fromJson(json['socials']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['whatsapp'] = this.whatsapp;
    data['image'] = this.image;
    data['company_name'] = this.companyName;
    data['rate'] = this.rate;
    data['payments'] = this.payments;
    data['added_from'] = this.addedFrom;
    if (this.requests != null) {
      data['requests'] = this.requests!.toJson();
    }
    if (this.socials != null) {
      data['socials'] = this.socials!.toJson();
    }
    return data;
  }
}

class Requests {
  int? finished;
  int? notFinished;
  int? rejected;
  int? cancelled;
  String? lateTime;

  Requests(
      {this.finished,
        this.notFinished,
        this.rejected,
        this.cancelled,
        this.lateTime});

  Requests.fromJson(Map<String, dynamic> json) {
    finished = json['finished'];
    notFinished = json['not_finished'];
    rejected = json['rejected'];
    cancelled = json['cancelled'];
    lateTime = json['late_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['finished'] = this.finished;
    data['not_finished'] = this.notFinished;
    data['rejected'] = this.rejected;
    data['cancelled'] = this.cancelled;
    data['late_time'] = this.lateTime;
    return data;
  }
}

class Socials {
  String? facebook;
  String? snapchat;
  String? instagram;

  Socials({this.facebook, this.snapchat, this.instagram});

  Socials.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    snapchat = json['snapchat'];
    instagram = json['instagram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['snapchat'] = this.snapchat;
    data['instagram'] = this.instagram;
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

class Attachments {
  int? id;
  int? sort;
  int? adsId;
  String? path;
  String? fullPath;
  String? type;
  String? videoId;
  bool? isUploaded;

  Attachments(
      {this.id,
        this.sort,
        this.adsId,
        this.path,
        this.fullPath,
        this.type,
        this.videoId,
        this.isUploaded});

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sort = json['sort'];
    adsId = json['ads_id'];
    path = json['path'];
    fullPath = json['full_path'];
    type = json['type'];
    videoId = json['video_id'];
    isUploaded = json['is_uploaded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['ads_id'] = this.adsId;
    data['path'] = this.path;
    data['full_path'] = this.fullPath;
    data['type'] = this.type;
    data['video_id'] = this.videoId;
    data['is_uploaded'] = this.isUploaded;
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

class Address {
  String? lat;
  String? lng;
  String? name;
  String? address;

  Address({this.lat, this.lng, this.name, this.address});

  Address.fromJson(Map<String, dynamic> json) {
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

class Copon {
  int? id;
  int? status;
  String? code;
  String? type;
  int? discount;
  String? startedAt;
  String? endedAt;
  String? name;
  String? image;
  int? marketerRatio;
  int? uses;
  String? description;
  int? userId;
  int? adsRequestId;
  String? discountType;

  Copon(
      {this.id,
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
        this.discountType});

  Copon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    return data;
  }
}
