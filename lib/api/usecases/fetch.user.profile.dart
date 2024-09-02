import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/auth.datasource.dart';
import 'package:ladder/api/models/user.model.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class FetchUserProfile implements Usecase<UserModel, NoParam> {
  final AuthDatasource _datasource;

  FetchUserProfile(this._datasource);

  @override
  Future<Either<UIError, UserModel>> call(NoParam param) async {
    try {
      final result = await _datasource.fetchProfile();
      return Right(result);
    } on ApiFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
