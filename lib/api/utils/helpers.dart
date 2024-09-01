import 'package:dartz/dartz.dart';
import 'package:ladder/api/utils/api.errors.dart';

/// An Interface that must be implemented by all usecases
/// All subclasses will be callable like functions through
/// the implemented [call] method
abstract class Usecase<R, P> {
  Future<Either<UIError, R>> call(P param);
}

/// VoidType is the returned object for a usecase call
/// that returns void
class VoidType {
  const VoidType();
}

/// NoParam is the parameter of a usecase call that
/// that accepts no argument
class NoParam {
  const NoParam();
}

///[guardedApiCall] wraps a datasource call to handle
/// exceptions of type HiveFailure.
/// If the datasource call fails with an HiveFailure,
///it rethrows the exception as a UIError

Future<T> guardedApiCall<T>(Function func) async {
  try {
    return await func() as T;
  } on HiveFailure catch (e) {
    throw UIError(e.message);
  } catch (e) {
    throw UIError(e.toString());
  }
}
