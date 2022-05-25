import 'package:json_annotation/json_annotation.dart';

part 'GetNotificationRequest.g.dart';

@JsonSerializable()
class GetNotificationRequest {

  String?filters;
  int? page;
  String?sort;
  String? from_date;
  String?to_date;

  GetNotificationRequest({this.sort,this.page,this.filters,this.from_date,this.to_date});

  factory GetNotificationRequest.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetNotificationRequestToJson(this);
}