import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tkwinsa_task/business_logic/setup/base_notifier.dart';
import 'package:tkwinsa_task/data/cache_helper/cache_helper.dart';
import 'package:tkwinsa_task/presentation/screens/home_page/home_page.dart';
import 'package:tkwinsa_task/utils/app_constants/app_constants.dart';
import 'package:tkwinsa_task/utils/generalMethods/general_methods.dart';

class LoginViewModel extends BaseNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   // ************** handel login screen *************************

  bool isLoginDone = false ;
  void login({required BuildContext context}) async {
    isLoginDone = false;
    Map<String, dynamic> body = {
    "mobile": phoneController.text,
    "password": passwordController.text,
    };
    setBusy();
    try {
      Response<dynamic> res = await api.login(body: body);
      if (res.statusCode == 200 ) {
        isLoginDone = true ;
        AppConstants.token = res.data['token'];
        AppConstants.schoolId = res.data['user']['school_id'];
        CacheHelper.SaveData(key: PrefKeys.TOKEN, value: AppConstants.token);
        CacheHelper.SaveData(key: PrefKeys.schoolId, value: AppConstants.schoolId);
        Navigator.pushReplacement(
            context, SlideTransition1(const HomePage()));
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
    isLoginDone ==false?General.showToast2(message: 'بيانات الدخول خاطئة',context: context):null;
    setIdle();
  }
}
