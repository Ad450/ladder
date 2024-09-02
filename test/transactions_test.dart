import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ladder/features/dashboard/state/dashboard.bloc.dart';
import 'package:ladder/features/dashboard/state/dashboard.state.dart';
import 'package:ladder/features/dashboard/widget/transactions.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'transactions_test.mocks.dart';

@GenerateMocks([DashboardBloc])
void main() {
  late MockDashboardBloc bloc;
  setUp(() {
    bloc = MockDashboardBloc();

    // stub state
    when(bloc.state).thenReturn(const DashboardState.fetchRevenueLoading());

    // stub bloc stream or the output stream from bloc
    when(bloc.stream).thenAnswer((_) => Stream.value(const DashboardState.fetchRevenueLoading()));
  });

  tearDown(() {
    bloc.close();
  });

// provide the bloc to the transactions widget as it is in the app widget tree
  Widget createWidgetUnderTest() {
    return BlocProvider<DashboardBloc>(
      create: (_) => bloc,
      child: const MaterialApp(
        home: Scaffold(
          body: Transactions(),
        ),
      ),
    );
  }

  group("Revenues/ Tranasctions ", () {
    testWidgets("display loading indicator when state is fetching", (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createWidgetUnderTest()); // simulate insertion of widget into tree
      await tester.pump(); // give transaction widget time to be inserted

      // Assert
      // expect to find one cardloading widget when loading in progress
      expect(find.byType(CardLoading), findsOneWidget);
    });
  });
}
