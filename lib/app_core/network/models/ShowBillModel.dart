import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/AdvertiserModel.dart';
import 'package:advertisers/app_core/network/models/DiscountModel.dart';
import 'package:advertisers/app_core/network/models/Item.dart';
import 'package:advertisers/app_core/network/models/PaymentModel.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ShowBillModel.g.dart';

@JsonSerializable()
class ShowBillModel {

  int? id;
  String? status,status_txt;
  List<Item>? items;
  AdTypeModel? ads_type;
  List<DiscountModel>? discounts;
  PaymentModel? payment;
  int? earned_points;
  String? execution_date;
  ShowBillModel({
    this.status,this.id,this.status_txt,this.payment,this.discounts,
    this.earned_points,this.execution_date,this.items,this.ads_type
  });

  factory ShowBillModel.fromJson(Map<String, dynamic> json) => _$ShowBillModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowBillModelToJson(this);
}

