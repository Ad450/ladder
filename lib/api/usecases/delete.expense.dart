import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/expenses.datasource.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class DeleteExpense implements Usecase<VoidType, String> {
  final ExpensesDatasource _datasource;

  DeleteExpense(this._datasource);

  @override
  Future<Either<UIError, VoidType>> call(String param) async {
    try {
      await _datasource.deleteExpense(param);
      return const Right(VoidType());
    } on ApiFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
