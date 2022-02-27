// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaymentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      subtotal: json['subtotal'] as int?,
      total: json['total'] as int?,
      added_tax: json['added_tax'] == null
          ? null
          : AddedTax.fromJson(json['added_tax'] as Map<String, dynamic>),
      copon: json['copon'] as String?,
      currency: json['currency'] as String?,
      discount: json['discount'] as int?,
      mypoints: json['mypoints'] == null
          ? null
          : AddedTax.fromJson(json['mypoints'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal,
      'added_tax': instance.added_tax,
      'mypoints': instance.mypoints,
      'copon': instance.copon,
      'discount': instance.discount,
      'total': instance.total,
      'currency': instance.currency,
    };
