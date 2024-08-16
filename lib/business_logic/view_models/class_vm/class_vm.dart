
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tkwinsa_task/business_logic/setup/base_notifier.dart';
import 'package:tkwinsa_task/data/cache_helper/cache_helper.dart';
import 'package:tkwinsa_task/data/models/class_model/class_model.dart';
import 'package:tkwinsa_task/utils/generalMethods/general_methods.dart';

class ClassViewModel extends BaseNotifier {

  //***************** get classes **********************
 List<ClassesModel>? classesModel ;
  void getClasses() async {
    classesModel =null;
    setBusy();
    try {
      Response<dynamic> res = await api.getClasses();
      classesModel = classesModelFromJson(json.encode(res.data));
      print(res.data);
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  //***************** add classes **********************

  final formKey = GlobalKey<FormState>();
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController engNameController = TextEditingController();

  void addClasses({required BuildContext context,required gradeId}) async {
    final String schoolId = CacheHelper.getData(key: PrefKeys.schoolId);
    Map<String, dynamic> body = {
      "name_ar": arabicNameController.text,
      "name_en": engNameController.text,
      "grade_id": gradeId,
      "school_id": schoolId,
    };
    setBusy();
    try {
      Response<dynamic> res = await api.addClasses(body: body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        General.showToast(
          message: 'classes added successfully',
          textColor: Colors.white,
          backColor: const Color(0xfff27350),
        );
        arabicNameController.clear();
        engNameController.clear();
      }
      else {
        // Handle other potential errors
        General.showToast(
          message: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى',
          textColor: Colors.red,
        );
      }

    } catch (e) {

      Logger().e(e.toString());
      setError();
    }
    getClasses();
    setIdle();
  }

 //**************** search classes *******************//

 TextEditingController searchTextController = TextEditingController();
 late List<ClassesModel> searchedForClasses;

 void addSearchedForGrades(String searchedCharacter) {
   searchedForClasses = classesModel!.where((character) => character.nameEn!.toLowerCase().startsWith(searchedCharacter)||character.nameEn!.toLowerCase().contains(searchedCharacter))
       .toList();
   notifyListeners();
 }

 // **************** update classes ******************//

 void updateClass({required BuildContext context,required String id,required String schoolId,
   required String gradeId,
   required String nameArController,required String nameEnController}) async {
   Map<String, dynamic> body = {
     "name_ar": nameArController,
     "name_en": nameEnController,
     "grade_id": gradeId,
     "school_id": schoolId,
   };
   setBusy();
   try {
     Response<dynamic> res = await api.updateClasses(body: body,id:id);
     if (res.statusCode == 200) {
       General.showToast(
         message: 'updated successfully',
         textColor: Colors.white,
         backColor: const Color(0xfff27350),
       );
     }
     else {
       // Handle other potential errors
       General.showToast(
         message: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى',
         textColor: Colors.red,
       );
     }
     // then get grades after update
     getClasses();
   } catch (e) {

     Logger().e(e.toString());
     setError();
   }
   setIdle();
 }


 // **************** delete classes ******************//

 void deleteClasses({required id}) async {
   setBusy();
   try {
     await api.deleteClasses(id: id);
     General.showToast(
       message: 'class deleted successfully',
       textColor: Colors.white,
       backColor: const Color(0xfff27350),
     );
     // then get grades after update
     getClasses();
   } catch (e) {
     print(e.toString());
     Logger().e(e.toString());
     setError();
   }
   setIdle();
 }

}
