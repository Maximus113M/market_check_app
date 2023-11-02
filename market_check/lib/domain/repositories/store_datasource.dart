import 'package:market_check/domain/entities/store.dart';

abstract class StoreRepository {
  Future<List<Store>> getStore();
}
