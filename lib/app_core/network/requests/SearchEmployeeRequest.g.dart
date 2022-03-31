// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchEmployeeRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchEmployeeRequest _$SearchEmployeeRequestFromJson(
        Map<String, dynamic> json) =>
    SearchEmployeeRequest(
      type: json['type'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$SearchEmployeeRequestToJson(
        SearchEmployeeRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'phone': instance.phone,
    };
