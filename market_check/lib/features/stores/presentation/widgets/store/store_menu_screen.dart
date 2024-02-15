import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';

class StoreMenuScreen extends StatelessWidget {
  const StoreMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.location_on,
                size: 35,
                color: AppColors.appPrimary,
              ),
              title: const Text('Puntos de Venta'),
              subtitle: const Text('Encuentra nuestro punto mas cercano.'),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30,
                  )),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.category_rounded,
                size: 35,
                color: AppColors.appPrimary,
              ),
              title: const Text('Ofertas y Categorias'),
              subtitle: const Text('Explora nuestras ofertas y categorias'),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30,
                  )),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.qr_code_scanner_rounded,
                size: 35,
                color: AppColors.appPrimary,
              ),
              title: const Text('Escanea productos'),
              subtitle:
                  const Text('¡Consulta lo productos antes de llevarlos!'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
