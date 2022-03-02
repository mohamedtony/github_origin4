//
//
//
// class Areas {
//   int? id;
//   String? name;
//
//   Areas({this.id, this.name});
//
//   Areas.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }
//
// class Sorts {
//   String? key;
//   String? value;
//
//   Sorts({this.key, this.value});
//
//   Sorts.fromJson(Map<String, dynamic> json) {
//     key = json['key'];
//     value = json['value'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['key'] = this.key;
//     data['value'] = this.value;
//     return data;
//   }
// }
//
// class Pagination {
//   int? currentPage;
//   String? firstPageUrl;
//   var from;
//   int? lastPage;
//   String? lastPageUrl;
//   var nextPageUrl;
//   String? path;
//   int? perPage;
//   var prevPageUrl;
//   var to;
//   int? total;
//
//   Pagination(
//       {this.currentPage,
//         this.firstPageUrl,
//         this.from,
//         this.lastPage,
//         this.lastPageUrl,
//         this.nextPageUrl,
//         this.path,
//         this.perPage,
//         this.prevPageUrl,
//         this.to,
//         this.total});
//
//   Pagination.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_page'] = this.currentPage;
//     data['first_page_url'] = this.firstPageUrl;
//     data['from'] = this.from;
//     data['last_page'] = this.lastPage;
//     data['last_page_url'] = this.lastPageUrl;
//     data['next_page_url'] = this.nextPageUrl;
//     data['path'] = this.path;
//     data['per_page'] = this.perPage;
//     data['prev_page_url'] = this.prevPageUrl;
//     data['to'] = this.to;
//     data['total'] = this.total;
//     return data;
//   }
// }
//
//
//
// class AdvertisingRequestsResponse {
//   int? status;
//   var message;
//   Data? data;
//   Pagination? pagination;
//
//   AdvertisingRequestsResponse(
//       {this.status, this.message, this.data, this.pagination});
//
//   AdvertisingRequestsResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     pagination = json['pagination'] != null
//         ? new Pagination.fromJson(json['pagination'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     if (this.pagination != null) {
//       data['pagination'] = this.pagination!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   List<Areas>? areas;
//   List<Sorts>? sorts;
//   List<ParentRequests>? parentRequests;
//
//   Data({this.areas, this.parentRequests,this.sorts});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['areas'] != null) {
//       areas = <Areas>[];
//       json['areas'].forEach((v) {
//         areas!.add(new Areas.fromJson(v));
//       });
//     }
//     if (json['sorts'] != null) {
//       sorts = <Sorts>[];
//       json['sorts'].forEach((v) {
//         sorts!.add(new Sorts.fromJson(v));
//       });
//     }
//     if (json['requests'] != null) {
//       parentRequests = <ParentRequests>[];
//       json['requests'].forEach((v) {
//         parentRequests!.add(new ParentRequests.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.areas != null) {
//       data['areas'] = this.areas!.map((v) => v.toJson()).toList();
//     }
//     if (this.sorts != null) {
//       data['sorts'] = this.sorts!.map((v) => v.toJson()).toList();
//     }
//     if (this.parentRequests != null) {
//       data['requests'] =
//           this.parentRequests!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class SortTypes {
//   String? title;
//   Values? values;
//
//   SortTypes({this.title, this.values});
//
//   SortTypes.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     values =
//     json['values'] != null ? new Values.fromJson(json['values']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     if (this.values != null) {
//       data['values'] = this.values!.toJson();
//     }
//     return data;
//   }
// }
//
// class Values {
//   String? latest;
//   String? oldest;
//   String? pendingPayment;
//   String? pendingConfirm;
//   String? rejected;
//   String? inprogress;
//   String? cancelled;
//
//   Values(
//       {this.latest,
//         this.oldest,
//         this.pendingPayment,
//         this.pendingConfirm,
//         this.rejected,
//         this.inprogress,
//         this.cancelled});
//
//   Values.fromJson(Map<String, dynamic> json) {
//     latest = json['latest'];
//     oldest = json['oldest'];
//     pendingPayment = json['pending_payment'];
//     pendingConfirm = json['pending_confirm'];
//     rejected = json['rejected'];
//     inprogress = json['inprogress'];
//     cancelled = json['cancelled'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['latest'] = this.latest;
//     data['oldest'] = this.oldest;
//     data['pending_payment'] = this.pendingPayment;
//     data['pending_confirm'] = this.pendingConfirm;
//     data['rejected'] = this.rejected;
//     data['inprogress'] = this.inprogress;
//     data['cancelled'] = this.cancelled;
//     return data;
//   }
// }
//
// class ParentRequests {
//   int? id;
//   String? status;
//   String? statusTxt;
//   bool? canEdit;
//   Statuses? statuses;
//   Advertiser? advertiser;
//   Advertiser? user;
//   String? createdAt;
//   ProductType? productType;
//   String? title;
//   String? description;
//   var billId;
//   String? address;
//   int? comments;
//   int? views;
//
//   ParentRequests(
//       {this.id,
//         this.status,
//         this.statusTxt,
//         this.canEdit,
//         this.statuses,
//         this.advertiser,
//         this.user,
//         this.createdAt,
//         this.productType,
//         this.title,
//         this.description,
//         this.billId,
//         this.address,
//         this.comments,
//         this.views});
//
//   ParentRequests.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     status = json['status'];
//     statusTxt = json['status_txt'];
//     canEdit = json['can_edit'];
//     statuses = json['statuses'] != null
//         ? new Statuses.fromJson(json['statuses'])
//         : null;
//     advertiser = json['advertiser'] != null
//         ? new Advertiser.fromJson(json['advertiser'])
//         : null;
//     user = json['user'] != null ? new Advertiser.fromJson(json['user']) : null;
//     createdAt = json['created_at'];
//     productType = json['product_type'] != null
//         ? new ProductType.fromJson(json['product_type'])
//         : null;
//     title = json['title'];
//     description = json['description'];
//     billId = json['bill_id'];
//     address = json['address'];
//     comments = json['comments'];
//     views = json['views'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['status'] = this.status;
//     data['status_txt'] = this.statusTxt;
//     data['can_edit'] = this.canEdit;
//     if (this.statuses != null) {
//       data['statuses'] = this.statuses!.toJson();
//     }
//     if (this.advertiser != null) {
//       data['advertiser'] = this.advertiser!.toJson();
//     }
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     data['created_at'] = this.createdAt;
//     if (this.productType != null) {
//       data['product_type'] = this.productType!.toJson();
//     }
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['bill_id'] = this.billId;
//     data['address'] = this.address;
//     data['comments'] = this.comments;
//     data['views'] = this.views;
//     return data;
//   }
// }
//
// class Statuses {
//   bool? payment;
//   bool? reject;
//   bool? transfer;
//   bool? confirm;
//   bool? edit;
//   bool? cancel;
//
//   Statuses(
//       {this.payment,
//         this.reject,
//         this.transfer,
//         this.confirm,
//         this.edit,
//         this.cancel});
//
//   Statuses.fromJson(Map<String, dynamic> json) {
//     payment = json['payment'];
//     reject = json['reject'];
//     transfer = json['transfer'];
//     confirm = json['confirm'];
//     edit = json['edit'];
//     cancel = json['cancel'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['payment'] = this.payment;
//     data['reject'] = this.reject;
//     data['transfer'] = this.transfer;
//     data['confirm'] = this.confirm;
//     data['edit'] = this.edit;
//     data['cancel'] = this.cancel;
//     return data;
//   }
// }
//
// class Advertiser {
//   int? id;
//   String? username;
//   String? phone;
//   String? whatsapp;
//   String? image;
//   var companyName;
//   String? rate;
//   int? payments;
//   String? addedFrom;
//   Requests? requests;
//   Socials? socials;
//
//   Advertiser(
//       {this.id,
//         this.username,
//         this.phone,
//         this.whatsapp,
//         this.image,
//         this.companyName,
//         this.rate,
//         this.payments,
//         this.addedFrom,
//         this.requests,
//         this.socials});
//
//   Advertiser.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     username = json['username'];
//     phone = json['phone'];
//     whatsapp = json['whatsapp'];
//     image = json['image'];
//     companyName = json['company_name'];
//     rate = json['rate'];
//     payments = json['payments'];
//     addedFrom = json['added_from'];
//     requests = json['requests'] != null
//         ? new Requests.fromJson(json['requests'])
//         : null;
//     socials =
//     json['socials'] != null ? new Socials.fromJson(json['socials']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['username'] = this.username;
//     data['phone'] = this.phone;
//     data['whatsapp'] = this.whatsapp;
//     data['image'] = this.image;
//     data['company_name'] = this.companyName;
//     data['rate'] = this.rate;
//     data['payments'] = this.payments;
//     data['added_from'] = this.addedFrom;
//     if (this.requests != null) {
//       data['requests'] = this.requests!.toJson();
//     }
//     if (this.socials != null) {
//       data['socials'] = this.socials!.toJson();
//     }
//     return data;
//   }
// }
//
// class Requests {
//   int? finished;
//   int? notFinished;
//   int? rejected;
//   int? cancelled;
//   var lateTime;
//
//   Requests(
//       {this.finished,
//         this.notFinished,
//         this.rejected,
//         this.cancelled,
//         this.lateTime});
//
//   Requests.fromJson(Map<String, dynamic> json) {
//     finished = json['finished'];
//     notFinished = json['not_finished'];
//     rejected = json['rejected'];
//     cancelled = json['cancelled'];
//     lateTime = json['late_time'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['finished'] = this.finished;
//     data['not_finished'] = this.notFinished;
//     data['rejected'] = this.rejected;
//     data['cancelled'] = this.cancelled;
//     data['late_time'] = this.lateTime;
//     return data;
//   }
// }
//
// class Socials {
//   var facebook;
//   var snapchat;
//   var instagram;
//
//   Socials({this.facebook, this.snapchat, this.instagram});
//
//   Socials.fromJson(Map<String, dynamic> json) {
//     facebook = json['facebook'];
//     snapchat = json['snapchat'];
//     instagram = json['instagram'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['facebook'] = this.facebook;
//     data['snapchat'] = this.snapchat;
//     data['instagram'] = this.instagram;
//     return data;
//   }
// }
//
// class ProductType {
//   int? id;
//   String? name;
//
//   ProductType({this.id, this.name});
//
//   ProductType.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }


