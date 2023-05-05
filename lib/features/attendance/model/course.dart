class Course {
  int? subjectId;
  int? sectionId;
  String? teacherId;
  String? sectionName;
  String? batch;
  String? name;
  int? id;
  String? createdAt;
  String? updatedAt;

  Course(
      {this.subjectId,
      this.sectionId,
      this.teacherId,
      this.sectionName,
      this.batch,
      this.name,
      this.id,
      this.createdAt,
      this.updatedAt});

  Course.fromJson(Map<String, dynamic> json) {
    subjectId = json['subjectId'];
    sectionId = json['sectionId'];
    teacherId = json['teacherId'];
    sectionName = json['sectionName'];
    batch = json['batch'];
    name = json['name'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subjectId'] = this.subjectId;
    data['sectionId'] = this.sectionId;
    data['teacherId'] = this.teacherId;
    data['sectionName'] = this.sectionName;
    data['batch'] = this.batch;
    data['name'] = this.name;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
