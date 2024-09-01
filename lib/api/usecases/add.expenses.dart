import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/expenses.datasource.dart';
import 'package:ladder/api/models/expenses.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class AddExpenses implements Usecase<VoidType, AddExpensesParam> {
  final ExpensesDatasource _datasource;

  AddExpenses(this._datasource);

  @override
  Future<Either<UIError, VoidType>> call(AddExpensesParam param) async {
    try {
      await _datasource.addExpenses(
        ExpenseModel.build(
          uid: "uid",
          name: param.name,
          amount: param.amount,
          category: param.category,
        ),
      );
      return const Right(VoidType());
    } on HiveFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class AddExpensesParam {
  final String name;
  final String category;
  final String amount;

  AddExpensesParam({
    required this.name,
    required this.amount,
    required this.category,
  });
}
