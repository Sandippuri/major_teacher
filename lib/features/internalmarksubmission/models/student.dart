class Student {
  String? name;
  String? dateOfBirth;
  String? citizenshipNumber;
  String? rollNumber;
  int? sectionId;
  int? id;
  String? createdAt;
  String? updatedAt;

  Student(
      {this.name,
      this.dateOfBirth,
      this.citizenshipNumber,
      this.rollNumber,
      this.sectionId,
      this.id,
      this.createdAt,
      this.updatedAt});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dateOfBirth = json['dateOfBirth'];
    citizenshipNumber = json['citizenshipNumber'];
    rollNumber = json['rollNumber'];
    sectionId = json['sectionId'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dateOfBirth'] = this.dateOfBirth;
    data['citizenshipNumber'] = this.citizenshipNumber;
    data['rollNumber'] = this.rollNumber;
    data['sectionId'] = this.sectionId;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
