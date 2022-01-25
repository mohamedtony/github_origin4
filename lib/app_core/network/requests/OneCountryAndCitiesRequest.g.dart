// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OneCountryAndCitiesRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneCountryAndCitiesRequest _$OneCountryAndCitiesRequestFromJson(
        Map<String, dynamic> json) =>
    OneCountryAndCitiesRequest(
      countries:
          (json['countries'] as List<dynamic>?)?.map((e) => e as int).toList(),
      areas: (json['areas'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$OneCountryAndCitiesRequestToJson(
        OneCountryAndCitiesRequest instance) =>
    <String, dynamic>{
      'countries': instance.countries,
      'areas': instance.areas,
    };
