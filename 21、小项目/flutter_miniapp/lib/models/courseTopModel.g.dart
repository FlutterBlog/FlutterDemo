// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courseTopModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseTopModel _$CourseTopModelFromJson(Map<String, dynamic> json) {
  return CourseTopModel()
    ..banner = (json['banner'] as List)
        ?.map((e) => e == null
            ? null
            : CourseEntModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..ent = (json['ent'] as List)
        ?.map((e) => e == null
            ? null
            : CourseEntModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CourseTopModelToJson(CourseTopModel instance) =>
    <String, dynamic>{'banner': instance.banner, 'ent': instance.ent};
