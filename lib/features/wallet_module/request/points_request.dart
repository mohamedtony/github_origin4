class PointsRequest {
  dynamic points;

  PointsRequest({required this.points});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['points'] = points;
    return data;
  }
}
