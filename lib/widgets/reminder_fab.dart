import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/screens/add_remind_screen.dart';

class ReminderFAB extends StatelessWidget {
  const ReminderFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddRemindScreen();
            },
          ),
        );
        // فتح صفحة إضافة Reminder
      },
      backgroundColor: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Icon(Icons.add, color: Colors.white, size: 26.sp),
    );
  }
}
