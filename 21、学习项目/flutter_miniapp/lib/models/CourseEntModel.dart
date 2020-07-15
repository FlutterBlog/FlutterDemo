class CourseEntModel {
  var id;
  String name;

  CourseEntModel(this.id, this.name);

  CourseEntModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'] as String;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
      };
}
