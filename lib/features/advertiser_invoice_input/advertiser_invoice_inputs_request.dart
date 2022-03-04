
class AdvertiserInvoiceInputsRequest {
  String? method;
  int? adsTypeId;
  String? paymentMethod;
  List<BillItems>? billItems;
  List<BillItems>? discounts;
  int? couponId;
  String? executionDate;

  AdvertiserInvoiceInputsRequest(
      {this.adsTypeId,
        this.method,
        this.paymentMethod,
        this.billItems,
        this.discounts,
        this.couponId,
        this.executionDate});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ads_type_id'] = this.adsTypeId;
    data['payment_method'] = this.paymentMethod;
    if (this.billItems != null) {
      data['bill_items'] = this.billItems!.map((v) => v.toJson()).toList();
    }
    if (this.discounts != null) {
      data['discounts'] = this.discounts!.map((v) => v.toJson()).toList();
    }
    data['coupon_id'] = this.couponId;
    data['_method'] = this.method;
    data['execution_date'] = this.executionDate;
    return data;
  }
}

class BillItems {
  String? text;
  double? price;

  BillItems({this.text, this.price});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['price'] = this.price;
    return data;
  }
}

// class Discounts {
//   String? text;
//   double? price;
//
//   Discounts({this.text, this.price});
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['text'] = this.text;
//     data['price'] = this.price;
//     return data;
//   }
// }


// class AdvertiserInvoiceInputsRequest {
//   String? countryId,governateId,cityId,addressName,phone,block,street,avenue,house,notes;
//
//   AdvertiserInvoiceInputsRequest({
//     this.countryId,
//     this.governateId,
//     this.cityId,
//     this.addressName,
//     this.phone,
//     this.block,
//     this.street,
//     this.avenue,
//     this.house,
//     this.notes,
//   });
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['country_id'] = this.countryId;
//     data['governate_id'] = this.governateId;
//     data['city_id'] = this.cityId;
//     data['address_name'] = this.addressName;
//     data['phone'] = this.phone;
//     data['block'] = this.block;
//     data['block'] = this.block;
//     data['street'] = this.street;
//     data['avenue'] = this.avenue;
//     data['house'] = this.house;
//     data['notes'] = this.notes;
//     return data;
//   }
// }
