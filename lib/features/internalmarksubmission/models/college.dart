class College {
  int? iD;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? name;
  String? location;
  List<CampusDepartments>? campusDepartments;

  College(
      {this.iD,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.name,
      this.location,
      this.campusDepartments});

  College.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    name = json['name'];
    location = json['location'];
    if (json['campusDepartments'] != null) {
      campusDepartments = <CampusDepartments>[];
      json['campusDepartments'].forEach((v) {
        campusDepartments!.add(new CampusDepartments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['name'] = this.name;
    data['location'] = this.location;
    if (this.campusDepartments != null) {
      data['campusDepartments'] =
          this.campusDepartments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CampusDepartments {
  int? iD;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  int? departmentID;
  Department? department;
  int? campusID;
  Campus? campus;
  List<CampusProgrammes>? campusProgrammes;

  CampusDepartments(
      {this.iD,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.departmentID,
      this.department,
      this.campusID,
      this.campus,
      this.campusProgrammes});

  CampusDepartments.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    departmentID = json['DepartmentID'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
    campusID = json['CampusID'];
    campus =
        json['campus'] != null ? new Campus.fromJson(json['campus']) : null;
    if (json['campusProgrammes'] != null) {
      campusProgrammes = <CampusProgrammes>[];
      json['campusProgrammes'].forEach((v) {
        campusProgrammes!.add(new CampusProgrammes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['DepartmentID'] = this.departmentID;
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    data['CampusID'] = this.campusID;
    if (this.campus != null) {
      data['campus'] = this.campus!.toJson();
    }
    if (this.campusProgrammes != null) {
      data['campusProgrammes'] =
          this.campusProgrammes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Department {
  int? iD;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? name;
  Null? campusDepartments;
  Null? programmes;

  Department(
      {this.iD,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.name,
      this.campusDepartments,
      this.programmes});

  Department.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    name = json['name'];
    campusDepartments = json['campus_departments'];
    programmes = json['programmes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['name'] = this.name;
    data['campus_departments'] = this.campusDepartments;
    data['programmes'] = this.programmes;
    return data;
  }
}

class Campus {
  int? iD;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? name;
  String? location;
  Null? campusDepartments;

  Campus(
      {this.iD,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.name,
      this.location,
      this.campusDepartments});

  Campus.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    name = json['name'];
    location = json['location'];
    campusDepartments = json['campusDepartments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['name'] = this.name;
    data['location'] = this.location;
    data['campusDepartments'] = this.campusDepartments;
    return data;
  }
}

class CampusProgrammes {
  int? iD;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  int? campusDeartmentID;
  CampusDepartment? campusDepartment;
  int? programmeID;
  Programme? programme;

  CampusProgrammes(
      {this.iD,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.campusDeartmentID,
      this.campusDepartment,
      this.programmeID,
      this.programme});

  CampusProgrammes.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    campusDeartmentID = json['CampusDeartmentID'];
    campusDepartment = json['campus_department'] != null
        ? new CampusDepartment.fromJson(json['campus_department'])
        : null;
    programmeID = json['ProgrammeID'];
    programme = json['programme'] != null
        ? new Programme.fromJson(json['programme'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['CampusDeartmentID'] = this.campusDeartmentID;
    if (this.campusDepartment != null) {
      data['campus_department'] = this.campusDepartment!.toJson();
    }
    data['ProgrammeID'] = this.programmeID;
    if (this.programme != null) {
      data['programme'] = this.programme!.toJson();
    }
    return data;
  }
}

class CampusDepartment {
  int? iD;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  int? departmentID;
  Department? department;
  int? campusID;
  Campus? campus;
  Null? campusProgrammes;

  CampusDepartment(
      {this.iD,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.departmentID,
      this.department,
      this.campusID,
      this.campus,
      this.campusProgrammes});

  CampusDepartment.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    departmentID = json['DepartmentID'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
    campusID = json['CampusID'];
    campus =
        json['campus'] != null ? new Campus.fromJson(json['campus']) : null;
    campusProgrammes = json['campusProgrammes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['DepartmentID'] = this.departmentID;
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    data['CampusID'] = this.campusID;
    if (this.campus != null) {
      data['campus'] = this.campus!.toJson();
    }
    data['campusProgrammes'] = this.campusProgrammes;
    return data;
  }
}

class Programme {
  int? iD;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? name;
  String? fullName;
  int? departmentID;
  Department? department;

  Programme(
      {this.iD,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.name,
      this.fullName,
      this.departmentID,
      this.department});

  Programme.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    name = json['name'];
    fullName = json['full_name'];
    departmentID = json['DepartmentID'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['DepartmentID'] = this.departmentID;
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    return data;
  }
}
