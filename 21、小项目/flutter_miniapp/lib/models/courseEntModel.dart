import 'package:json_annotation/json_annotation.dart';

part 'courseEntModel.g.dart';

@JsonSerializable()
class CourseEntModel {
    CourseEntModel();

    num id;
    String name;
    
    factory CourseEntModel.fromJson(Map<String,dynamic> json) => _$CourseEntModelFromJson(json);
    Map<String, dynamic> toJson() => _$CourseEntModelToJson(this);
}
