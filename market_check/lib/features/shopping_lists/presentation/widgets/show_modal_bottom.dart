import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_button.dart';
import 'package:market_check/config/shared/widgets/text_form_fields/custom_text_form_field.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';
import 'package:provider/provider.dart';

class ShowModalBottomSheet extends StatelessWidget {
  
  const ShowModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String listName = "";
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom * 0.7,
              ),
              child: SizedBox(
                width: double.infinity,
                height: ScreenSize.absoluteHeight * 0.3,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenSize.absoluteHeight * 0.05,
                      horizontal: ScreenSize.width * 0.06),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Crear lista',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        onChange: (value) {
                        listName = value;
                        },
                        hint: 'Nombre de la lista',
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        text: 'Crear lista',
                        action: () {
                          final String listname = listName;
                          context.read<ShoppingListsProvider>().createShoppingList(context, listname);
                          context.pop();
                        },
                        horizontalMargin: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      icon: const Icon(Icons.add,
      color: AppColors.appSecondary,
      size: 30),
    );
  }
}
