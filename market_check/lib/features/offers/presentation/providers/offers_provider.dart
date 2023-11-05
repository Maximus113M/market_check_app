import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_check/features/offers/domain/entities/offer.dart';
import 'package:market_check/features/offers/presentation/providers/offers_repository_provider.dart';

final getOffersProvider =
    StateNotifierProvider<OfferNotifier, List<Offer>>((ref) {
  final offers = ref.watch(offersRepositoryProvider).getOffers;

  return OfferNotifier(fetchMoreOffers: offers);
});

//TODO: POR USAR
/*final offersHorizontalListView = Provider<List<Offer>>((ref) {
  final offerList = ref.watch(getOffersProvider);
  if (offerList.isEmpty) return [];
  return offerList;
});*/

//Caso de uso, define cargar ofertas
typedef OfferCallback = Future<List<Offer>> Function({int page});

//Provider Controller
class OfferNotifier extends StateNotifier<List<Offer>> {
  OfferCallback fetchMoreOffers;
  bool isLoading = false;

  //TODO: Remove initial offer from STATE
  OfferNotifier({required this.fetchMoreOffers})
      : super([
          /*Offer(
              active: true,
              storeId: 1122,
              id: 1,
              date: DateTime(DateTime.september),
              name: "Promo 2x1",
              poster: "assets/Images/offers/offer11.jpg",
              items: [],
              categories: [],
              description: "Super oferta este mes",
              price: 49900)*/
        ]);

  Future<void> loadOffers() async {
    if (isLoading) return;
    isLoading = true;

    final List<Offer> offers = await fetchMoreOffers();
    state = [...state, ...offers];

    await Future.delayed(const Duration(milliseconds: 400));
    isLoading = false;
  }
}
