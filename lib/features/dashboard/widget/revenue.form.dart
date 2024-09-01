import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/core/widgets/ladder.text.button.dart';

import 'package:ladder/core/widgets/ladder.textfield.dart';
import 'package:ladder/core/widgets/ladder.toast.dart';
import 'package:ladder/features/dashboard/state/dashboard.bloc.dart';
import 'package:ladder/features/dashboard/state/dashboard.event.dart';
import 'package:ladder/features/dashboard/state/dashboard.state.dart';
import 'package:ladder/gen/colors.gen.dart';

class RevenueForm extends StatelessWidget {
  const RevenueForm({super.key});

  void validateAndAddRevenue(
    BuildContext context,
  ) {
    final amount = context.read<DashboardBloc>().revenueAmountController.value.text;
    final name = context.read<DashboardBloc>().revenueNameController.value.text;

    if (name.isNotEmpty && amount.isNotEmpty) {
      context.read<DashboardBloc>().add(
            AddRevenueEvent(),
          );
    } else {
      showToast("All fields are requird");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Name of revenue",
          style: context.appTheme.textTheme.bodySmall?.copyWith(
            fontSize: 16,
            color: ColorName.text,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 16.h),
        LadderTextfield(
          controller: context.read<DashboardBloc>().revenueNameController,
          hintText: "Salary...",
          inputType: TextInputType.text,
        ),
        SizedBox(height: 16.h),
        Text(
          "Amount(GHS)",
          style: context.appTheme.textTheme.bodySmall?.copyWith(
            fontSize: 16,
            color: ColorName.text,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 16.h),
        LadderTextfield(
          controller: context.read<DashboardBloc>().revenueAmountController,
          hintText: "200",
          inputType: TextInputType.number,
        ),
        SizedBox(height: 100.h),
        BlocConsumer<DashboardBloc, DashboardState>(
          listener: (_, state) {},
          builder: (_, state) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: LadderTextButton(
              onPressed: () => validateAndAddRevenue(context),
              text: "Finish",
              isBusy: state.maybeMap(
                orElse: () => false,
                addRevenueLoading: (state) => true,
              ),
            ),
          ),
        )
      ],
    );
  }
}
