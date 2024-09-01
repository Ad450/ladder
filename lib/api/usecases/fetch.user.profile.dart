import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/auth.datasource.dart';
import 'package:ladder/api/models/profile.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class FetchUserProfile implements Usecase<ProfileModel, NoParam> {
  final AuthDatasource _datasource;

  FetchUserProfile(this._datasource);

  @override
  Future<Either<UIError, ProfileModel>> call(NoParam param) async {
    try {
      final result = await _datasource.fetchProfile();
      return Right(result);
    } on HiveFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
