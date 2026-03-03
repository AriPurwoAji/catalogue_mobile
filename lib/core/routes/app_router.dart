import 'package:flutter/material.dart';
import '../../features/cart/presentation/pages/catalogue_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';

class AppRouter {
  static const String catalog = '/';
  static const String cart = '/cart';

  static Map<String, WidgetBuilder> get routes => {
    catalog: (context) => const CatalogPage(),
    cart: (context) => const CartPage(),
  };
}
