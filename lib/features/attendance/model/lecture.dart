class Lecture {
  String? date;
  int? id;
  String? createdAt;
  String? updatedAt;
  int? courseId;

  Lecture({this.date, this.id, this.createdAt, this.updatedAt, this.courseId});

  Lecture.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['courseId'] = this.courseId;
    return data;
  }
}
