import 'package:advertisers/app_core/network/models/AddedTax.dart';
import 'package:advertisers/app_core/network/models/CommissionModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'PaymentModel.g.dart';

@JsonSerializable()
class PaymentModel {
  int? subtotal;
  AddedTax? added_tax;
  AddedTax?  mypoints;
  String? copon;
  int? discount;
  int? total;
  CommissionModel? commissionModel;
  String? currency;
  PaymentModel({
    this.subtotal,
    this.total,this.added_tax,this.copon,
    this.currency,this.discount,this.mypoints,this.commissionModel
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}

