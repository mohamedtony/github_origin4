class WithdrawResponse {
  int? status;
  String? message;
  Data? data;

  WithdrawResponse({this.status, this.message, this.data});

  WithdrawResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class PendingWithdrawRequest {
  int? id;
  String? status;
  int? userId;
  int? billingCardId;
  dynamic total;
  dynamic payment;

  PendingWithdrawRequest(
      {this.id,
      this.status,
      this.userId,
      this.billingCardId,
      this.total,
      this.payment});

  PendingWithdrawRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    userId = json['user_id'];
    billingCardId = json['billing_card_id'];
    total = json['total'];
    payment = json['payment'];
  }
}

class Data {
  dynamic pending;
  dynamic ready;
  dynamic wallet;
  List<PendingWithdrawRequest>? pendingWithdrawRequest;
  List<Cards>? cards;

  Data(
      {this.pending,
      this.ready,
      this.wallet,
      this.pendingWithdrawRequest,
      this.cards});

  Data.fromJson(Map<String, dynamic> json) {
    pending = json['pending'];
    ready = json['ready'];
    wallet = json['wallet'];
    if (json['pending_withdarwn_request'] != null) {
      pendingWithdrawRequest = <PendingWithdrawRequest>[];
      json['pending_withdarwn_request'].forEach((v) {
        pendingWithdrawRequest!.add(PendingWithdrawRequest.fromJson(v));
      });
    }
    if (json['cards'] != null) {
      cards = <Cards>[];
      json['cards'].forEach((v) {
        cards!.add(Cards.fromJson(v));
      });
    }
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
}
