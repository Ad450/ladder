import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/revenue.datasource.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class DeleteRevenue implements Usecase<VoidType, String> {
  final RevenueDatasource _datasource;

  DeleteRevenue(this._datasource);

  @override
  Future<Either<UIError, VoidType>> call(String param) async {
    try {
      await _datasource.deleteRevenue(param);
      return const Right(VoidType());
    } on ApiFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
