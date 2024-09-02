import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/auth.datasource.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class UpdateUser implements Usecase<VoidType, UpdateUserParam> {
  final AuthDatasource _datasource;

  UpdateUser(this._datasource);

  @override
  Future<Either<UIError, VoidType>> call(UpdateUserParam param) async {
    try {
      await _datasource.updateUser(
        name: param.name,
        profileFilePath: param.profileFilePath,
      );
      return const Right(VoidType());
    } on ApiFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class UpdateUserParam {
  String name;
  String? profileFilePath;

  UpdateUserParam({required this.name, this.profileFilePath});
}
