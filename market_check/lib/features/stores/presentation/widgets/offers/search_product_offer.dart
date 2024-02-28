import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';

import 'package:provider/provider.dart';

class SearchProducts extends StatelessWidget {
  const SearchProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Stack(
        children: [
          CustomTextFormField(
            icon: Icons.search_outlined,
            hint: 'Buscar productos',
            textController:
                context.read<ProductsProvider>().searchTextController,
            onChange: (value) =>
                context.read<ProductsProvider>().searchProducts(value),
          ),
          if (context
              .watch<ProductsProvider>()
              .searchTextController
              .text
              .isNotEmpty)
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () => context.read<ProductsProvider>().clearSearch(),
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: AppColors.text,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
