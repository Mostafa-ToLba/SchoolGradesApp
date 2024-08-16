
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tkwinsa_task/business_logic/view_models/login_vm/login_vm.dart';
import 'package:tkwinsa_task/presentation/widgets/button/custom_button.dart';
import 'package:tkwinsa_task/presentation/widgets/phoneTextField/phoneTextField.dart';
import 'package:tkwinsa_task/presentation/widgets/text/custom_text.dart';
import 'package:tkwinsa_task/presentation/widgets/textFeild/custom_text_field.dart';
import 'package:tkwinsa_task/utils/color_resource/color_resources.dart';

class LoginScreen extends StatelessWidget {
   const LoginScreen({super.key});

   @override
   Widget build(BuildContext context) {
     return  Consumer<LoginViewModel>(
       builder: (BuildContext context, model, Widget? child) {
         return Scaffold(
           resizeToAvoidBottomInset: false,
           backgroundColor: Colors.white,
           appBar: null,
           body: Padding(
             padding:  EdgeInsets.only(top: 120.h,left: 20.w,right: 20.w),
             child: Form(
               key: model.formKey,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:
                 [
                   CustomText(text: 'Login',txtSize: 33.sp,color: Colors.black),
                   60.verticalSpace,
                   CustomText(text: 'Mobile Number',txtSize: 15.sp,color: Colors.black),
                   15.verticalSpace,
                    CustomPhoneTextField(textColor: Colors.black,controller: model.phoneController,),
                   //  const CustomTextField(),
                   15.verticalSpace,
                   CustomText(text: 'Password',txtSize: 15.sp,color: Colors.black),
                   15.verticalSpace,
                   CustomTextField(obscure: true,isRegister: true,controller:  model.passwordController,),
                   26.verticalSpace,
                   InkWell(
                     onTap: ()
                     {
                       if (model.formKey.currentState!.validate()) {
                         model.login(context: context);
                       }
                     },
                     child: CustomButton(widgetInCenter:CustomText(text: 'Login',
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
