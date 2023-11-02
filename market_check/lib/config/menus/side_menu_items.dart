import 'package:flutter/material.dart';

class SideMenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const SideMenuItems(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const List<SideMenuItems> appSideMenuItems = [
  SideMenuItems(
      title: "Establecimientos",
      subtitle: "Encuentra los mejores productos.",
      link: "/stores",
      icon: Icons.store_mall_directory_outlined),
  SideMenuItems(
      title: "Ofertas",
      subtitle: "Nuestras mejores promociones",
      link: "/offers",
      icon: Icons.local_offer_outlined),
  SideMenuItems(
      title: "Productos",
      subtitle: "Mira la disponibilidad de lo que buscas",
      link: "/items",
      icon: Icons.coffee),
  SideMenuItems(
      title: "Lista de Compras",
      subtitle: "Fija presupuestos para tus compras",
      link: "/lists",
      icon: Icons.view_list_rounded),
  SideMenuItems(
      title: "Cuenta",
      subtitle: "Datos, Privacidad, Formas de pago...",
      link: "/profile",
      icon: Icons.person),
  SideMenuItems(
      title: "Historial de Compras",
      subtitle: "Consulta tu historial de compra",
      link: "/shopping-history",
      icon: Icons.shopify_outlined),
  SideMenuItems(
      title: "Configuracion",
      subtitle: "Personaliza tu experiencia",
      link: "/settings",
      icon: Icons.settings),
  SideMenuItems(
      title: "Cerrar Sesion",
      subtitle: "Salir de la App",
      link: "/",
      icon: Icons.logout_outlined),
];
