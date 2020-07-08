import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'repo.g.dart';

@JsonSerializable()
class Repo {
  Repo();

  num id;
  String name;
  // ignore: non_constant_identifier_names
  String full_name;
  User owner;
  Repo parent;
  bool private;
  String description;
  bool fork;
  String language;
  // ignore: non_constant_identifier_names
  num forks_count;
  // ignore: non_constant_identifier_names
  num stargazers_count;
  num size;
  // ignore: non_constant_identifier_names
  String default_branch;
  // ignore: non_constant_identifier_names
  num open_issues_count;
  // ignore: non_constant_identifier_names
  String pushed_at;
  // ignore: non_constant_identifier_names
  String created_at;
  // ignore: non_constant_identifier_names
  String updated_at;
  // ignore: non_constant_identifier_names
  num subscribers_count;
  Map<String, dynamic> license;

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
