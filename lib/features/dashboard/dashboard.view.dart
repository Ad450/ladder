import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/features/dashboard/widget/add.transaction.dart';
import 'package:ladder/features/dashboard/widget/graph.widget.dart';
import 'package:ladder/features/dashboard/widget/transactions.dart';
import 'package:ladder/gen/colors.gen.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  bool isExpense = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.onboardingBackground,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 56.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tracker",
                      style: context.appTheme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: () {
                          // context.push("/addTransaction");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const AddTransaction()));
                        },
                        child: const Icon(Icons.add, size: 50))
                  ],
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 32.h),
                    const GraphWidget(),
                    // SizedBox(height: 16.h),
                    const Transactions()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
