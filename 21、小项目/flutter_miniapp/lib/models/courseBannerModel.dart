import 'package:json_annotation/json_annotation.dart';

part 'courseBannerModel.g.dart';

@JsonSerializable()
class CourseBannerModel {
    CourseBannerModel();

    num id;
    String title;
    String title1;
    String pic;
    String url;
    String intro;
    
    factory CourseBannerModel.fromJson(Map<String,dynamic> json) => _$CourseBannerModelFromJson(json);
    Map<String, dynamic> toJson() => _$CourseBannerModelToJson(this);
}
