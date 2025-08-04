import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:reminde_app/core/constants/app_colors.dart';
import 'package:reminde_app/core/constants/app_strings.dart';
import 'package:reminde_app/core/helpers/notification_permission.dart';
import 'package:reminde_app/core/services/notification_service.dart';
import 'package:reminde_app/models/reminder_model.dart';
import 'package:reminde_app/widgets/custom_add_remind_botton.dart';
import 'package:reminde_app/widgets/custom_category_drop_down.dart';
import 'package:reminde_app/widgets/custom_date_picker.dart';
import 'package:reminde_app/widgets/custom_text_filed.dart';
import 'package:reminde_app/widgets/custom_time_picker.dart';

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
  void initState() {
    super.initState();
    requestNotificationPermission(); // ✅ طلب إذن الإشعارات
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.addReminder,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : kColorApp,
          ),
        ),
        centerTitle: true,
      ),
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
                  hint: AppStrings.enterReminderTitle,
                ),

                SizedBox(height: 24.h),

                /// Date Picker
                CustomDatePicker(
                  selectedDate: _selectedDate,
                  onDateSelected: (date) {
                    setState(() => _selectedDate = date);
                  },
                ),
                SizedBox(height: 24.h),

                /// Time Picker
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_selectedDate == null ||
                          _selectedTime == null ||
                          _selectedCategory == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(AppStrings.pleaseFillAllFields),
                          ),
                        );
                        return;
                      }

                      final scheduledDateTime = DateTime(
                        _selectedDate!.year,
                        _selectedDate!.month,
                        _selectedDate!.day,
                        _selectedTime!.hour,
                        _selectedTime!.minute,
                      );

                      final reminder = ReminderModel(
                        title: _titleController.text.trim(),
                        dateTime: scheduledDateTime,
                        category: _selectedCategory!,
                      );

                      final reminderBox = Hive.box<ReminderModel>('reminders');
                      await reminderBox.add(reminder);

                      // 🛎️ إضافة النوتيفيكيشن
                      await NotificationService.showScheduledNotification(
                        id: reminderBox.length + 1,
                        title: 'Reminder: ${reminder.title}',
                        body: 'Category: ${reminder.category}',
                        scheduledDate: scheduledDateTime,
                      );

                      if (!context.mounted) return;
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
