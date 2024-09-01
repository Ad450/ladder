import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/revenue.datasource.dart';
import 'package:ladder/api/models/revenue.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class AddRevenue implements Usecase<VoidType, AddRevenueParam> {
  final RevenueDatasource _datasource;

  AddRevenue(this._datasource);

  @override
  Future<Either<UIError, VoidType>> call(AddRevenueParam param) async {
    try {
      await _datasource.addRevenue(
        RevenueModel.build(
          uid: "uid",
          name: param.name,
          amount: param.amount,
        ),
      );
      return const Right(VoidType());
    } on HiveFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class AddRevenueParam {
  final String name;
  final String amount;

  AddRevenueParam({
    required this.name,
    required this.amount,
  });
}
