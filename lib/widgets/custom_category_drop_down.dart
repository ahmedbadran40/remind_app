import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/core/constants/app_lists.dart';
import 'package:reminde_app/core/constants/app_strings.dart';
import 'package:reminde_app/widgets/custom_text.dart';

class CustomCategoryDropdown extends StatelessWidget {
  final String? selectedCategory;
  final Function(String?) onCategorySelected;

  const CustomCategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: AppStrings.kCategory),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          value: categoryTabs.contains(selectedCategory)
              ? selectedCategory
              : null,
          onChanged: onCategorySelected,
          icon: const Icon(Icons.arrow_drop_down),
          decoration: InputDecoration(
            hintText: AppStrings.kCategory,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            filled: true,
            fillColor: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1E1B24)
                : Colors.white,
          ),
          items: categoryTabs.map((category) {
            return DropdownMenuItem(
              value: category,
              child: Text(category, style: TextStyle(fontSize: 14.sp)),
            );
          }).toList(),
        ),
      ],
    );
  }
}
