class Notice {
  int? iD;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? title;
  String? details;

  Notice(
      {this.iD,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.title,
      this.details});

  Notice.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    title = json['title'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    data['DeletedAt'] = deletedAt;
    data['title'] = title;
    data['details'] = details;
    return data;
  }
}
