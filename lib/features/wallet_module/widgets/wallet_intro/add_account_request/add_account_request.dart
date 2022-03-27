
class AddAccountRequest {
  String? type;

  Info? info;
  // List<Info>? info;


  AddAccountRequest(
      {
        this.type,
        this.info,
      });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }    // if (this.info != null) {
    //   data['info'] = this.info!.map((v) => v.toJson()).toList();
    // }

    return data;
  }
}

class Info {
  String? mobile;
  String? cardUsername;
  String? expirationMonth;
  String? expirationYear;
  String? cvv;
  String? cardNumber;


  Info({this.mobile, this.cardUsername,this.cardNumber,this.cvv,this.expirationMonth,this.expirationYear});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['card_username'] = this.cardUsername;
    data['expiration_month'] = this.expirationMonth;
    data['expiration_year'] = this.expirationYear;
    data['cvv'] = this.cvv;
    data['card_number'] = this.cardNumber;
    return data;
  }
}
