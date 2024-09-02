import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/revenue.datasource.dart';
import 'package:ladder/api/models/revenue.model.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class FetchRevenues implements Usecase<List<dynamic>, NoParam> {
  final RevenueDatasource _datasource;

  FetchRevenues(this._datasource);

  @override
  Future<Either<UIError, List<RevenueModel>>> call(NoParam param) async {
    try {
      final result = await _datasource.fetchRevenues();
      return Right(result);
    } on ApiFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
