import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/domain/entities/store_entity.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:provider/provider.dart';

class StoreView extends StatelessWidget {
  static const String name = 'store-view';
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreEntity store = context.read<StoresProvider>().currentStore!;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: ScreenSize.height * 0.4,
            width: double.infinity,
            child: Image.asset(
              store.poster,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenSize.height * 0.33),
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 25, vertical: 20),
            height: ScreenSize.height * 0.67,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: AppColors.white),
            child: Column(
              children: [
                SizedBox(
                  height: store.name.length > 15
                      ? ScreenSize.height * 0.13
                      : ScreenSize.height * 0.08,
                  child: Text(
                    store.name,
                    style: FontStyles.heading1(AppColors.text),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Text(
                  'Sit laboris commodo ipsum incididunt excepteur dolore laboris irure consectetur. Minim do reprehenderit excepteur enim adipisicing officia cupidatat officia et duis adipisicing laboris et. Velit dolor aliqua sint eiusmod excepteur anim tempor ullamco dolore exercitation ex nostrud aute. Nostrud elit commodo sint dolore sit nostrud. ',
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 23,
                ),
                SizedBox(
                  height: ScreenSize.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.location_on,
                            size: 30,
                          ),
                          title: Text(
                            'Puntos de Venta',
                            style:
                                FontStyles.bodyBold1(AppColors.text),
                          ),
                          subtitle: const Text(
                              'Encuentra nuestro punto mas cercano.'),
                          trailing:
                              const Icon(Icons.arrow_circle_right_outlined),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.coffee,
                            size: 30,
                          ),
                          title: Text(
                            'Categorias',
                            style:
                                FontStyles.bodyBold1(AppColors.text),
                          ),
                          subtitle: const Text(
                              'Encuentra por categoria el producto que deseas.'),
                          trailing:
                              const Icon(Icons.arrow_circle_right_outlined),
                          onTap: () => context.push('/store-categories'),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.qr_code_scanner_rounded,
                            size: 30,
                          ),
                          title: Text('Escanea',
                              style: FontStyles.bodyBold1(
                                  AppColors.text)),
                          subtitle: const Text(
                              '¡Consulta lo productos antes de llevarlos!'),
                          trailing:
                              const Icon(Icons.arrow_circle_right_outlined),
                          onTap: () => context.push('/scanner'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 28,
            left: 3,
            child: IconButton.filledTonal(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back)),
          )
        ],
      ),
    );
  }
}
