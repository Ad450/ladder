import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/expenses.datasource.dart';
import 'package:ladder/api/models/expense.model.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class FetchExpenses implements Usecase<List<ExpenseModel>, NoParam> {
  final ExpensesDatasource _datasource;

  FetchExpenses(this._datasource);

  @override
  Future<Either<UIError, List<ExpenseModel>>> call(NoParam param) async {
    try {
      final result = await _datasource.fetchExpenses();
      return Right(result);
    } on ApiFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
