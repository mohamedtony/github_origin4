class WalletIntroResponse {
  int? status;
  String? message;
  List<CardData>? cardData;
  dynamic pagination;

  var error;
  String? errorMsg;

  WalletIntroResponse.makeError({this.error, this.errorMsg});
  WalletIntroResponse.fromJsonError({
    required Map<String, dynamic> json,
    this.error,
  }) {
    status = json['status'];
    message = json['message'];
  }

  WalletIntroResponse({this.status, this.message, this.cardData, this.pagination});

  WalletIntroResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      cardData = <CardData>[];
      json['data'].forEach((v) {
        cardData!.add(new CardData.fromJson(v));
      });
    }
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.cardData != null) {
      data['data'] = this.cardData!.map((v) => v.toJson()).toList();
    }
    data['pagination'] = this.pagination;
    return data;
  }
}

class CardData {
  int? id;
  bool? status;
  String? type;
  Info? info;

  CardData({this.id, this.status, this.type, this.info});

  CardData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    type = json['type'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['type'] = this.type;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class Info {
  String? cvv;
  String? cardUsername;
  String? expirationYear;
  String? expirationMonth;
  String? cardNumberFour;
  String? mobile;

  Info(
      {this.cvv,
        this.cardUsername,
        this.expirationYear,
        this.expirationMonth,
        this.mobile,
        this.cardNumberFour});

  Info.fromJson(Map<String, dynamic> json) {
    cvv = json['cvv'];
    cardUsername = json['card_username'];
    expirationYear = json['expiration_year'];
    expirationMonth = json['expiration_month'];
    cardNumberFour = json['card_number_four'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cvv'] = this.cvv;
    data['card_username'] = this.cardUsername;
    data['expiration_year'] = this.expirationYear;
    data['expiration_month'] = this.expirationMonth;
    data['card_number_four'] = this.cardNumberFour;
    data['mobile'] = this.mobile;
    return data;
  }
}
