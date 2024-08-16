
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tkwinsa_task/utils/color_resource/color_resources.dart';

class General {

  static Future<void> showToast(
      {required String message, Color? backColor, Color? textColor}) async {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        webBgColor: "linear-gradient(to right, #000000, #000000)",
        backgroundColor: backColor ?? ColorResources.buttonColor,
        textColor: textColor ?? ColorResources.white1,
        webPosition: "center",
        fontSize: 18.sp,);
  }

  static Future<void> showToast2(
      {required String message, Color? backColor, Color? textColor,context}) async
  {
    CherryToast.error(
        title:  Text('Error',style: TextStyle(fontSize: 12.sp,),),
        description:   Text(message, style: const TextStyle(color: Colors.black)),
        animationType:  AnimationType.fromBottom,
        animationDuration:  const Duration(seconds: 3),
        autoDismiss:  true
    ).show(context);
  }


  static bool get isMobile{
    return 1.sw <= 768;
  }

}




