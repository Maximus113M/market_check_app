import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/stores/presentation/widgets/stores_body.dart';

class StoresScreen extends StatelessWidget {
  static const String name = "stores-screen";
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: AppColors.gradientColors)),
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18),
            ),
          ),
          title: const Text("Tiendas"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () => context.push('/shopping-cart'),
                icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: const StoresBody(),
        bottomNavigationBar: const GoogleNavBar(),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

//                       //TODO: Extraer en una funcion de busqueda
// Padding(
//                   padding: const EdgeInsets.fromLTRB(45, 10, 45, 0),
//                   child: Column(
//                     children: [
//                       const Text('Ingresa tu ubicacion',
//                           style: TextStyle(
//                               fontSize: 19, fontWeight: FontWeight.bold)),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: TextField(
//                           decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.location_on),
//                               hintText: "Direccion",
//                               border: UnderlineInputBorder()),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25,
//                       ),
//                       const Text('Establecimientos Cercanos',
//                           style: TextStyle(
//                               fontSize: 17, fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 10),
//                       ListTile(
//                         leading:
//                             Image.asset("assets/Images/Almacenes_exito.png"),
//                         title: const Text('Exito la Rosita'),
//                         subtitle: const Text('Calle 45 #17 -17'),
//                         trailing: const Icon(Icons.arrow_circle_right_outlined),
//                       ),
//                       ListTile(
//                         leading:
//                             Image.asset("assets/Images/Almacenes_exito.png"),
//                         title: const Text('Exito la Rosita'),
//                         subtitle: const Text('Calle 45 #17 -17'),
//                         trailing: const Icon(Icons.arrow_circle_right_outlined),
//                       ),
//                       ListTile(
//                         leading:
//                             Image.asset("assets/Images/Almacenes_exito.png"),
//                         title: const Text('Exito la Rosita'),
//                         subtitle: const Text('Calle 45 #17 -17'),
//                         trailing: const Icon(Icons.arrow_circle_right_outlined),
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   )),