import 'package:json_annotation/json_annotation.dart';
part 'UploadFileModel.g.dart';

@JsonSerializable()
class UploadFileModel {
  String? type,link;
  UploadFileModel({
    this.type,this.link
  });

  factory UploadFileModel.fromJson(Map<String, dynamic> json) => _$UploadFileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileModelToJson(this);
}

