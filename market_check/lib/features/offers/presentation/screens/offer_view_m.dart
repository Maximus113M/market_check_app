import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/offers/presentation/providers/offers_provider.dart';
import 'package:market_check/features/offers/presentation/widgets/offer_listview.dart';
import 'package:market_check/features/offers/presentation/widgets/search_product_offer.dart';
import 'package:market_check/features/products/presentation/screens/productos_screen.dart';
import 'package:provider/provider.dart';

class OfferScreeenM extends StatelessWidget {
  static const name = "offers-m";
  const OfferScreeenM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            'Descuentos',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          OffersListview(
            offerList: context.watch<OffersProvider>().offerList,
          ),
          //const SearchProducts(),
          ElevatedButton(
            onPressed: (){
              context.push("/products-view");
            }, 
            child: Text('Productos')),

          
        ],
      ),
    );
  }
}
