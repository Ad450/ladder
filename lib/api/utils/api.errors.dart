class UIError {
  final String message;
  const UIError(this.message);
}

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class HiveFailure extends Failure {
  HiveFailure(super.message);
}

class ApiFailure extends Failure {
  ApiFailure(super.message);
}
