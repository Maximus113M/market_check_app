import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/domain/entities/store.dart';
import 'package:market_check/presentation/providers/stores/stores_provider.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';

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
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(18))),
          title: const Text("Tiendas"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: const _StoresView(),
        bottomNavigationBar: const GoogleNavBar(),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class _StoresView extends ConsumerStatefulWidget {
  const _StoresView();

  @override
  _StoresViewState createState() => _StoresViewState();
}

class _StoresViewState extends ConsumerState<_StoresView> {
  @override
  void initState() {
    super.initState();
    ref.read(storesListTile);
  }

  @override
  Widget build(BuildContext context) {
    final stores = ref.watch(storesListTile);
    final screenSize = MediaQuery.of(context).size;
    //final textStyles = Theme.of(context).textTheme;
    return Container(
        height: screenSize.height * 0.85,
        width: screenSize.width,
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
        margin: EdgeInsets.fromLTRB(
            screenSize.width * 0.025, 13, screenSize.width * 0.025, 0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Column(
                    children: [
                      const Text('Ingresa tu ubicacion',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_on),
                              hintText: "Direccion",
                              border: UnderlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text('Establecimientos Cercanos',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      /*Card(
                          color: Colors.lightBlue,
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 150,
                                  width: 120,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          "assets/Images/Almacenes_exito.png")),
                                )
                              ],
                            ),
                          )),*/
                      //TODO: Extraer en una funcion de busqueda
                      ListTile(
                        leading:
                            Image.asset("assets/Images/Almacenes_exito.png"),
                        title: const Text('Exito la Rosita'),
                        subtitle: const Text('Calle 45 #17 -17'),
                        trailing: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                      ListTile(
                        leading:
                            Image.asset("assets/Images/Almacenes_exito.png"),
                        title: const Text('Exito la Rosita'),
                        subtitle: const Text('Calle 45 #17 -17'),
                        trailing: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                      ListTile(
                        leading:
                            Image.asset("assets/Images/Almacenes_exito.png"),
                        title: const Text('Exito la Rosita'),
                        subtitle: const Text('Calle 45 #17 -17'),
                        trailing: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )),
              const Text('Establecimientos Aliados',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(),
              ),
              _StoreListTile(screenSize: screenSize, store: stores),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ));
  }
}

class _StoreListTile extends StatelessWidget {
  final Size screenSize;
  final List<Store> store;

  const _StoreListTile({
    required this.screenSize,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: store.isNotEmpty ? 345 : 80,
      width: screenSize.width * 0.8,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: store.length,
              itemBuilder: (context, index) {
                return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    leading: Image.asset(store[index].poster,
                        width: 100, fit: BoxFit.cover),
                    title: Text(store[index].name),
                    subtitle: Text(store[index].caption ?? ''),
                    trailing: const Icon(Icons.arrow_circle_right_outlined));
              },
            ),
          ),
        ],
      ),
    );
  }
}
