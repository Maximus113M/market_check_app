import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';

class SearchProducts extends StatelessWidget {
  const SearchProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      icon: Icons.search_outlined,
      hint: 'Buscar productos',
      onChange: (p0){},);
  }
}