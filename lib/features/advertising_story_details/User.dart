import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
part 'User.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String profileImageUrl;

  const User({
    required this.name,
    required this.profileImageUrl,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
