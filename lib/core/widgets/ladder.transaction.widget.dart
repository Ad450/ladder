import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/gen/colors.gen.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    this.backgroundColor,
    this.textColor,
    super.key,
  });

  final String title;
  final String? category;
  final String amount;
  final String date;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      width: double.infinity,
      height: 102.h,
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorName.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: context.appTheme.textTheme.titleSmall?.copyWith(
                    fontSize: 20,
                    color: textColor ?? ColorName.onBackground,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                amount,
                style: context.appTheme.textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: textColor ?? ColorName.fillColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                category ?? "Revenue",
                style: context.appTheme.textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: textColor ?? ColorName.fillColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                date,
                style: context.appTheme.textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: textColor ?? ColorName.fillColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
