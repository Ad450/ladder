import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/auth.datasource.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class Signout implements Usecase<VoidType, NoParam> {
  final AuthDatasource _datasource;

  Signout(this._datasource);

  @override
  Future<Either<UIError, VoidType>> call(NoParam param) async {
    try {
      await _datasource.signout();
      return const Right(VoidType());
    } on HiveFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
