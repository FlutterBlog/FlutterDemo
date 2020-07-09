class CourseListModel {
  String name;
  var type;
  List course;

  CourseListModel(this.name, this.type, this.course);

  CourseListModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        type = json['type'],
        course = json['course'] as List;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'type': type,
        'course': course,
      };
}

//公开课
class CourseFreeClassModel {
  String id;
  String name;
  String subject;
  String subtitle1;
  String subtitle2;

  CourseFreeClassModel(
    this.id,
    this.name,
    this.subject,
    this.subtitle1,
    this.subtitle2,
  );

  CourseFreeClassModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        subject = json['subject'],
        subtitle1 = json['subtitle1'],
        subtitle2 = json['subtitle2'];
}

//班课
class CourseVipClassModel {
  String id;
  String name;
  String subject;
  String subtitle;
  String template;
  String price;
  String unums;

  CourseVipClassModel(
    this.id,
    this.name,
    this.subject,
    this.subtitle,
    this.template,
    this.price,
    this.unums,
  );

  CourseVipClassModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        subject = json['subject'],
        subtitle = json['subtitle'],
        template = json['template'],
        price = json['price'],
        unums = json['unums'];
}
