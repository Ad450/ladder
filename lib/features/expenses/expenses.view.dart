import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/core/widgets/ladder.toast.dart';
import 'package:ladder/core/widgets/ladder.transaction.widget.dart';
import 'package:ladder/features/expenses/state/expenses.bloc.dart';
import 'package:ladder/features/expenses/state/expenses.event.dart';
import 'package:ladder/features/expenses/state/expenses.state.dart';
import 'package:ladder/features/expenses/widgets/category.container.dart';
import 'package:ladder/gen/colors.gen.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({super.key});

  @override
  State<ExpensesView> createState() => _ExpensesViewState();
}

class _ExpensesViewState extends State<ExpensesView> {
  final Set<String> _items = {"Transport", "Household", "Food"};
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
            children: [
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
                                    case "Household":
                                      context.read<ExpensesBloc>().add(FetchHouseholdExpensesEvent());
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

              // fetch all transport expenses

              if (selectedCategory == "Transport")
                BlocConsumer<ExpensesBloc, ExpensesState>(
                  listener: (_, state) => state.maybeMap(
                    orElse: () => null,
                    error: (state) => showToast(state.message),
                  ),
                  builder: (_, state) => state.maybeMap(
                    orElse: () => const Column(),
                    fetchTransportExpensesLoading: (state) => const CardLoading(
                      height: 100,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    fetchTransportExpensesSuccess: (state) {
                      if (state.expenses.isEmpty) {
                        return Align(
                          alignment: Alignment.center,
                          child: Text(
                            "No expenses recorded",
                            style: context.appTheme.textTheme.displaySmall
                                ?.copyWith(fontSize: 15, color: ColorName.onBackground, fontWeight: FontWeight.normal),
                          ),
                        );
                      }
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: state.expenses.map((e) {
                              var options = Options(format: Format.hex, colorType: ColorType.green);
                              var randomColor = RandomColor.getColor(options);

                              return TransactionWidget(
                                title: e.name,
                                category: e.category,
                                amount: e.amount,
                                date: e.date.toString().split(" ")[0],
                                backgroundColor: HexColor(randomColor),
                                textColor: ColorName.white,
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),

              // fetch all household expenses

              if (selectedCategory == "Household")
                BlocConsumer<ExpensesBloc, ExpensesState>(
                  listener: (_, state) => state.maybeMap(
                    orElse: () => null,
                    error: (state) => showToast(state.message),
                  ),
                  builder: (_, state) => state.maybeMap(
                    orElse: () => const Column(),
                    fetchHouseholdExpensesLoading: (state) => const CardLoading(
                      height: 100,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    fetchHouseholdExpensesSuccess: (state) {
                      if (state.expenses.isEmpty) {
                        return Align(
                          alignment: Alignment.center,
                          child: Text(
                            "No expenses recorded",
                            style: context.appTheme.textTheme.displaySmall
                                ?.copyWith(fontSize: 15, color: ColorName.onBackground, fontWeight: FontWeight.normal),
                          ),
                        );
                      }
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: state.expenses.map((e) {
                              var options = Options(format: Format.hex, colorType: ColorType.green);
                              var randomColor = RandomColor.getColor(options);

                              return TransactionWidget(
                                title: e.name,
                                category: e.category,
                                amount: e.amount,
                                date: e.date.toString().split(" ")[0],
                                backgroundColor: HexColor(randomColor),
                                textColor: ColorName.white,
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),

              // fetch all food expenses

              if (selectedCategory == "Food")
                BlocConsumer<ExpensesBloc, ExpensesState>(
                  listener: (_, state) => state.maybeMap(
                    orElse: () => null,
                    error: (state) => showToast(state.message),
                  ),
                  builder: (_, state) => state.maybeMap(
                    orElse: () => const Column(),
                    fetchFoodExpensesLoading: (state) => const CardLoading(
                      height: 100,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    fetchFoodExpensesSuccess: (state) {
                      if (state.expenses.isEmpty) {
                        return Align(
                          alignment: Alignment.center,
                          child: Text(
                            "No expenses recorded",
                            style: context.appTheme.textTheme.displaySmall
                                ?.copyWith(fontSize: 15, color: ColorName.onBackground, fontWeight: FontWeight.normal),
                          ),
                        );
                      }
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: state.expenses.map((e) {
                              var options = Options(format: Format.hex, colorType: ColorType.green);
                              var randomColor = RandomColor.getColor(options);

                              return TransactionWidget(
                                title: e.name,
                                category: e.category,
                                amount: e.amount,
                                date: e.date.toString().split(" ")[0],
                                backgroundColor: HexColor(randomColor),
                                textColor: ColorName.white,
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
