// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdvertiserStatistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertiserStatistics _$AdvertiserStatisticsFromJson(
        Map<String, dynamic> json) =>
    AdvertiserStatistics(
      finished: json['finished'] as int?,
      not_finished: json['not_finished'] as int?,
      rejected: json['rejected'] as int?,
      cancelled: json['cancelled'] as int?,
      late_time: json['late_time'] as String?,
    );

Map<String, dynamic> _$AdvertiserStatisticsToJson(
        AdvertiserStatistics instance) =>
    <String, dynamic>{
      'finished': instance.finished,
      'not_finished': instance.not_finished,
      'rejected': instance.rejected,
      'cancelled': instance.cancelled,
      'late_time': instance.late_time,
    };
