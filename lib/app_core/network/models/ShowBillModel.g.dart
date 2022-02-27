// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShowBillModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowBillModel _$ShowBillModelFromJson(Map<String, dynamic> json) =>
    ShowBillModel(
      status: json['status'] as String?,
      id: json['id'] as int?,
      status_txt: json['status_txt'] as String?,
      payment: json['payment'] == null
          ? null
          : PaymentModel.fromJson(json['payment'] as Map<String, dynamic>),
      discounts: (json['discounts'] as List<dynamic>?)
          ?.map((e) => DiscountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      earned_points: json['earned_points'] as int?,
      execution_date: json['execution_date'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowBillModelToJson(ShowBillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'status_txt': instance.status_txt,
      'items': instance.items,
      'discounts': instance.discounts,
      'payment': instance.payment,
      'earned_points': instance.earned_points,
      'execution_date': instance.execution_date,
    };
