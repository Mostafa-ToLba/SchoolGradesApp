
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tkwinsa_task/business_logic/view_models/grades_vm/grades_vm.dart';
import 'package:tkwinsa_task/presentation/widgets/button/custom_button.dart';
import 'package:tkwinsa_task/presentation/widgets/text/custom_text.dart';
import 'package:tkwinsa_task/presentation/widgets/textFeild/custom_text_field.dart';
import 'package:tkwinsa_task/utils/color_resource/color_resources.dart';

class AddGradesScreen extends StatefulWidget {
   const AddGradesScreen({super.key});

  @override
  State<AddGradesScreen> createState() => _AddGradesScreenState();
}

class _AddGradesScreenState extends State<AddGradesScreen> {
  @override
  void initState() {
    context.read<GradesViewModel>().arabicNameController.clear();
    context.read<GradesViewModel>().engNameController.clear();
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
     return  Consumer<GradesViewModel>(
       builder: (BuildContext context, model, Widget? child) {
         return Scaffold(
           appBar: AppBar(
             backgroundColor: ColorResources.mainColor,
             title: CustomText(text: 'Add Grades',color: Colors.black,txtSize:20.sp,
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
                   CustomText(text: 'Grade name in Arabic',txtSize: 15.sp,color: Colors.black),
                   10.verticalSpace,
                   CustomTextField(hintText: 'الصف الأول',hintColor: Colors.grey,
                   controller: model.arabicNameController,),
                   //  const CustomTextField(),
                   10.verticalSpace,
                   CustomText(text: 'Grade name in English',txtSize: 15.sp,color: Colors.black),
                   10.verticalSpace,
                   CustomTextField(hintText: 'Primary One',hintColor: Colors.grey,
                     controller: model.engNameController,),
                   26.verticalSpace,
                   InkWell(
                     onTap: ()
                     {
                       if (model.formKey.currentState!.validate()) {
                            model.addGrades(context: context);
                       }
                     },
                     child: CustomButton(widgetInCenter:CustomText(text: 'Add Grades',
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
