import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/core/widgets/ladder.toast.dart';
import 'package:ladder/core/widgets/ladder.transaction.widget.dart';
import 'package:ladder/features/dashboard/state/dashboard.bloc.dart';
import 'package:ladder/features/dashboard/state/dashboard.event.dart';
import 'package:ladder/features/dashboard/state/dashboard.state.dart';
import 'package:ladder/gen/colors.gen.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(FetchRevenuesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (_, state) => state.maybeMap(
        orElse: () => null,
        deleteRevenueSuccess: (_) {
          Future.delayed(const Duration(milliseconds: 500)).then((value) {
            context.read<DashboardBloc>().add(FetchRevenuesEvent());
            showToast("Revenue deleted!");
          });
          return;
        },
      ),
      builder: (_, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Revenues",
            style: context.appTheme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 16.h),

          // show all revenues
          ...state.maybeMap(
            orElse: () => [], // show an empty revenues list indicator ,
            error: (state) {
              showToast(state.message);
              return [];
            },
            fetchRevenueLoading: (state) => [
              const CardLoading(
                height: 100,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                margin: EdgeInsets.only(bottom: 10),
              )
            ],
            fetchRevenueSuccess: (state) {
              if (state.revenues.isEmpty) {
                return [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Get Started by adding Revenues",
                      style: context.appTheme.textTheme.displaySmall
                          ?.copyWith(fontSize: 15, color: ColorName.onBackground, fontWeight: FontWeight.normal),
                    ),
                  )
                ];
              }
              return state.revenues
                  .map(
                    (e) => Dismissible(
                      key: Key(e.id!),
                      onDismissed: (direction) {
                        // if (direction == DismissDirection.horizontal) {
                        // }
                        context.read<DashboardBloc>().add(DeleteRevenueEvent(e.id!));
                      },
                      child: TransactionWidget(
                        title: e.nameOfRevenue,
                        category: "Revenue",
                        amount: e.amount.toString(),
                        date: DateTime.now().toString().split(" ")[0],
                      ),
                    ),
                  )
                  .toList();
            },
          )
        ],
      ),
    );
  }
}
