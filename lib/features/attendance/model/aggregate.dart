class Aggregate {
  int? totalLectures;
  List<AttendanceDetails>? attendanceDetails;

  Aggregate({this.totalLectures, this.attendanceDetails});

  Aggregate.fromJson(Map<String, dynamic> json) {
    totalLectures = json['totalLectures'];
    if (json['attendanceDetails'] != null) {
      attendanceDetails = <AttendanceDetails>[];
      json['attendanceDetails'].forEach((v) {
        attendanceDetails!.add(new AttendanceDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalLectures'] = this.totalLectures;
    if (this.attendanceDetails != null) {
      data['attendanceDetails'] =
          this.attendanceDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttendanceDetails {
  int? studentId;
  String? name;
  String? rollNumber;
  int? presentDays;

  AttendanceDetails(
      {this.studentId, this.name, this.rollNumber, this.presentDays});

  AttendanceDetails.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    name = json['name'];
    rollNumber = json['rollNumber'];
    presentDays = json['presentDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['name'] = this.name;
    data['rollNumber'] = this.rollNumber;
    data['presentDays'] = this.presentDays;
    return data;
  }
}
