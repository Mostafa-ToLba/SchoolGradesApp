
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tkwinsa_task/business_logic/view_models/class_vm/class_vm.dart';
import 'package:tkwinsa_task/business_logic/view_models/grades_vm/grades_vm.dart';
import 'package:tkwinsa_task/presentation/widgets/text/custom_text.dart';

class UpdateDialog extends StatefulWidget {
  final String? id;
  final String? schoolId;
  final String? gradeId;
  final String? updateType;
  const UpdateDialog( this.id, this.schoolId, this.gradeId,this.updateType, {super.key});

  @override
  _UpdateDialogState createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _arNameController = TextEditingController();
  final TextEditingController _enNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final gradeVm = Provider.of<GradesViewModel>(context);
    final classVm = Provider.of<ClassViewModel>(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      title: CustomText(text: widget.updateType=='grade'?'Update Grade':"Update Class",txtSize: 20.sp,color: Colors.black),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _arNameController,
              decoration: const InputDecoration(hintText:'name in arabic' ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _enNameController,
              decoration: const InputDecoration(hintText: 'name in english'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
             SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child:  Text('Cancel',style: TextStyle(fontSize: 12.sp,color: const Color(0xfff27350)),),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      if(widget.updateType=='grade')
                      {
                        gradeVm.updateGrade(context: context, id: widget.id??"", schoolId: widget.schoolId??"",
                            nameArController: _arNameController.text, nameEnController: _enNameController.text);
                      }
                      else
                      {
                        classVm.updateClass(context: context, id: widget.id??"", schoolId: widget.schoolId??"",
                            gradeId: widget.gradeId??"",
                            nameArController:_arNameController.text,nameEnController:_enNameController.text );
                      }

                      Navigator.of(context).pop(); // Close the dialog after updating
                    }
                  },
                  child:  Text('Update',style: TextStyle(fontSize: 12.sp,color: const Color(0xfff27350)),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
