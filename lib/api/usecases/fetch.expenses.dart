import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/expenses.datasource.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class FetchExpenses implements Usecase<List<dynamic>, NoParam> {
  final ExpensesDatasource _datasource;

  FetchExpenses(this._datasource);

  @override
  Future<Either<UIError, List<dynamic>>> call(NoParam param) async {
    try {
      final result = await _datasource.fetchExpenses();
      return Right(result);
    } on HiveFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
