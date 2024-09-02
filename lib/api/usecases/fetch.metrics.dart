import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/metrics.datasource.dart';
import 'package:ladder/api/models/metrics.model.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class FetchMetrics implements Usecase<MetricsModel, NoParam> {
  final MetricsDatasource _datasource;

  FetchMetrics(this._datasource);

  @override
  Future<Either<UIError, MetricsModel>> call(NoParam param) async {
    try {
      final result = await _datasource.fetchMetrics();
      return Right(result);
    } on ApiFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
