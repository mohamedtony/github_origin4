import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'GetCategoryModel.g.dart';

@JsonSerializable()
class GetCategoryModel {
  List<CategoryModel>? user_categories;
  List<CategoryModel>? all_categories;

  GetCategoryModel({
    this.user_categories,
    this.all_categories,
  });
 /* String itemAsStringByName() {
    return this.months_count.toString()+" أشهر ";
  }*/
  factory GetCategoryModel.fromJson(Map<String, dynamic> json) => _$GetCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoryModelToJson(this);
}

