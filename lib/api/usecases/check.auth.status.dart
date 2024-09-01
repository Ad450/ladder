import 'package:dartz/dartz.dart';
import 'package:ladder/api/store/ladder.store.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class CheckAuthStaus implements Usecase<VoidType, NoParam> {
  final HiveStore _hiveStore;

  CheckAuthStaus(this._hiveStore);

  @override
  Future<Either<UIError, VoidType>> call(NoParam param) async {
    try {
      final id = await _hiveStore.readItem("uid", "uid");

      if (id != null) {
        return const Right(VoidType());
      }
      throw HiveFailure("no user found");
    } on HiveFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
