import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:ladder/api/datasources/auth.datasource.dart';
import 'package:ladder/api/datasources/expenses.datasource.dart';
import 'package:ladder/api/datasources/metrics.datasource.dart';
import 'package:ladder/api/datasources/revenue.datasource.dart';
import 'package:ladder/api/models/expenses.dart';
import 'package:ladder/api/models/revenue.dart';
import 'package:ladder/api/models/transactions.dart';
import 'package:ladder/api/store/ladder.store.dart';
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

final locator = GetIt.instance;

void setupLocator() {
  // register hive adapters
  Hive.registerAdapter<RevenueModel>(RevenueModelAdapter());
  Hive.registerAdapter<ExpenseModel>(ExpenseModelAdapter());
  Hive.registerAdapter<TransactionModel>(TransactionModelAdapter());

// datasources
  locator.registerLazySingleton<HiveStore>(() => HiveStore());
  locator.registerLazySingleton<ExpensesDatasource>(
    () => ExpensesDatasourceImpl(locator.get<HiveStore>()),
  );
  locator.registerLazySingleton<RevenueDatasource>(
    () => RevenueDatasourceImpl(locator.get<HiveStore>()),
  );

  locator.registerLazySingleton<MetricsDatasource>(
    () => MetricsDatasourceImpl(
      locator.get<ExpensesDatasource>(),
      locator.get<RevenueDatasource>(),
      locator.get<HiveStore>(),
    ),
  );

  locator.registerLazySingleton<AuthDatasource>(
    () => AuthDatasourceImpl(
      locator.get<HiveStore>(),
      FirebaseAuth.instance,
    ),
  );

// usecases

  locator.registerLazySingleton<FetchExpenses>(
    () => FetchExpenses(locator.get<ExpensesDatasource>()),
  );
  locator.registerLazySingleton<AddExpenses>(
    () => AddExpenses(locator.get<ExpensesDatasource>()),
  );
  locator.registerLazySingleton<FetchRevenues>(
    () => FetchRevenues(locator.get<RevenueDatasource>()),
  );
  locator.registerLazySingleton<AddRevenue>(
    () => AddRevenue(locator.get<RevenueDatasource>()),
  );

  locator.registerLazySingleton<FetchMetrics>(
    () => FetchMetrics(locator.get<MetricsDatasource>()),
  );

  locator.registerLazySingleton<FetchTransactions>(
    () => FetchTransactions(locator.get<MetricsDatasource>()),
  );

  locator.registerLazySingleton<Signin>(
    () => Signin(locator.get<AuthDatasource>()),
  );
  locator.registerLazySingleton<Signup>(
    () => Signup(locator.get<AuthDatasource>()),
  );

  locator.registerLazySingleton<Signout>(
    () => Signout(locator.get<AuthDatasource>()),
  );

  locator.registerLazySingleton<UpdateUser>(
    () => UpdateUser(locator.get<AuthDatasource>()),
  );

  locator.registerLazySingleton<CheckAuthStaus>(
    () => CheckAuthStaus(locator.get<HiveStore>()),
  );

  locator.registerLazySingleton<FetchUserProfile>(
    () => FetchUserProfile(locator.get<AuthDatasource>()),
  );
}
