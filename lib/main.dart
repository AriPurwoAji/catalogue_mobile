import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class CartModel extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' :(context) => const MyCatalog(),
        '/cart' :(context) => const MyCart(),
      },
    );
  }
}

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final products = ['Croisant', 'Muffin', 'Bagel', 'Donut', 'Coffee'];

    return Scaffold(
            appBar: AppBar(
              title: const Text("Catalogue Resto"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () => Navigator.pushNamed(context, '/cart'),
                  )
              ],
            ),
            body: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(products[index]),
                  trailing: addButton(item: products[index]),
                );
              },
            ),
          );
  }
  }
