import 'package:json_annotation/json_annotation.dart';
part 'SocialsModel.g.dart';

@JsonSerializable()
class SocialsModel {


  String? facebook,
  snapchat,
  instagram;


  SocialsModel({
    this.facebook,this.snapchat,this.instagram
  });

  factory SocialsModel.fromJson(Map<String, dynamic> json) => _$SocialsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialsModelToJson(this);
}

