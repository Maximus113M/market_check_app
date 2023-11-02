import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_check/domain/entities/store.dart';
import 'package:market_check/presentation/providers/stores/stores_repository_provider.dart';

final getStoresProvider =
    StateNotifierProvider<StoreNotifier, List<Store>>((ref) {
  final stores = ref.watch(storesRepositoryProvider).getStore;

  return StoreNotifier(fetchMoreStores: stores);
});

final storesListTile = Provider<List<Store>>((ref) {
  final storeList = ref.watch(getStoresProvider);
  if (storeList.isEmpty) return [];
  return storeList;
});

//Caso de uso, define cargar tiendas
typedef StoreCallback = Future<List<Store>> Function();

//Provider Controller
class StoreNotifier extends StateNotifier<List<Store>> {
  final StoreCallback fetchMoreStores;
  bool isLoading = false;

  StoreNotifier({required this.fetchMoreStores}) : super([]);

  Future<void> loadStores() async {
    if (isLoading) return;
    isLoading = true;

    final stores = await fetchMoreStores();
    state = [...state, ...stores];

    await Future.delayed(const Duration(milliseconds: 400));
    isLoading = false;
  }
}
