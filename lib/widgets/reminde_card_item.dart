import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:reminde_app/models/reminder_model.dart';

class ReminderCard extends StatelessWidget {
  final ReminderModel reminder;

  const ReminderCard({super.key, required this.reminder});

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat.jm().format(
      reminder.dateTime,
    ); // ex: 8:00 AM

    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        title: Text(
          reminder.title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        subtitle: Text(
          formattedTime,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
        trailing: Text(
          reminder.category,
          style: TextStyle(fontSize: 14.sp, color: Colors.orange),
        ),
      ),
    );
  }
}
