import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/core/widgets/ladder.textfield.dart';
import 'package:ladder/core/widgets/ladder.toast.dart';
import 'package:ladder/features/dashboard/state/dashboard.bloc.dart';
import 'package:ladder/features/dashboard/state/dashboard.event.dart';
import 'package:ladder/features/dashboard/state/dashboard.state.dart';
import 'package:ladder/gen/colors.gen.dart';

import '../../../core/widgets/ladder.text.button.dart';

class ExpensesForm extends StatefulWidget {
  const ExpensesForm({super.key});

  @override
  State<ExpensesForm> createState() => _ExpensesFormState();
}

class _ExpensesFormState extends State<ExpensesForm> {
  void validateAndAddExpenses() {
    final amount = context.read<DashboardBloc>().expensesAmountController.value.text;
    final name = context.read<DashboardBloc>().expensesNameController.value.text;
    final category = context.read<DashboardBloc>().expenseCategoryController.value.text;

    if (name.isNotEmpty && amount.isNotEmpty && category.isNotEmpty) {
      context.read<DashboardBloc>().add(AddExpensesEvent());
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
          "Name of item",
          style: context.appTheme.textTheme.bodySmall?.copyWith(
            fontSize: 16,
            color: ColorName.text,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 16.h),
        LadderTextfield(
          controller: context.read<DashboardBloc>().expensesNameController,
          hintText: "Book...",
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
          controller: context.read<DashboardBloc>().expensesAmountController,
          hintText: "200",
          inputType: TextInputType.number,
        ),
        SizedBox(height: 16.h),
        Text(
          "Category",
          style: context.appTheme.textTheme.bodySmall?.copyWith(
            fontSize: 16,
            color: ColorName.text,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 16.h),
        LadderTextfield(
          controller: context.read<DashboardBloc>().expenseCategoryController,
          hintText: "Category",
          inputType: TextInputType.text,
        ),
        SizedBox(height: 100.h),
        BlocConsumer<DashboardBloc, DashboardState>(
          listener: (_, state) {},
          builder: (_, state) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: LadderTextButton(
              onPressed: validateAndAddExpenses,
              text: "Finish",
              isBusy: state.maybeMap(
                orElse: () => false,
                addExpensesLoading: (state) => true,
              ),
            ),
          ),
        )
      ],
    );
  }
}
