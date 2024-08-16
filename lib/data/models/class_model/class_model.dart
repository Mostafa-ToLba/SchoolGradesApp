

import 'dart:convert';

List<ClassesModel> classesModelFromJson(String str) => List<ClassesModel>.from(json.decode(str).map((x) => ClassesModel.fromJson(x)));

String classesModelToJson(List<ClassesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassesModel {
  final String? id;
  final String? name;
  final String? nameAr;
  final String? nameEn;
  final String? gradeId;
  final String? schoolId;

  ClassesModel({
    this.id,
    this.name,
    this.nameAr,
    this.nameEn,
    this.gradeId,
    this.schoolId,
  });

  factory ClassesModel.fromJson(Map<String, dynamic> json) => ClassesModel(
    id: json["id"],
    name: json["name"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    gradeId: json["grade_id"],
    schoolId: json["school_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_ar": nameAr,
    "name_en": nameEn,
    "grade_id": gradeId,
    "school_id": schoolId,
  };
}
