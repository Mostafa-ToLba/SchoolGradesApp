
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tkwinsa_task/presentation/screens/grades_screen/grades_screen.dart';
import 'package:tkwinsa_task/presentation/widgets/text/custom_text.dart';
import 'package:tkwinsa_task/utils/app_constants/app_constants.dart';
import 'package:tkwinsa_task/utils/color_resource/color_resources.dart';

class HomePage extends StatelessWidget {
   const HomePage({super.key});

   @override
   Widget build(BuildContext context) {
     return  Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: ColorResources.mainColor,
         leading: Icon(Icons.menu,size: 26.sp),
         title: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children:
           [
             CustomText(text: 'Home Page',color: Colors.black,txtSize: 16.sp,
               fontWeight:FontWeight.w500,),
             3.verticalSpace,
             CustomText(text: 'Head Teacher',color: Colors.grey[900],txtSize: 14.sp,
               fontWeight:FontWeight.w300,)
           ],
         ),
       ),
       body: Padding(
         padding:  EdgeInsets.all(15.sp),
         child: gradesWidget(context),
       ),
     );
   }
 }


 Widget gradesWidget(context) => InkWell(
   onTap: ()
   {
     Navigator.push(context,
         SlideTransition1(const GradesScreen()));
   },
   child: Container(
     height: 70.h,
     width: double.infinity,
     decoration:  BoxDecoration(color: const Color(0xffededed),
       borderRadius: BorderRadius.circular(13.r),
       boxShadow: [
         BoxShadow(
           color: Colors.grey.withOpacity(0.4), // Shadow color
           offset: const Offset(0, 2), // Shadow offset: only down
           blurRadius: .1, // Shadow blur radius
           spreadRadius:.1,// No spreading
         ),
       ],

     ),
     child: Padding(
       padding: EdgeInsets.only(top: 5.h,bottom: 5.h,left: 20.w,right: 20.w),
       child: Row(
         children:
         [
           CircleAvatar(backgroundColor: const Color(0xffebddff),radius: 24.r,
               child: Icon(Icons.grading_rounded,size: 24.sp,)),
           20.horizontalSpace,
           CustomText(text: 'Grades',txtSize: 18.sp),
           const Spacer(),
            Icon(Icons.arrow_forward_ios,color: Colors.black,size: 22.sp),
         ],
       ),
     ),
   ),
 );
