import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/core/widgets/ladder.toast.dart';
import 'package:ladder/core/widgets/ladder.transaction.widget.dart';
import 'package:ladder/features/expenses/state/expenses.bloc.dart';
import 'package:ladder/features/expenses/state/expenses.event.dart';
import 'package:ladder/features/expenses/state/expenses.state.dart';
import 'package:ladder/gen/colors.gen.dart';

class AllTransportExpenses extends StatelessWidget {
  const AllTransportExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpensesBloc, ExpensesState>(
      listener: (_, state) => state.maybeMap(
        orElse: () => null,
        error: (state) => showToast(state.message),
        deleteExpenseSuccess: (_) {
          Future.delayed(const Duration(milliseconds: 500)).then((value) {
            context.read<ExpensesBloc>().add(FetchTransportExpensesEvent());
            showToast("Expense deleted!");
          });
          return;
        },
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

                  return Dismissible(
                    key: Key(e.id!),
                    onDismissed: (direction) {
                      // if (direction == DismissDirection.horizontal) {
                      // }
                      context.read<ExpensesBloc>().add(DeleteExpenseEvent(e.id!));
                    },
                    child: TransactionWidget(
                      title: e.nameOfItem,
                      category: e.category,
                      amount: e.estimatedAmount.toString(),
                      date: DateTime.now().toString().split(" ")[0],
                      backgroundColor: HexColor(randomColor),
                      textColor: ColorName.white,
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
