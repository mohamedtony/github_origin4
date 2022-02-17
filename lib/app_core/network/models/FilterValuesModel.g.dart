// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FilterValuesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterValuesModel _$FilterValuesModelFromJson(Map<String, dynamic> json) =>
    FilterValuesModel(
      latest: json['latest'] as String?,
      cancelled: json['cancelled'] as String?,
      inprogress: json['inprogress'] as String?,
      oldest: json['oldest'] as String?,
      pending_confirm: json['pending_confirm'] as String?,
      pending_payment: json['pending_payment'] as String?,
      rejected: json['rejected'] as String?,
    );

Map<String, dynamic> _$FilterValuesModelToJson(FilterValuesModel instance) =>
    <String, dynamic>{
      'latest': instance.latest,
      'oldest': instance.oldest,
      'pending_payment': instance.pending_payment,
      'pending_confirm': instance.pending_confirm,
      'rejected': instance.rejected,
      'inprogress': instance.inprogress,
      'cancelled': instance.cancelled,
    };
