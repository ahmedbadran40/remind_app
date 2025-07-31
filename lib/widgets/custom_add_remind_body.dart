// 📁 screens/add_reminder_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminder_app/widgets/custom_add_remind_botton.dart';
import 'package:reminder_app/widgets/custom_category_drop_down.dart';
import 'package:reminder_app/widgets/custom_date_picker.dart';
import 'package:reminder_app/widgets/custom_text_filed.dart';
import 'package:reminder_app/widgets/custom_time_picker.dart';

class CustomAddRemindBody extends StatefulWidget {
  const CustomAddRemindBody({super.key});

  @override
  State<CustomAddRemindBody> createState() => _CustomAddRemindBodyState();
}

class _CustomAddRemindBodyState extends State<CustomAddRemindBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Reminder'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: _titleController,
                  hint: 'Enter reminder title',
                ),

                SizedBox(height: 24.h),

                /// Date Picker
                CustomDatePicker(
                  selectedDate: _selectedDate,
                  onDateSelected: (date) {
                    setState(() => _selectedDate = date);
                  },
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setState(() => _selectedDate = picked);
                    }
                  },
                ),

                SizedBox(height: 24.h),
                CustomTimePicker(
                  selectedTime: _selectedTime,
                  onTimeSelected: (time) {
                    setState(() => _selectedTime = time);
                  },
                  onTap: () async {
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      setState(() => _selectedTime = picked);
                    }
                  },
                ),

                SizedBox(height: 24.h),

                CustomCategoryDropdown(
                  selectedCategory: _selectedCategory ?? '',
                  onCategorySelected: (category) {
                    setState(() => _selectedCategory = category);
                  },
                ),

                SizedBox(height: 40.h),

                /// Add Reminder Button
                CustomAddReminderButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Save to Hive / Bloc
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
