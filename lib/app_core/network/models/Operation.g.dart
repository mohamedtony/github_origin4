// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operation _$OperationFromJson(Map<String, dynamic> json) => Operation(
      id: json['id'] as int?,
      employeeId: json['employeeId'] as int?,
      action: json['action'] as String?,
      actionableType: json['actionableType'] as String?,
      actionableId: json['actionableId'] as int?,
      actionable: json['actionable'] == null
          ? null
          : Actionable.fromJson(json['actionable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OperationToJson(Operation instance) => <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'action': instance.action,
      'actionableType': instance.actionableType,
      'actionableId': instance.actionableId,
      'actionable': instance.actionable,
    };
