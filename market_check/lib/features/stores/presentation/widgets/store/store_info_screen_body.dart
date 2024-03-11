import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

class StoreInfoScreenBody extends StatelessWidget {
  final StoreModel store;
  const StoreInfoScreenBody({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ScreenSize.absoluteHeight * 0.03,
          horizontal: ScreenSize.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          storeBlockInfo(
            icon: Icons.factory,
            title: 'Número de Identificación Tributaria',
            description: '${store.nit}',
          ),
          storeBlockInfo(
            icon: Icons.mail,
            title: 'Correo electrónico',
            description: store.email,
          ),
          storeBlockInfo(
            icon: Icons.phone,
            title: 'Número Telefónico',
            description: '(+57) 3144777990',
          ),
          storeBlockInfo(
            icon: Icons.my_location,
            title: 'Dirección',
            description: store.locations,
          ),
          storeBlockInfo(
            icon: Icons.location_city,
            title: 'Municipio',
            description: 'Floridablanca',
          ),
          storeBlockInfo(
            icon: Icons.location_on,
            title: 'Departamento',
            description: 'Santander',
          ),
        ],
      ),
    );
  }

  Column storeBlockInfo({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: ScreenSize.width * 0.01),
              child: Icon(icon),
            ),
            Text(
              title,
              style: FontStyles.bodyBold0(AppColors.text),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: ScreenSize.width * 0.07),
          child: Text(
            description,
            style: FontStyles.body2(AppColors.text),
          ),
        ),
        SizedBox(
          height: ScreenSize.absoluteHeight * 0.02,
        ),
      ],
    );
  }
}
