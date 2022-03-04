class AdvertiserInvoiceInputsResponse {
  int? status;
  String? message;
  Data? data;
  var pagination;

  var error;
  String? errorMsg;

  AdvertiserInvoiceInputsResponse.makeError({this.error, this.errorMsg});
  AdvertiserInvoiceInputsResponse.fromJsonError({
    required Map<String, dynamic> json,
    this.error,
  }) {
    status = json['status'];
    message = json['message'];
  }


  AdvertiserInvoiceInputsResponse(
      {this.status, this.message, this.data, this.pagination});

  AdvertiserInvoiceInputsResponse.fromJson(Map<String, dynamic> json) {
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
  var status;
  var statusTxt;
  List<Items>? items;
  List<Items>? discounts;
  Payment? payment;
  var earnedPoints;
  String? executionDate;
  AdsType? adsType;
  List<Types>? types;
  int? commission;
  int? addedTax;

  Data(
      {this.id,
        this.status,
        this.statusTxt,
        this.items,
        this.discounts,
        this.payment,
        this.earnedPoints,
        this.executionDate,
        this.addedTax,
        this.commission,
        this.types,
       });

  Data.fromJson(Map<String, dynamic> json) {
    adsType = json['ads_type'] != null
        ? new AdsType.fromJson(json['ads_type'])
        : null;
    id = json['id'];
    status = json['status'];
    statusTxt = json['status_txt'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    if (json['discounts'] != null) {
      discounts = <Items>[];
      json['discounts'].forEach((v) {
        discounts!.add(new Items.fromJson(v));
      });
    }
    payment =
    json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
    earnedPoints = json['earned_points'];
    executionDate = json['execution_date'];

    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
    commission = json['commission'];
    addedTax = json['added_tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adsType != null) {
      data['ads_type'] = this.adsType!.toJson();
    }
    data['id'] = this.id;
    data['status'] = this.status;
    data['status_txt'] = this.statusTxt;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.discounts != null) {
      data['discounts'] = this.discounts!.map((v) => v.toJson()).toList();
    }
    if (this.payment != null) {
      data['payment'] = this.payment!.toJson();
    }
    data['earned_points'] = this.earnedPoints;
    data['execution_date'] = this.executionDate;
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    data['commission'] = this.commission;
    data['added_tax'] = this.addedTax;
    return data;
  }
}

class Items {
  String? text;
  var price;

  Items({this.text, this.price});

  Items.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['price'] = this.price;
    return data;
  }
}

class Payment {
  var subtotal;
  AddedTax? addedTax;
  AddedTax? mypoints;
  var copon;
  var discount;
  var total;
  String? currency;

  Payment(
      {this.subtotal,
        this.addedTax,
        this.mypoints,
        this.copon,
        this.discount,
        this.total,
        this.currency});

  Payment.fromJson(Map<String, dynamic> json) {
    subtotal = json['subtotal'];
    addedTax = json['added_tax'] != null
        ? new AddedTax.fromJson(json['added_tax'])
        : null;
    mypoints = json['mypoints'] != null
        ? new AddedTax.fromJson(json['mypoints'])
        : null;
    copon = json['copon'];
    discount = json['discount'];
    total = json['total'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subtotal'] = this.subtotal;
    if (this.addedTax != null) {
      data['added_tax'] = this.addedTax!.toJson();
    }
    if (this.mypoints != null) {
      data['mypoints'] = this.mypoints!.toJson();
    }
    data['copon'] = this.copon;
    data['discount'] = this.discount;
    data['total'] = this.total;
    data['currency'] = this.currency;
    return data;
  }
}

class AddedTax {
  var percentage;
  var value;

  AddedTax({this.percentage, this.value});

  AddedTax.fromJson(Map<String, dynamic> json) {
    percentage = json['percentage'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['percentage'] = this.percentage;
    data['value'] = this.value;
    return data;
  }
}

class Types {
  int? id;
  String? name;

  Types({this.id, this.name});

  Types.fromJson(Map<String, dynamic> json) {
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

class AdsType {
  int? id;
  String? name;

  AdsType({this.id, this.name});

  AdsType.fromJson(Map<String, dynamic> json) {
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