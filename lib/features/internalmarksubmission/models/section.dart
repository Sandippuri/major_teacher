class Section {
  String? name;
  int? campusProgrammeId;
  int? batch;
  String? group;
  int? id;
  String? createdAt;
  String? updatedAt;

  Section(
      {this.name,
      this.campusProgrammeId,
      this.batch,
      this.group,
      this.id,
      this.createdAt,
      this.updatedAt});

  Section.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    campusProgrammeId = json['campusProgrammeId'];
    batch = json['batch'];
    group = json['group'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['campusProgrammeId'] = this.campusProgrammeId;
    data['batch'] = this.batch;
    data['group'] = this.group;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
