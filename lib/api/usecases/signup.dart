import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/auth.datasource.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class Signup implements Usecase<VoidType, SignupParam> {
  final AuthDatasource _datasource;

  Signup(this._datasource);

  @override
  Future<Either<UIError, VoidType>> call(SignupParam param) async {
    try {
      await _datasource.signup(name: param.name, email: param.email, password: param.password);
      return const Right(VoidType());
    } on ApiFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class SignupParam {
  String name;
  String email;
  String password;

  SignupParam({required this.email, required this.name, required this.password});
}
