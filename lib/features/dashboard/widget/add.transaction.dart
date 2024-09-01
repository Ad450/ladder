import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/core/widgets/ladder.avatar.with.text.dart';
import 'package:ladder/core/widgets/ladder.back.dart';
import 'package:ladder/core/widgets/ladder.toast.dart';
import 'package:ladder/features/dashboard/state/dashboard.bloc.dart';
import 'package:ladder/features/dashboard/state/dashboard.state.dart';
import 'package:ladder/features/dashboard/widget/expenses.form.dart';
import 'package:ladder/features/dashboard/widget/ladder.revenue.button.dart';
import 'package:ladder/features/dashboard/widget/revenue.form.dart';
import 'package:ladder/features/dashboard/widget/show.exit.dialog.dart';
import 'package:ladder/gen/colors.gen.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  bool isExpense = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.onboardingBackground,
      body: SafeArea(
        child: BlocConsumer<DashboardBloc, DashboardState>(
          listener: (_, state) => state.maybeMap(
            orElse: () => {},
            error: (state) => showToast(state.message),
            addExpensesSuccess: (state) => showExitDialog(context),
            addRevenueSuccess: (state) => showExitDialog(context),
          ),
          builder: (_, state) => IgnorePointer(
            ignoring: state.maybeMap(
              orElse: () => false,
              addExpensesLoading: (state) => true,
              addRevenueLoading: (state) => true,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const LadderBack(),
                    SizedBox(height: 40.h),
                    const LadderAvatarWithText(name: "Emmanuel Adjei"),
                    SizedBox(height: 48.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Transaction",
                          style: context.appTheme.textTheme.titleSmall?.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TransactionRevenueButton(
                            isExpense: isExpense,
                            onTap: () {
                              setState(() {
                                isExpense = !isExpense;
                              });
                            }),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    isExpense ? const ExpensesForm() : const RevenueForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
