import 'package:market_check/features/stores/domain/entities/store.dart';

abstract class StoreRepository {
  Future<List<Store>> getStore();
}
