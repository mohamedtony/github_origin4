import 'package:advertisers/app_core/network/models/AdvertiserModel.dart';
import 'package:advertisers/app_core/network/models/ProductType.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';
part 'OrderModel.g.dart';

@JsonSerializable()
class OrderModel {
  int? id;
  bool? can_edit;
  User? user;
  String? created_at;
  ProductType? product_type;
  String? title;
  String? description;
  String? status;
  AdvertiserModel? advertiserModel;
  int? comments;
  int? views;
  OrderModel({
    this.id,
    this.can_edit,
    this.user,
    this.created_at,
    this.product_type,
    this.title,
    this.description,this.status,this.advertiserModel,this.comments,this.views,
  });


  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

