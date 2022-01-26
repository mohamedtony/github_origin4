import 'package:json_annotation/json_annotation.dart';

part 'UpdateUserCategoryRequest.g.dart';

@JsonSerializable()
class UpdateUserCategoryRequest {

  List<int>? categories;

  UpdateUserCategoryRequest({this.categories,});

  factory UpdateUserCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserCategoryRequestToJson(this);
}
