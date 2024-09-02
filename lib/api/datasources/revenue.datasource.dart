import 'package:ladder/api/models/revenue.model.dart';
import 'package:ladder/api/network/network.service.dart';
import 'package:ladder/api/utils/api.errors.dart';

abstract class RevenueDatasource {
  Future<List<RevenueModel>> fetchRevenues();
  Future<void> addRevenue(RevenueModel model);
  Future<void> deleteRevenue(String id);
  Future<RevenueModel> getRevenueById(String id);
}

class RevenueDatasourceImpl implements RevenueDatasource {
  final NetworkService networkService;

  RevenueDatasourceImpl(this.networkService);

  @override
  Future<void> addRevenue(RevenueModel model) async {
    final data = {"nameOfRevenue": model.nameOfRevenue, "amount": model.amount};
    try {
      final res = await networkService.post("/user/income", data: data);
      if (res.data != null) {
        return;
      }
      throw ApiFailure(res.code!.toString());
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<List<RevenueModel>> fetchRevenues() async {
    try {
      final res = await networkService.getHttp("/user/income");
      if (res.data != null) {
        return (res.data!["data"] as List)
            .map(
              (e) => RevenueModel(
                nameOfRevenue: e["nameOfRevenue"],
                amount: e["amount"],
                id: e["id"].toString(),
              ),
            )
            .toList();
      }
      throw ApiFailure(res.code!.toString());
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> deleteRevenue(String id) async {
    try {
      final res = await networkService.delete("/user/income/$id");
      if (res.data != null) {
        return;
      }
      throw ApiFailure(res.code!.toString());
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<RevenueModel> getRevenueById(String id) async {
    try {
      final res = await networkService.delete("/user/income/$id");
      if (res.data != null) {
        final data = res.data!;
        return RevenueModel(
          nameOfRevenue: data["nameOfRevenue"],
          amount: data["amount"],
        );
      }
      throw ApiFailure(res.code!.toString());
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }
}
