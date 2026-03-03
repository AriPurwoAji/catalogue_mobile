import 'package:flutter/material.dart';
import '../widgets/add_button_widget.dart';
import '../../domain/entities/product.dart';
import '../../../../core/routes/app_router.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  static final List<Product> _products = [
    Product(id: '1', name: 'Croisant', price: 15000),
    Product(id: '2', name: 'Muffin', price: 20000),
    Product(id: '3', name: 'Bagel', price: 5000),
    Product(id: '4', name: 'Donut', price: 10000),
    Product(id: '5', name: 'Coffee', price: 8000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Makanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, AppRouter.cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];

          return ListTile(
            title: Text(product.name),
            subtitle: Text('Rp ${product.price}'),
            trailing: AddButtonWidget(product: product),
          );
        },
      ),
    );
  }
}
