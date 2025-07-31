import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminder_app/constance.dart';

class ReminderTabBar extends StatelessWidget {
  final TabController controller;

  const ReminderTabBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      isScrollable: true,
      indicatorColor: Colors.orange,
      labelColor: Colors.brown,
      unselectedLabelColor: Colors.grey,
      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
      tabs: categoryTabs.map((tab) => Tab(text: tab)).toList(),
    );
  }
}
