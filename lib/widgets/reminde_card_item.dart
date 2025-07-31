import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReminderCard extends StatelessWidget {
  final String title;
  final String time;

  const ReminderCard({super.key, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        subtitle: Text(
          time,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
      ),
    );
  }
}
