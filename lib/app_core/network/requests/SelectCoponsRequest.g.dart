// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SelectCoponsRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectCoponsRequest _$SelectCoponsRequestFromJson(Map<String, dynamic> json) =>
    SelectCoponsRequest(
      copons: (json['copons'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$SelectCoponsRequestToJson(
        SelectCoponsRequest instance) =>
    <String, dynamic>{
      'copons': instance.copons,
    };
