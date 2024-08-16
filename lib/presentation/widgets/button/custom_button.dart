import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../utils/color_resource/color_resources.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      required this.widgetInCenter,
      this.isSelected = false,
      this.onTap,
      this.color,
      this.isGradient,
      this.textSize,
      this.colorBorder,
      this.width,
      this.height,
      this.widget,this.loading= false})
      : super(key: key);
  final Widget widgetInCenter;
  final double? textSize;
  final double? width;
  final double? height;
  final bool isSelected;
  final bool? isGradient;
  final Color? color;
  final Color? colorBorder;
  final Widget? widget;
  final GestureTapCallback? onTap;
  final bool loading;


  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.all(Radius.circular(32.r)),
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            color: widget.isSelected
                ? Theme.of(context).primaryColor
                : widget.color,
          ),
          child: widget.loading
              ? Padding(
                padding:  EdgeInsets.symmetric(vertical: 16.3.h),
                child: Center(
            child: SpinKitThreeBounce(
                  color:  ColorResources.white1,
                  size: 1.sw < 600 ? 0.04.sh : 0.06.sh),
          ),
              ):Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 23.h),
              child: widget.widgetInCenter,
            ),
          ),
        ),
      ),
    );
  }
}
