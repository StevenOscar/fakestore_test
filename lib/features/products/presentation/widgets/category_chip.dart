import 'package:fakestore_test/core/styles/app_color.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  const CategoryChip({super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.darkGrey : AppColors.white,
        border: Border.all(color: isSelected ? AppColors.darkGrey : AppColors.darkGrey, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(color: isSelected ? AppColors.white : AppColors.darkGrey),
      ),
    );
  }
}
