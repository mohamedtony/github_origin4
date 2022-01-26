// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CountriesAreasModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesAreasModel _$CountriesAreasModelFromJson(Map<String, dynamic> json) =>
    CountriesAreasModel(
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      areas: (json['areas'] as List<dynamic>?)
          ?.map((e) => Area.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountriesAreasModelToJson(
        CountriesAreasModel instance) =>
    <String, dynamic>{
      'countries': instance.countries,
      'areas': instance.areas,
    };
