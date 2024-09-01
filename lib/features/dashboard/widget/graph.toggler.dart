import 'package:flutter/material.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/gen/colors.gen.dart';

class GraphToggler extends StatelessWidget {
  const GraphToggler({
    required this.isExpense,
    required this.onExpense,
    required this.onIncome,
    super.key,
  });

  final bool isExpense;
  final VoidCallback onExpense;
  final VoidCallback onIncome;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorName.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onExpense,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isExpense ? ColorName.onBackground : ColorName.white,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Expenses",
                    style: context.appTheme.textTheme.displayMedium?.copyWith(
                      color: isExpense ? ColorName.white : ColorName.onBackground,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onIncome,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isExpense ? ColorName.white : ColorName.onBackground,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Income",
                    style: context.appTheme.textTheme.displayMedium?.copyWith(
                      color: isExpense ? ColorName.onBackground : ColorName.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
