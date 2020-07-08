import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  String login;
  // ignore: non_constant_identifier_names
  String avatar_url;
  String type;
  String name;
  String company;
  String blog;
  String location;
  String email;
  bool hireable;
  String bio;
  // ignore: non_constant_identifier_names
  num public_repos;
  num followers;
  num following;
  // ignore: non_constant_identifier_names
  String created_at;
  // ignore: non_constant_identifier_names
  String updated_at;
  // ignore: non_constant_identifier_names
  num total_private_repos;
  // ignore: non_constant_identifier_names
  num owned_private_repos;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
