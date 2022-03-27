// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['id'] as int?,
      status: json['status'] as int?,
      type: json['type'] as String?,
      apperanceName: json['apperanceName'] as String?,
      jobTitle: json['jobTitle'] as String?,
      createAt: json['createAt'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'type': instance.type,
      'apperanceName': instance.apperanceName,
      'jobTitle': instance.jobTitle,
      'createAt': instance.createAt,
      'user': instance.user,
    };
