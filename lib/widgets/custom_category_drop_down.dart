import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminder_app/constance.dart';

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
    return DropdownButtonFormField<String>(
      value: selectedCategory,
      onChanged: onCategorySelected,
      icon: const Icon(Icons.arrow_drop_down),
      decoration: InputDecoration(
        labelText: 'Category',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        filled: true,
        fillColor: Colors.white,
      ),
      items: categoryTabs.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(category, style: TextStyle(fontSize: 14.sp)),
        );
      }).toList(),
    );
  }
}
