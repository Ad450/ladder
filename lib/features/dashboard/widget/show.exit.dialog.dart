import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/features/dashboard/state/dashboard.bloc.dart';
import 'package:ladder/features/dashboard/state/dashboard.event.dart';
import 'package:ladder/features/dashboard/state/metrics.bloc.dart';
import 'package:ladder/features/dashboard/state/metrics.event.dart';
import 'package:ladder/features/home/home.view.dart';
import 'package:ladder/gen/colors.gen.dart';

void _clearTextfield(BuildContext context) {
  context.read<DashboardBloc>().expensesAmountController.clear();
  context.read<DashboardBloc>().expensesNameController.clear();
  context.read<DashboardBloc>().revenueAmountController.clear();
  context.read<DashboardBloc>().revenueNameController.clear();
}

void showExitDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorName.white,
          title: Text(
            'Confirm Navigation',
            style: context.appTheme.textTheme.displayMedium?.copyWith(
              fontSize: 25,
              color: ColorName.onBackground,
            ),
          ),
          content: Text(
            'Transaction created successfully!',
            style: context.appTheme.textTheme.displayMedium?.copyWith(
              fontSize: 20,
              color: ColorName.onBackground,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog and stay on the current page
                Navigator.pop(context);
                _clearTextfield(context);
              },
              child: const Text('Stay'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeView()),
                  (predicate) => true,
                );
                _clearTextfield(context);
                context.read<MetricsBloc>().add(FetchMetricsEvent());
                context.read<DashboardBloc>().add(FetchRevenuesEvent());
              },
              child: const Text('Go to Home'),
            ),
          ],
        );
      });
}
