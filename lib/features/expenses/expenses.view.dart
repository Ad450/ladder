import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/features/expenses/state/expenses.bloc.dart';
import 'package:ladder/features/expenses/state/expenses.event.dart';
import 'package:ladder/features/expenses/widgets/all.food.dart';
import 'package:ladder/features/expenses/widgets/all.other.dart';
import 'package:ladder/features/expenses/widgets/all.transport.dart';
import 'package:ladder/features/expenses/widgets/category.container.dart';
import 'package:ladder/gen/colors.gen.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({super.key});

  @override
  State<ExpensesView> createState() => _ExpensesViewState();
}

class _ExpensesViewState extends State<ExpensesView> {
  final Set<String> _items = {"Transport", "Food", "Other"};
  String selectedCategory = "Transport";

  @override
  void initState() {
    super.initState();
    context.read<ExpensesBloc>().add(FetchTransportExpensesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.onboardingBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Tracker",
              //   style: context.appTheme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              // ),
              // SizedBox(height: 20.h),
              // Text(
              //   "Expenses",
              //   style: context.appTheme.textTheme.titleLarge?.copyWith(
              //     fontWeight: FontWeight.normal,
              //     fontSize: 20,
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tracker",
                    style: context.appTheme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorName.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _items
                          .map((e) => CategoryContainer(
                                isSelected: selectedCategory == e,
                                onTap: () {
                                  setState(() {
                                    selectedCategory = e;
                                  });
                                  switch (selectedCategory) {
                                    case "Transport":
                                      context.read<ExpensesBloc>().add(FetchTransportExpensesEvent());
                                      break;
                                    case "Food":
                                      context.read<ExpensesBloc>().add(FetchFoodExpensesEvent());
                                      break;
                                    case "Other":
                                      context.read<ExpensesBloc>().add(FetchExpensesEvent());
                                      break;
                                  }
                                },
                                text: e,
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              // all other transations
              const AllOtherExpenses(),

              // fetch all food expenses

              if (selectedCategory == "Food") const AllFoodExpenses(),

              // fetch transport

              if (selectedCategory == "Transport") const AllTransportExpenses()
            ],
          ),
        ),
      ),
    );
  }
}
