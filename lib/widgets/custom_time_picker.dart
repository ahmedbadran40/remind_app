import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/core/constants/app_strings.dart';
import 'package:reminde_app/widgets/custom_text.dart';

class CustomTimePicker extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final ValueChanged<TimeOfDay> onTimeSelected;

  const CustomTimePicker({
    super.key,
    required this.selectedTime,
    required this.onTimeSelected,
    required Future<Null> Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(title: AppStrings.timeLabel),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () async {
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (pickedTime != null) {
              onTimeSelected(pickedTime);
            }
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(
                      0xFF1E1B24,
                    ) // لون مشابه للـ TextField في الدارك مود
                  : Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              // border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                const Icon(Icons.access_time_outlined, color: Colors.grey),
                SizedBox(width: 12.w),
                Text(
                  selectedTime != null
                      ? selectedTime!.format(context)
                      : AppStrings.selectTime,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
