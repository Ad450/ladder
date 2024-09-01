import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/metrics.datasource.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class FetchTransactions implements Usecase<List<dynamic>, NoParam> {
  final MetricsDatasource _datasource;

  FetchTransactions(this._datasource);

  @override
  Future<Either<UIError, List<dynamic>>> call(NoParam param) async {
    try {
      final result = await _datasource.fetchTransations();
      return Right(result);
    } on HiveFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
