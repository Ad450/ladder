import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/gen/colors.gen.dart';

class TransactionRevenueButton extends StatelessWidget {
  const TransactionRevenueButton({
    required this.onTap,
    required this.isExpense,
    this.borderRadius,
    super.key,
  });

  final VoidCallback onTap;
  final double? borderRadius;
  final bool isExpense;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34.h,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorName.primaryAccent,
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
        ),
        child: Center(
          child: Text(
            isExpense ? "Create Income" : "Create Expense",
            style: context.appTheme.textTheme.bodyMedium?.copyWith(
              fontSize: 12,
              color: ColorName.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}
