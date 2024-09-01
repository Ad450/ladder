import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/auth.datasource.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class Signin implements Usecase<VoidType, SigninParam> {
  final AuthDatasource _datasource;

  Signin(this._datasource);

  @override
  Future<Either<UIError, VoidType>> call(SigninParam param) async {
    try {
      await _datasource.signin(email: param.email, password: param.password);
      return const Right(VoidType());
    } on ApiFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class SigninParam {
  String email;
  String password;

  SigninParam({required this.email, required this.password});
}
