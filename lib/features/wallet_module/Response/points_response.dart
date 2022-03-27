class PointsResponse {
  int? status;
  String? message;
  Data? data;

  PointsResponse({
    this.status,
    this.message,
    this.data,
  });

  PointsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  dynamic points;
  dynamic pointsBalance;
  dynamic wallet;

  Data({this.points, this.pointsBalance, this.wallet});

  Data.fromJson(Map<String, dynamic> json) {
    points = json['points'];
    pointsBalance = json['points_balance'];
    wallet = json['wallet'];
  }
}
