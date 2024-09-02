// Mocks generated by Mockito 5.4.4 from annotations
// in ladder/test/transactions_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter/material.dart' as _i9;
import 'package:flutter_bloc/flutter_bloc.dart' as _i18;
import 'package:ladder/api/models/expense.model.dart' as _i14;
import 'package:ladder/api/models/revenue.model.dart' as _i15;
import 'package:ladder/api/usecases/add.expenses.dart' as _i3;
import 'package:ladder/api/usecases/add.revenue.dart' as _i4;
import 'package:ladder/api/usecases/deletel.revenue.dart' as _i7;
import 'package:ladder/api/usecases/fetch.expenses.dart' as _i5;
import 'package:ladder/api/usecases/fetch.revenues.dart' as _i6;
import 'package:ladder/api/usecases/fetch.transactions.dart' as _i8;
import 'package:ladder/api/utils/api.errors.dart' as _i12;
import 'package:ladder/api/utils/helpers.dart' as _i13;
import 'package:ladder/features/dashboard/state/dashboard.bloc.dart' as _i16;
import 'package:ladder/features/dashboard/state/dashboard.event.dart' as _i17;
import 'package:ladder/features/dashboard/state/dashboard.state.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddExpenses_1 extends _i1.SmartFake implements _i3.AddExpenses {
  _FakeAddExpenses_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddRevenue_2 extends _i1.SmartFake implements _i4.AddRevenue {
  _FakeAddRevenue_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFetchExpenses_3 extends _i1.SmartFake implements _i5.FetchExpenses {
  _FakeFetchExpenses_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFetchRevenues_4 extends _i1.SmartFake implements _i6.FetchRevenues {
  _FakeFetchRevenues_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDeleteRevenue_5 extends _i1.SmartFake implements _i7.DeleteRevenue {
  _FakeDeleteRevenue_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFetchTransactions_6 extends _i1.SmartFake
    implements _i8.FetchTransactions {
  _FakeFetchTransactions_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTextEditingController_7 extends _i1.SmartFake
    implements _i9.TextEditingController {
  _FakeTextEditingController_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDashboardState_8 extends _i1.SmartFake
    implements _i10.DashboardState {
  _FakeDashboardState_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AddExpenses].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddExpenses extends _i1.Mock implements _i3.AddExpenses {
  MockAddExpenses() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i2.Either<_i12.UIError, _i13.VoidType>> call(
          _i3.AddExpensesParam? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue: _i11.Future<_i2.Either<_i12.UIError, _i13.VoidType>>.value(
            _FakeEither_0<_i12.UIError, _i13.VoidType>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i11.Future<_i2.Either<_i12.UIError, _i13.VoidType>>);
}

/// A class which mocks [AddRevenue].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddRevenue extends _i1.Mock implements _i4.AddRevenue {
  MockAddRevenue() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i2.Either<_i12.UIError, _i13.VoidType>> call(
          _i4.AddRevenueParam? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue: _i11.Future<_i2.Either<_i12.UIError, _i13.VoidType>>.value(
            _FakeEither_0<_i12.UIError, _i13.VoidType>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i11.Future<_i2.Either<_i12.UIError, _i13.VoidType>>);
}

/// A class which mocks [FetchExpenses].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchExpenses extends _i1.Mock implements _i5.FetchExpenses {
  MockFetchExpenses() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i2.Either<_i12.UIError, List<_i14.ExpenseModel>>> call(
          _i13.NoParam? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue: _i11
            .Future<_i2.Either<_i12.UIError, List<_i14.ExpenseModel>>>.value(
            _FakeEither_0<_i12.UIError, List<_i14.ExpenseModel>>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i11.Future<_i2.Either<_i12.UIError, List<_i14.ExpenseModel>>>);
}

/// A class which mocks [FetchRevenues].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchRevenues extends _i1.Mock implements _i6.FetchRevenues {
  MockFetchRevenues() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i2.Either<_i12.UIError, List<_i15.RevenueModel>>> call(
          _i13.NoParam? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue: _i11
            .Future<_i2.Either<_i12.UIError, List<_i15.RevenueModel>>>.value(
            _FakeEither_0<_i12.UIError, List<_i15.RevenueModel>>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i11.Future<_i2.Either<_i12.UIError, List<_i15.RevenueModel>>>);
}

/// A class which mocks [FetchTransactions].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchTransactions extends _i1.Mock implements _i8.FetchTransactions {
  MockFetchTransactions() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i2.Either<_i12.UIError, List<dynamic>>> call(
          _i13.NoParam? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue: _i11.Future<_i2.Either<_i12.UIError, List<dynamic>>>.value(
            _FakeEither_0<_i12.UIError, List<dynamic>>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i11.Future<_i2.Either<_i12.UIError, List<dynamic>>>);
}

/// A class which mocks [DeleteRevenue].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteRevenue extends _i1.Mock implements _i7.DeleteRevenue {
  MockDeleteRevenue() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i2.Either<_i12.UIError, _i13.VoidType>> call(String? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue: _i11.Future<_i2.Either<_i12.UIError, _i13.VoidType>>.value(
            _FakeEither_0<_i12.UIError, _i13.VoidType>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i11.Future<_i2.Either<_i12.UIError, _i13.VoidType>>);
}

/// A class which mocks [DashboardBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockDashboardBloc extends _i1.Mock implements _i16.DashboardBloc {
  MockDashboardBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.AddExpenses get addExpenses => (super.noSuchMethod(
        Invocation.getter(#addExpenses),
        returnValue: _FakeAddExpenses_1(
          this,
          Invocation.getter(#addExpenses),
        ),
      ) as _i3.AddExpenses);

  @override
  _i4.AddRevenue get addRevenue => (super.noSuchMethod(
        Invocation.getter(#addRevenue),
        returnValue: _FakeAddRevenue_2(
          this,
          Invocation.getter(#addRevenue),
        ),
      ) as _i4.AddRevenue);

  @override
  _i5.FetchExpenses get fetchExpenses => (super.noSuchMethod(
        Invocation.getter(#fetchExpenses),
        returnValue: _FakeFetchExpenses_3(
          this,
          Invocation.getter(#fetchExpenses),
        ),
      ) as _i5.FetchExpenses);

  @override
  _i6.FetchRevenues get fetchRevenues => (super.noSuchMethod(
        Invocation.getter(#fetchRevenues),
        returnValue: _FakeFetchRevenues_4(
          this,
          Invocation.getter(#fetchRevenues),
        ),
      ) as _i6.FetchRevenues);

  @override
  _i7.DeleteRevenue get deleteRevenue => (super.noSuchMethod(
        Invocation.getter(#deleteRevenue),
        returnValue: _FakeDeleteRevenue_5(
          this,
          Invocation.getter(#deleteRevenue),
        ),
      ) as _i7.DeleteRevenue);

  @override
  _i8.FetchTransactions get fetchTransactions => (super.noSuchMethod(
        Invocation.getter(#fetchTransactions),
        returnValue: _FakeFetchTransactions_6(
          this,
          Invocation.getter(#fetchTransactions),
        ),
      ) as _i8.FetchTransactions);

  @override
  _i9.TextEditingController get expensesAmountController => (super.noSuchMethod(
        Invocation.getter(#expensesAmountController),
        returnValue: _FakeTextEditingController_7(
          this,
          Invocation.getter(#expensesAmountController),
        ),
      ) as _i9.TextEditingController);

  @override
  _i9.TextEditingController get expensesNameController => (super.noSuchMethod(
        Invocation.getter(#expensesNameController),
        returnValue: _FakeTextEditingController_7(
          this,
          Invocation.getter(#expensesNameController),
        ),
      ) as _i9.TextEditingController);

  @override
  _i9.TextEditingController get expenseCategoryController =>
      (super.noSuchMethod(
        Invocation.getter(#expenseCategoryController),
        returnValue: _FakeTextEditingController_7(
          this,
          Invocation.getter(#expenseCategoryController),
        ),
      ) as _i9.TextEditingController);

  @override
  _i9.TextEditingController get revenueAmountController => (super.noSuchMethod(
        Invocation.getter(#revenueAmountController),
        returnValue: _FakeTextEditingController_7(
          this,
          Invocation.getter(#revenueAmountController),
        ),
      ) as _i9.TextEditingController);

  @override
  _i9.TextEditingController get revenueNameController => (super.noSuchMethod(
        Invocation.getter(#revenueNameController),
        returnValue: _FakeTextEditingController_7(
          this,
          Invocation.getter(#revenueNameController),
        ),
      ) as _i9.TextEditingController);

  @override
  _i10.DashboardState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeDashboardState_8(
          this,
          Invocation.getter(#state),
        ),
      ) as _i10.DashboardState);

  @override
  _i11.Stream<_i10.DashboardState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i11.Stream<_i10.DashboardState>.empty(),
      ) as _i11.Stream<_i10.DashboardState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void add(_i17.DashboardEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i17.DashboardEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i10.DashboardState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i17.DashboardEvent>(
    _i18.EventHandler<E, _i10.DashboardState>? handler, {
    _i18.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i18.Transition<_i17.DashboardEvent, _i10.DashboardState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  void onChange(_i18.Change<_i10.DashboardState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}
