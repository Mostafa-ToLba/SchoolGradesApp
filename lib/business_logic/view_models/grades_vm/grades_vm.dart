
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tkwinsa_task/business_logic/setup/base_notifier.dart';
import 'package:tkwinsa_task/data/cache_helper/cache_helper.dart';
import 'package:tkwinsa_task/data/models/grades_model/grades_model.dart';
import 'package:tkwinsa_task/utils/generalMethods/general_methods.dart';

class GradesViewModel extends BaseNotifier {

  // **************** get grades ******************//

  List<GradesModel>? gradesModel ;
  void getGrades() async {
    gradesModel = null;
    setBusy();
    try {
      Response<dynamic> res = await api.grades();
      gradesModel = gradesModelFromJson(json.encode(res.data));
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }


  // **************** update grades ******************//

  void updateGrade({required BuildContext context,required String id,required String schoolId,
    required String nameArController,required String nameEnController}) async {
    Map<String, dynamic> body = {
      "name_ar": nameArController,
      "name_en": nameEnController,
      "school_id": schoolId,
    };
    setBusy();
    try {
      Response<dynamic> res = await api.updateGrade(body: body,id:id);
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
      getGrades();
    } catch (e) {
      General.showToast2(message: e.toString(),context: context);
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }


  // **************** delete grades ******************//

  void deleteGrade({required id}) async {
    setBusy();
    try {
      await api.deleteGrade(id: id);
      General.showToast(
        message: 'grade deleted successfully',
        textColor: Colors.white,
        backColor: const Color(0xfff27350),
      );
      // then get grades after update
      getGrades();
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }


  //*************** add grades ********************//

  final formKey = GlobalKey<FormState>();
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController engNameController = TextEditingController();

  void addGrades({required BuildContext context}) async {
    final String schoolId = CacheHelper.getData(key: PrefKeys.schoolId);
    Map<String, dynamic> body = {
      "name_ar": arabicNameController.text,
      "name_en": engNameController.text,
      "school_id": schoolId.toString(),
    };
    setBusy();
    try {
      Response res = await api.addGrades(body: body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        General.showToast(
          message: 'grade added successfully',
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
      getGrades();
    } catch (e) {
      General.showToast2(message: e.toString(),context: context);
      Logger().e(e.toString());
      setError();
    }

    setIdle();
  }



  //**************** search grades *******************//

  TextEditingController searchTextController = TextEditingController();
  late List<GradesModel> searchedForGrades;

  void addSearchedForGrades(String searchedCharacter) {
    searchedForGrades = gradesModel!.where((character) => character.nameEn!.toLowerCase().startsWith(searchedCharacter)||character.nameEn!.toLowerCase().contains(searchedCharacter))
        .toList();
    notifyListeners();
  }
}
