class Subject {
  String? courseId;
  String? fullName;
  int? theoryMarks;
  int? assessmentMarks;
  double? passPercent;
  int? id;
  String? createdAt;
  String? updatedAt;
  Practical? practical;

  Subject(
      {this.courseId,
      this.fullName,
      this.theoryMarks,
      this.assessmentMarks,
      this.passPercent,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.practical});

  Subject.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    fullName = json['fullName'];
    theoryMarks = json['theory_marks'];
    assessmentMarks = json['assessment_marks'];
    passPercent = json['passPercent'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    practical = json['Practical'] != null
        ? new Practical.fromJson(json['Practical'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['fullName'] = this.fullName;
    data['theory_marks'] = this.theoryMarks;
    data['assessment_marks'] = this.assessmentMarks;
    data['passPercent'] = this.passPercent;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.practical != null) {
      data['Practical'] = this.practical!.toJson();
    }
    return data;
  }
}

class Practical {
  int? marks;
  double? passPercent;
  int? id;
  String? createdAt;
  String? updatedAt;
  int? subjectId;

  Practical(
      {this.marks,
      this.passPercent,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.subjectId});

  Practical.fromJson(Map<String, dynamic> json) {
    marks = json['marks'];
    passPercent = json['passPercent'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    subjectId = json['subjectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['marks'] = this.marks;
    data['passPercent'] = this.passPercent;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['subjectId'] = this.subjectId;
    return data;
  }
}
