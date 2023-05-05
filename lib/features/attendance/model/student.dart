class Student {
  String? name;
  String? dateOfBirth;
  String? citizenshipNumber;
  int? id;
  String? createdAt;
  String? updatedAt;
  int? sectionId;

  Student(
      {this.name,
      this.dateOfBirth,
      this.citizenshipNumber,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.sectionId});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dateOfBirth = json['dateOfBirth'];
    citizenshipNumber = json['citizenshipNumber'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sectionId = json['sectionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dateOfBirth'] = this.dateOfBirth;
    data['citizenshipNumber'] = this.citizenshipNumber;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['sectionId'] = this.sectionId;
    return data;
  }
}
