class ChargeResponse {
  int? status;
  String? message;
  Data? data;

  ChargeResponse({
    this.status,
    this.message,
    this.data,
  });

  ChargeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? pending;
  int? ready;
  int? wallet;
  List<Cards>? cards;

  Data({this.pending, this.ready, this.wallet, this.cards});

  Data.fromJson(Map<String, dynamic> json) {
    pending = json['pending'];
    ready = json['ready'];
    wallet = json['wallet'];
    if (json['cards'] != null) {
      cards = <Cards>[];
      json['cards'].forEach((v) {
        cards!.add(Cards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pending'] = pending;
    data['ready'] = ready;
    data['wallet'] = wallet;
    if (cards != null) {
      data['cards'] = cards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cards {
  int? id;
  bool? status;
  String? type;
  Info? info;

  Cards({this.id, this.status, this.type, this.info});

  Cards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    type = json['type'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['type'] = type;
    if (info != null) {
      data['info'] = info!.toJson();
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

  Info(
      {this.cvv,
      this.cardUsername,
      this.expirationYear,
      this.expirationMonth,
      this.cardNumberFour});

  Info.fromJson(Map<String, dynamic> json) {
    cvv = json['cvv'];
    cardUsername = json['card_username'];
    expirationYear = json['expiration_year'];
    expirationMonth = json['expiration_month'];
    cardNumberFour = json['card_number_four'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cvv'] = cvv;
    data['card_username'] = cardUsername;
    data['expiration_year'] = expirationYear;
    data['expiration_month'] = expirationMonth;
    data['card_number_four'] = cardNumberFour;
    return data;
  }
}
