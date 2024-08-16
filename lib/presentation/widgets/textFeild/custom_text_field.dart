import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tkwinsa_task/presentation/widgets/text/custom_text.dart';
import '../../../utils/color_resource/color_resources.dart';


class CustomTextField extends StatefulWidget {
   CustomTextField({
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
    this.obscure=false,
     this.onChanged
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
   bool obscure;
  final Widget? suffix;
  final Widget? prefix;
  final bool? readOnly;
  final Color? hintColor;
  final Color? textColor;
  final TextInputType? textInputType;
  final FormFieldValidator? validator;
   var onChanged;



  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

 // bool widget.obscure = false; // State to toggle visibility
  void togglePasswordVisibility() {
    setState(() {
      widget.obscure = !widget.obscure; // Toggle visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.text != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: widget.text!,
                  txtSize: 14,
                  fontWeight: FontWeight.w400,
                  color: widget.textColor ?? ColorResources.black),
              CustomText(
                  text: widget.text2 ?? '',
                  txtSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorResources.grey2),
            ],
          ),
        SizedBox(
       //   height: 60.h,
          width: double.infinity,
          child: TextFormField(
            textDirection: TextDirection.ltr,
            maxLines: 1,
            textAlign: TextAlign.start,
           // validator: widget.validator,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: widget.onChanged,
            readOnly: widget.readOnly!,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            obscureText: widget.obscure,
            style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400,color: Colors.black),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.w,top: 35.h,),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: widget.hintColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
              focusedBorder: widget.isRegister == true
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide: BorderSide(
                        color: ColorResources.black,
                        width: 1,
                      ))
                  : widget.isSearch == true
                      ? InputBorder.none
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          borderSide: BorderSide(
                              color: ColorResources.black, width: 1),
                        ),
              suffixIcon: InkWell(
                  onTap: togglePasswordVisibility,
                  child: widget.isRegister ==true ? Icon(widget.obscure?Icons.visibility_off_outlined:Icons.visibility_outlined): const SizedBox()),
              prefixIcon: widget.prefix,
              border: widget.isRegister == true
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide:
                          BorderSide(color: ColorResources.black, width: 1))
                  : widget.isSearch == true
                      ? InputBorder.none
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          borderSide: BorderSide(
                            color: ColorResources.black,
                            width: 1,
                          ),
                        ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide(
                  color: ColorResources.appGreyColor,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
