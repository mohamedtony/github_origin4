// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddEmployeeRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEmployeeRequest _$AddEmployeeRequestFromJson(Map<String, dynamic> json) =>
    AddEmployeeRequest(
      type: json['type'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      jobTitle: json['jobTitle'] as String?,
      apperanceName: json['apperanceName'] as String?,
    );

Map<String, dynamic> _$AddEmployeeRequestToJson(AddEmployeeRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'jobTitle': instance.jobTitle,
      'apperanceName': instance.apperanceName,
    };