class AdvertisingRequestsResponse {
  int? status;
  var message;
  Data? data;
  Pagination? pagination;

  AdvertisingRequestsResponse(
      {this.status, this.message, this.data, this.pagination});

  AdvertisingRequestsResponse.fromJson(Map<String, dynamic> json) {
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
  List<Areas>? areas;
  List<Sorts>? sorts;
  List<ParentRequests>? parentRequests;

  Data({this.areas, this.sorts, this.parentRequests});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas!.add(new Areas.fromJson(v));
      });
    }
    if (json['sorts'] != null) {
      sorts = <Sorts>[];
      json['sorts'].forEach((v) {
        sorts!.add(new Sorts.fromJson(v));
      });
    }
    if (json['requests'] != null) {
      parentRequests = <ParentRequests>[];
      json['requests'].forEach((v) {
        parentRequests!.add(new ParentRequests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.areas != null) {
      data['areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    if (this.sorts != null) {
      data['sorts'] = this.sorts!.map((v) => v.toJson()).toList();
    }
    if (this.parentRequests != null) {
      data['requests'] = this.parentRequests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Areas {
  int? id;
  String? name;

  Areas({this.id, this.name});

  Areas.fromJson(Map<String, dynamic> json) {
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

class Sorts {
  String? key;
  String? value;

  Sorts({this.key, this.value});

  Sorts.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class ParentRequests {
  int? id;
  String? status;
  String? statusTxt;
  bool? canEdit;
  Statuses? statuses;
  Advertiser? advertiser;
  Advertiser? user;
  String? createdAt;
  Areas? productType;
  String? title;
  String? description;
  var billId;
  var billTotal;
  var executionDate;
  var remainingDays;
  String? address;
  var comments;
  var views;

  ParentRequests(
      {this.id,
        this.status,
        this.statusTxt,
        this.canEdit,
        this.statuses,
        this.advertiser,
        this.user,
        this.createdAt,
        this.productType,
        this.title,
        this.description,
        this.billId,
        this.billTotal,
        this.executionDate,
        this.remainingDays,
        this.address,
        this.comments,
        this.views});

  ParentRequests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    statusTxt = json['status_txt'];
    canEdit = json['can_edit'];
    statuses = json['statuses'] != null
        ? new Statuses.fromJson(json['statuses'])
        : null;
    advertiser = json['advertiser'] != null
        ? new Advertiser.fromJson(json['advertiser'])
        : null;
    user = json['user'] != null ? new Advertiser.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    productType = json['product_type'] != null
        ? new Areas.fromJson(json['product_type'])
        : null;
    title = json['title'];
    description = json['description'];
    billId = json['bill_id'];
    billTotal = json['bill_total'];
    executionDate = json['execution_date'];
    remainingDays = json['remaining_days'];
    address = json['address'];
    comments = json['comments'];
    views = json['views'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['status_txt'] = this.statusTxt;
    data['can_edit'] = this.canEdit;
    if (this.statuses != null) {
      data['statuses'] = this.statuses!.toJson();
    }
    if (this.advertiser != null) {
      data['advertiser'] = this.advertiser!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['created_at'] = this.createdAt;
    if (this.productType != null) {
      data['product_type'] = this.productType!.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['bill_id'] = this.billId;
    data['bill_total'] = this.billTotal;
    data['execution_date'] = this.executionDate;
    data['remaining_days'] = this.remainingDays;
    data['address'] = this.address;
    data['comments'] = this.comments;
    data['views'] = this.views;
    return data;
  }
}

class Statuses {
  bool? payment;
  bool? transfer;
  bool? reject;
  bool? edit;
  bool? proceed;
  bool? cancel;
  bool? confirmTransfer;
  bool? pricing;
  bool? editPricing;
  bool? confirmPricing;
  bool? confirmFinished;

  Statuses(
      {this.payment,
        this.transfer,
        this.reject,
        this.edit,
        this.proceed,
        this.cancel,
        this.confirmTransfer,
        this.pricing,
        this.editPricing,
        this.confirmPricing,
        this.confirmFinished});

  Statuses.fromJson(Map<String, dynamic> json) {
    payment = json['payment'];
    transfer = json['transfer'];
    reject = json['reject'];
    edit = json['edit'];
    proceed = json['proceed'];
    cancel = json['cancel'];
    confirmTransfer = json['confirm_transfer'];
    pricing = json['pricing'];
    editPricing = json['edit_pricing'];
    confirmPricing = json['confirm_pricing'];
    confirmFinished = json['confirm_finished'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment'] = this.payment;
    data['transfer'] = this.transfer;
    data['reject'] = this.reject;
    data['edit'] = this.edit;
    data['proceed'] = this.proceed;
    data['cancel'] = this.cancel;
    data['confirm_transfer'] = this.confirmTransfer;
    data['pricing'] = this.pricing;
    data['edit_pricing'] = this.editPricing;
    data['confirm_pricing'] = this.confirmPricing;
    data['confirm_finished'] = this.confirmFinished;
    return data;
  }
}

class Advertiser {
  int? id;
  String? username;
  String? phone;
  String? whatsapp;
  String? image;
  var companyName;
  String? rate;
  var payments;
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
  var finished;
  var notFinished;
  var rejected;
  var cancelled;
  var lateTime;

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
  var facebook;
  var snapchat;
  var instagram;

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

class Pagination {
  var currentPage;
  String? firstPageUrl;
  var from;
  var lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  var perPage;
  var prevPageUrl;
  var to;
  var total;

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
