import 'package:ladder/api/models/revenue.dart';
import 'package:ladder/api/models/transactions.dart';
import 'package:ladder/api/store/ladder.store.dart';
import 'package:ladder/api/utils/api.errors.dart';

abstract class RevenueDatasource {
  Future<List<dynamic>> fetchRevenues();
  Future<void> addRevenue(RevenueModel model);
}

class RevenueDatasourceImpl implements RevenueDatasource {
  final HiveStore _hiveStore;
  final box = HiveBoxNames.revenues.name;
  final transactionBox = HiveBoxNames.transactions.name;

  RevenueDatasourceImpl(this._hiveStore);

  @override
  Future<void> addRevenue(RevenueModel model) async {
    try {
      await _hiveStore.saveItem(
        model,
        box,
        key: model.name.replaceAll(" ", ""),
      );
      await _hiveStore.saveItem(
          TransactionModel.build(
            uid: model.uid,
            name: model.name,
            amount: model.amount,
            category: "Revenue",
          ),
          transactionBox,
          key: model.name.replaceAll(" ", ""));
    } catch (e) {
      throw HiveFailure(e.toString());
    }
  }

  @override
  Future<List<dynamic>> fetchRevenues() async {
    try {
      final revenues = await _hiveStore.readAll(box);
      return revenues;
    } catch (e) {
      throw HiveFailure(e.toString());
    }
  }
}
