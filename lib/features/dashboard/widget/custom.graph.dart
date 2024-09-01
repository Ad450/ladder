import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/features/dashboard/widget/bar.widget.dart';
import 'package:ladder/gen/colors.gen.dart';

class GainsWidget extends StatelessWidget {
  const GainsWidget({
    required this.totalExpenses,
    required this.totalRevenues,
    required this.totalTransactions,
    super.key,
  });
  final double totalExpenses;
  final double totalRevenues;
  final double totalTransactions;

  @override
  Widget build(BuildContext context) {
    var options = Options(format: Format.hex, colorType: ColorType.green);
    var randomColor = RandomColor.getColor(options);

    final maxGain = [totalExpenses, totalRevenues, totalTransactions].reduce((a, b) => a > b ? a : b);

    return Container(
        height: 190.h,
        width: double.infinity,
        decoration: const BoxDecoration(color: ColorName.onboardingBackground),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    BarWidget(
                      gain: totalExpenses,
                      maxGain: maxGain,
                      color: HexColor(randomColor),
                      text: "Expenses",
                    ),
                    SizedBox(width: 16.w),
                    BarWidget(
                      gain: totalRevenues,
                      maxGain: maxGain,
                      color: HexColor(randomColor),
                      text: "Revenue",
                    ),
                    SizedBox(width: 16.w),
                    BarWidget(
                      gain: totalTransactions,
                      maxGain: maxGain,
                      color: HexColor(randomColor),
                      text: "total",
                    ),
                  ],
                ),
              ),
              SizedBox(width: 32.w),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 55.h),
                    Text(
                      "TOTAL GAINS",
                      style: context.appTheme.textTheme.titleSmall?.copyWith(
                        fontSize: 18,
                        color: ColorName.fillColor,
                      ),
                    ),
                    Text(
                      "${calculatePercentage()}%",
                      style: context.appTheme.textTheme.titleSmall?.copyWith(
                        fontSize: 24,
                        color: ColorName.onBackground,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  int calculatePercentage() {
    if (totalTransactions == 0) {
      return 0; // Avoid division by zero
    }
    final gainOrLoss = totalRevenues - totalExpenses;
    return ((gainOrLoss / totalTransactions) * 100).round();
  }
}
