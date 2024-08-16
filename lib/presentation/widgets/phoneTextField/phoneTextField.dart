import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tkwinsa_task/utils/color_resource/color_resources.dart';


class CustomPhoneTextField extends StatelessWidget {
  const CustomPhoneTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.endPadding,
    this.isNeedHint = true,
    this.isPadding = true,
    this.suffix,
    this.readOnly = false,
    this.textInputType,
    this.validator,
    this.prefix,
    this.hintColor,
    this.text,
    this.isRegister,
    this.isSearch,
    this.text2,
    this.textColor,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final String? text;
  final String? text2;
  final double? endPadding;
  final bool? isNeedHint;
  final bool? isPadding;
  final bool? isRegister;
  final bool? isSearch;
  final Widget? suffix;
  final Widget? prefix;
  final bool? readOnly;
  final Color? hintColor;
  final Color? textColor;
  final TextInputType? textInputType;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    // final themeVm = Provider.of<ThemesViewModel>(context);
    return SizedBox(
  //    height: 60.h,
      width: double.infinity,
      child: IntlPhoneField(
        disableLengthCheck: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        readOnly:readOnly!,
        controller: controller,showDropdownIcon: false,
        validator: (value) {
          if (value == null || value.number.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        flagsButtonMargin:EdgeInsets.only(left: 10.w) ,
        style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400,color: Colors.black),
        textAlign: TextAlign.start,
        initialCountryCode: 'SA',
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: 20.w,top: 35.h),
          hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: hintColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide:  BorderSide(width: 1,color: ColorResources.black,),

          ),
          //     suffixIcon: suffix ?? const SizedBox(),
          prefixIcon: prefix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide:  BorderSide(width: 1,color: ColorResources.black,),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide:  BorderSide(width: 1,color: ColorResources.appGreyColor,),
          ),
        ),
      ),
    );
  }
}
