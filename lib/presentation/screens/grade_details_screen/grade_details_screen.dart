
 import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tkwinsa_task/business_logic/view_models/class_vm/class_vm.dart';
import 'package:tkwinsa_task/data/models/class_model/class_model.dart';
import 'package:tkwinsa_task/presentation/screens/add_classes/add_classes.dart';
import 'package:tkwinsa_task/presentation/widgets/text/custom_text.dart';
import 'package:tkwinsa_task/presentation/widgets/textFeild/custom_text_field.dart';
import 'package:tkwinsa_task/presentation/widgets/update_dialog/update_dialog.dart';
import 'package:tkwinsa_task/utils/app_constants/app_constants.dart';
import 'package:tkwinsa_task/utils/color_resource/color_resources.dart';

class GradeDetailsScreen extends StatefulWidget {
  final String nameEn;
  final String gradeId;

   const GradeDetailsScreen( this.nameEn, this.gradeId, {super.key});

  @override
  State<GradeDetailsScreen> createState() => _GradeDetailsScreenState();
}

class _GradeDetailsScreenState extends State<GradeDetailsScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.read<ClassViewModel>().getClasses();
    });
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
     return  Consumer<ClassViewModel>(
       builder: (BuildContext context, model, Widget? child) {
         return Scaffold(
           appBar: AppBar(
             backgroundColor: ColorResources.mainColor,
             title: CustomText(text: widget.nameEn.toString(),color: Colors.black,txtSize:20.sp,
               fontWeight:FontWeight.w400,),
             actions:
             [
               InkWell(
                 onTap: ()
                 {
                   Navigator.push(context,
                       SlideTransition1( AddClassesScreen(widget.gradeId)));
                 },
                 child: Padding(
                   padding: EdgeInsets.only(right: 10.w),
                   child: Container(
                     height: 40.h,
                     width: 150.w,
                     decoration: BoxDecoration(color: Colors.white,
                         borderRadius: BorderRadius.circular(20.r)),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:
                       [
                         Icon(Icons.add,color: const Color(0xff726197),size: 25.sp,),
                         5.horizontalSpace,
                         CustomText(text: 'Add Classes',color: const Color(0xff726197),txtSize:15.sp,
                           fontWeight:FontWeight.w500,),
                       ],
                     ),
                   ),
                 ),
               )
             ],
           ),
           body: model.classesModel==null?const Center(child: CircularProgressIndicator()):
           model.classesModel!.isNotEmpty? Padding(
             padding:  EdgeInsets.all(20.sp),
             child: Column(
               children:
               [
                 CustomTextField(
                   prefix: const Icon(Icons.search,color: Colors.black,),
                   hintText: 'Search Classes',
                   hintColor: Colors.grey,
                   controller: model.searchTextController,
                   onChanged: (searchedGrade) {
                     model.addSearchedForGrades(searchedGrade);
                   },
                 ),
                 20.verticalSpace,
                 Expanded(
                   child: ListView.separated(
                       itemBuilder: (context,index)=>classWidget(context,
                           model.searchTextController.text.isEmpty?model.classesModel![index]:
                           model.searchedForClasses[index]),
                       separatorBuilder: (context,index)=>SizedBox(height: 15.h),
                       itemCount: model.searchTextController.text.isEmpty?model.classesModel!.length:
                       model.searchedForClasses.length),
                 )
               ],
             ),
           ):emptyGrade(context),
         );
       },
     );
   }
}

 Widget classWidget(BuildContext context, ClassesModel classesModel) => Consumer<ClassViewModel>(
   builder: (BuildContext context, model, Widget? child) {
     return Container(
       height: 60.h,
       width: double.infinity,
       decoration:  BoxDecoration(color: const Color(0xffededed),
         borderRadius: BorderRadius.circular(13.r),
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.4), // Shadow color
             offset: const Offset(0, 2), // Shadow offset: only down
             blurRadius: .1, // Shadow blur radius
             spreadRadius:.1, // No spreading
           ),
         ],

       ),
       child: Padding(
         padding: EdgeInsets.only(top: 5.h,bottom: 5.h,left: 20.w,right: 40.w),
         child: Row(
           children:
           [
             CustomText(text: classesModel.nameEn??'',txtSize: 17.sp),
             const Spacer(),
             InkWell(
                 onTap: ()
                 {
                   showDialog(
                     context: context,
                     builder: (BuildContext context) {
                       return UpdateDialog(classesModel.id,classesModel.schoolId,classesModel.gradeId,'class'); // Display the update dialog
                     },
                   );
                 },
                 child: Icon(Icons.edit,color: Colors.black,size: 22.sp)),
             25.horizontalSpace,
             InkWell(
                 onTap: ()
                 {
                   model.deleteClasses(id: classesModel.id);
                 },
                 child: Icon(Icons.delete,color: Colors.black,size: 22.sp)),
             25.horizontalSpace,
             Icon(Icons.arrow_forward_ios,color: Colors.black,size: 22.sp),
           ],
         ),
       ),
     );
   },
 );

 Widget emptyGrade(context) => Center(
   child: Column(
     mainAxisSize: MainAxisSize.min,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       Icon(
         Icons.school,
         size: 70.sp,
         color: Colors.grey,
       ),
       SizedBox(height: 10.h),
       Text(
         'No classes available right now',
         style: TextStyle(
           fontSize: 16.sp,
           color: Colors.grey,
         ),
       ),
     ],
   ),
 );