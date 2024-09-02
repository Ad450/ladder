import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ladder/api/usecases/add.expenses.dart';
import 'package:ladder/api/usecases/add.revenue.dart';
import 'package:ladder/api/usecases/check.auth.status.dart';
import 'package:ladder/api/usecases/fetch.expenses.dart';
import 'package:ladder/api/usecases/fetch.metrics.dart';
import 'package:ladder/api/usecases/fetch.revenues.dart';
import 'package:ladder/api/usecases/fetch.transactions.dart';
import 'package:ladder/api/usecases/fetch.user.profile.dart';
import 'package:ladder/api/usecases/signin.dart';
import 'package:ladder/api/usecases/signout.dart';
import 'package:ladder/api/usecases/signup.dart';
import 'package:ladder/api/usecases/update.user.dart';
import 'package:ladder/core/app/app.locator.dart';
import 'package:ladder/features/auth/state/auth.bloc.dart';
import 'package:ladder/features/auth/state/auth.event.dart';
import 'package:ladder/features/dashboard/state/dashboard.bloc.dart';
import 'package:ladder/features/dashboard/state/metrics.bloc.dart';
import 'package:ladder/features/expenses/state/expenses.bloc.dart';

final dashboardBloc = BlocProvider(
  create: (_) => DashboardBloc(
    addExpenses: locator.get<AddExpenses>(),
    addRevenue: locator.get<AddRevenue>(),
    fetchExpenses: locator.get<FetchExpenses>(),
    fetchRevenues: locator.get<FetchRevenues>(),
    fetchTransactions: locator.get<FetchTransactions>(),
  ),
);

final expensesBloc = BlocProvider(
  create: (_) => ExpensesBloc(
    fetchExpenses: locator.get<FetchExpenses>(),
    fetchRevenues: locator.get<FetchRevenues>(),
  ),
);

final metricsBloc = BlocProvider(
  create: (_) => MetricsBloc(
    fetchMetrics: locator.get<FetchMetrics>(),
  ),
);

final authBloc = BlocProvider(
  create: (_) => AuthBloc(
    signin: locator.get<Signin>(),
    signup: locator.get<Signup>(),
    signout: locator.get<Signout>(),
    // updateUser: locator.get<UpdateUser>(),
    checkAuthStaus: locator.get<CheckAuthStaus>(),
    fetchUserProfile: locator.get<FetchUserProfile>(),
  )..add(AppStartedEvent()),
);
