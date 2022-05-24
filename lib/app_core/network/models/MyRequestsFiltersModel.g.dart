// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyRequestsFiltersModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyRequestsFiltersModel _$MyRequestsFiltersModelFromJson(
        Map<String, dynamic> json) =>
    MyRequestsFiltersModel(
      pending_cofirm: json['pending_cofirm'] as String?,
      pending_execution: json['pending_execution'] as String?,
      rejected: json['rejected'] as String?,
      inprogress: json['inprogress'] as String?,
      cancelled: json['cancelled'] as String?,
      pending_payment: json['pending_payment'] as String?,
      pending_pricing: json['pending_pricing'] as String?,
    );

Map<String, dynamic> _$MyRequestsFiltersModelToJson(
        MyRequestsFiltersModel instance) =>
    <String, dynamic>{
      'pending_pricing': instance.pending_pricing,
      'pending_payment': instance.pending_payment,
      'rejected': instance.rejected,
      'pending_execution': instance.pending_execution,
      'inprogress': instance.inprogress,
      'pending_cofirm': instance.pending_cofirm,
      'cancelled': instance.cancelled,
    };
