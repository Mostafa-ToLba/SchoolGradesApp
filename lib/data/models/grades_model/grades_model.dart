

import 'dart:convert';

List<GradesModel> gradesModelFromJson(String str) => List<GradesModel>.from(json.decode(str).map((x) => GradesModel.fromJson(x)));

String gradesModelToJson(List<GradesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GradesModel {
  final String? id;
  final String? name;
  final String? nameAr;
  final String? nameEn;
  final String? schoolId;

  GradesModel({
    this.id,
    this.name,
    this.nameAr,
    this.nameEn,
    this.schoolId,
  });

  factory GradesModel.fromJson(Map<String, dynamic> json) => GradesModel(
    id: json["id"],
    name: json["name"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    schoolId: json["school_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_ar": nameAr,
    "name_en": nameEn,
    "school_id": schoolId,
  };
}
