import 'package:market_check/features/offers/domain/entities/offer.dart';
import 'package:market_check/json_from_db/json_data.dart';
import 'package:market_check/features/offers/data/models/offer_mapper.dart';
import 'package:market_check/features/offers/data/models/offers_db_response.dart';

abstract class OfferDatasource {
  Future<List<Offer>> getOffers();
}

class OffersDBDatasource extends OfferDatasource {
  //Cuando cambie a http, aca se hara la instancia del gestor
  //
  //

  //Function json to offer list
  List<Offer> _jsonToOfferList(Map<String, dynamic> json) {
    //Instancia json de la peticion http
    final offersDbResponse = OffersDbResponse.fromJson(json);
    //Se utiliza el mapper
    final List<Offer> offers = offersDbResponse.results
        //.where((offerDb) => offerDb.poster != '')
        .map((offerDb) => OfferMapper.offersReponseToEntity(offerDb))
        .toList();
    return offers;
  }

  @override
  Future<List<Offer>> getOffers({page = 1}) async {
    //Instancia de json (can be http instance)
    final offers = offersJson;
    return _jsonToOfferList(offers);
  }
}
