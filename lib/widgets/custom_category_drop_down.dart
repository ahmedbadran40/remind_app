import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminder_app/constance.dart';
import 'package:reminder_app/widgets/custom_text.dart';

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
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(title: 'Category'),
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          value: categoryTabs.contains(selectedCategory)
              ? selectedCategory
              : null,
          onChanged: onCategorySelected,
          icon: const Icon(Icons.arrow_drop_down),
          decoration: InputDecoration(
            labelText: 'Category',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            filled: true,
            fillColor: Theme.of(context).brightness == Brightness.dark
                ? const Color(
                    0xFF1E1B24,
                  ) // لون مشابه للـ TextField في الدارك مود
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
