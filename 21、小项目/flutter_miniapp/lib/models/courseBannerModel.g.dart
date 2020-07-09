// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courseBannerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseBannerModel _$CourseBannerModelFromJson(Map<String, dynamic> json) {
  return CourseBannerModel()
    ..id = json['id'] as num
    ..title = json['title'] as String
    ..title1 = json['title1'] as String
    ..pic = json['pic'] as String
    ..url = json['url'] as String
    ..intro = json['intro'] as String;
}

Map<String, dynamic> _$CourseBannerModelToJson(CourseBannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title1': instance.title1,
      'pic': instance.pic,
      'url': instance.url,
      'intro': instance.intro
    };
