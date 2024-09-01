import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/gen/colors.gen.dart';

class LadderBack extends StatelessWidget {
  const LadderBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: SizedBox(
        height: 24.h,
        width: 66.w,
        child: Row(
          children: <Widget>[
            const Icon(Icons.arrow_back, color: ColorName.fillColor, size: 16),
            SizedBox(width: 4.w),
            Text(
              "Back",
              style: context.appTheme.textTheme.titleSmall?.copyWith(
                fontSize: 18,
                color: ColorName.fillColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
