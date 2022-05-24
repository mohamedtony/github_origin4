// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetMyRequestsFilterForm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyRequestsFilterForm _$GetMyRequestsFilterFormFromJson(
        Map<String, dynamic> json) =>
    GetMyRequestsFilterForm(
      filters: (json['filters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      sorts: (json['sorts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    )..countries = (json['countries'] as List<dynamic>?)
        ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$GetMyRequestsFilterFormToJson(
        GetMyRequestsFilterForm instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'sorts': instance.sorts,
      'countries': instance.countries,
    };
