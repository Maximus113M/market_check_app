import 'package:market_check/features/offers/domain/entities/offer.dart';
import 'package:market_check/features/offers/data/models/offers_db_response.dart';

class OfferMapper {
  static Offer offersReponseToEntity(OfferDB offerDb) => Offer(
        active: offerDb.active,
        storeId: offerDb.storeId,
        id: offerDb.id,
        date: offerDb.date,
        name: offerDb.name,
        poster: offerDb.poster,
        items: (offerDb.items.isNotEmpty) ? offerDb.items : null,
        categories: (offerDb.categories.isNotEmpty) ? offerDb.categories : null,
        description: offerDb.description,
        price: offerDb.price.toInt(),
      );
}
