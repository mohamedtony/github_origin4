
import 'package:json_annotation/json_annotation.dart';


part 'AdvertiserStatistics.g.dart';

@JsonSerializable()
class AdvertiserStatistics {
  int? finished,
  not_finished,
  rejected,
  cancelled;
  String? late_time;




  AdvertiserStatistics({this.finished, this.not_finished, this.rejected,this.cancelled,this.late_time});

  factory AdvertiserStatistics.fromJson(Map<String, dynamic> json) => _$AdvertiserStatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertiserStatisticsToJson(this);
}

