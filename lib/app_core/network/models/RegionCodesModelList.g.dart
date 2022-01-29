// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegionCodesModelList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionCodesModelList _$RegionCodesModelListFromJson(
        Map<String, dynamic> json) =>
    RegionCodesModelList(
      codes: (json['codes'] as List<dynamic>?)
          ?.map((e) => RegionCodesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegionCodesModelListToJson(
        RegionCodesModelList instance) =>
    <String, dynamic>{
      'codes': instance.codes,
    };
