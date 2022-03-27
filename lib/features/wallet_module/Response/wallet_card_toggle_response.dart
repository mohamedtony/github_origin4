class WalletToggleCardsDataResponse {
  int? status;
  String? message;
  dynamic pagination;

  WalletToggleCardsDataResponse({this.status, this.message, this.pagination});

  WalletToggleCardsDataResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['pagination'] = this.pagination;
    return data;
  }
}
