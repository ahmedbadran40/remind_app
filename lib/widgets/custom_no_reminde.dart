import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/core/constants/app_strings.dart';

class CustomNoReminder extends StatelessWidget {
  const CustomNoReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 80.r,
            color: Colors.grey,
          ),
          SizedBox(height: 16.h),
          Text(
            AppStrings.noRemindersYet,
            style: TextStyle(fontSize: 18.sp, color: Colors.grey),
          ),
          Text(
            AppStrings.startByAddingOne,
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
