import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/gen/colors.gen.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    required this.isSelected,
    required this.text,
    required this.onTap,
    super.key,
  });

  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? ColorName.onBackground : ColorName.white,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: context.appTheme.textTheme.displayMedium?.copyWith(
                color: isSelected ? ColorName.white : ColorName.onBackground,
                fontSize: 17.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
