
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tkwinsa_task/business_logic/view_models/class_vm/class_vm.dart';
import 'package:tkwinsa_task/presentation/widgets/button/custom_button.dart';
import 'package:tkwinsa_task/presentation/widgets/text/custom_text.dart';
import 'package:tkwinsa_task/presentation/widgets/textFeild/custom_text_field.dart';
import 'package:tkwinsa_task/utils/color_resource/color_resources.dart';

class AddClassesScreen extends StatefulWidget {
  final String gradeId;

  const AddClassesScreen( this.gradeId, {super.key});

  @override
  State<AddClassesScreen> createState() => _AddClassesScreenState();
}

class _AddClassesScreenState extends State<AddClassesScreen> {
  @override
  void initState() {
    context.read<ClassViewModel>().arabicNameController.clear();
    context.read<ClassViewModel>().engNameController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<ClassViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorResources.mainColor,
            title: CustomText(text: 'Add Classes',color: Colors.black,txtSize:20.sp,
              fontWeight:FontWeight.w400,),
          ),
          body: Padding(
            padding:  EdgeInsets.only(top: 30.h,left: 20.w,right: 20.w),
            child: Form(
              key: model.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  CustomText(text: 'Class name in Arabic',txtSize: 15.sp,color: Colors.black),
                  10.verticalSpace,
                  CustomTextField(hintText: 'الصف الأول',hintColor: Colors.grey,
                    controller: model.arabicNameController,),
                  //  const CustomTextField(),
                  10.verticalSpace,
                  CustomText(text: 'Class name in English',txtSize: 15.sp,color: Colors.black),
                  10.verticalSpace,
                  CustomTextField(hintText: 'Class One',hintColor: Colors.grey,
                    controller: model.engNameController,),
                  26.verticalSpace,
                  InkWell(
                    onTap: ()
                    {
                      if (model.formKey.currentState!.validate()) {
                        model.addClasses(context: context,gradeId:widget.gradeId );
                      }
                    },
                    child: CustomButton(widgetInCenter:CustomText(text: 'Add Classes',
                        color: Colors.white,txtSize: 16.sp,fontWeight: FontWeight.w600)
                        ,color:  ColorResources.mainColor,height: 100.h,loading: model.busy),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}