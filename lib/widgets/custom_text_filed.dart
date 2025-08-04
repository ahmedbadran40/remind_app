import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/core/constants/app_strings.dart';
import 'package:reminde_app/widgets/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: AppStrings.titleLabel),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          style: TextStyle(fontSize: 16.sp),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: 14.sp,
            ),
            filled: true,
            fillColor: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1E1B24)
                : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return AppStrings.enterValueValidation;
            }
            return null;
          },
        ),
      ],
    );
  }
}
