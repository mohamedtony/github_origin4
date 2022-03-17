// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StatusesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusesModel _$StatusesModelFromJson(Map<String, dynamic> json) =>
    StatusesModel(
      payment: json['payment'] as bool?,
      cancel: json['cancel'] as bool?,
      confirm: json['confirm'] as bool?,
      edit: json['edit'] as bool?,
      reject: json['reject'] as bool?,
      transfer: json['transfer'] as bool?,
      confirm_pricing: json['confirm_pricing'] as bool?,
    );

Map<String, dynamic> _$StatusesModelToJson(StatusesModel instance) =>
    <String, dynamic>{
      'payment': instance.payment,
      'reject': instance.reject,
      'transfer': instance.transfer,
      'confirm': instance.confirm,
      'confirm_pricing': instance.confirm_pricing,
      'edit': instance.edit,
      'cancel': instance.cancel,
    };
