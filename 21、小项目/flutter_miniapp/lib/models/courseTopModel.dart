import 'package:json_annotation/json_annotation.dart';
import "courseEntModel.dart";
part 'courseTopModel.g.dart';

@JsonSerializable()
class CourseTopModel {
    CourseTopModel();

    List<CourseEntModel> banner;
    List<CourseEntModel> ent;
    
    factory CourseTopModel.fromJson(Map<String,dynamic> json) => _$CourseTopModelFromJson(json);
    Map<String, dynamic> toJson() => _$CourseTopModelToJson(this);
}
