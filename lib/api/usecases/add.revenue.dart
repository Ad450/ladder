import 'package:dartz/dartz.dart';
import 'package:ladder/api/datasources/revenue.datasource.dart';
import 'package:ladder/api/models/revenue.model.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:ladder/api/utils/helpers.dart';

class AddRevenue implements Usecase<VoidType, AddRevenueParam> {
  final RevenueDatasource _datasource;

  AddRevenue(this._datasource);

  @override
  Future<Either<UIError, VoidType>> call(AddRevenueParam param) async {
    try {
      await _datasource.addRevenue(
        RevenueModel(
          nameOfRevenue: param.name,
          amount: int.parse(param.amount),
        ),
      );
      return const Right(VoidType());
    } on ApiFailure catch (e) {
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
