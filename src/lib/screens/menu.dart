import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import 'package:provider/provider.dart';

class BakeryItem {
  final String name;
  final double price;

  BakeryItem({required this.name, required this.price});
}

class CartProvider with ChangeNotifier {
  final List<BakeryItem> _cart = [];

  List<BakeryItem> get cart => _cart;
  double get totalPrice => _cart.fold(0, (sum, item) => sum + item.price);

  void addItem(BakeryItem item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeItem(BakeryItem item) {
    _cart.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}

class BakeryShop extends StatelessWidget {
  final List<BakeryItem> items = [
    BakeryItem(name: 'Sourdough Bread', price: 5.0),
    BakeryItem(name: 'Baguettes', price: 3.5),
    BakeryItem(name: 'Ciabatta', price: 4.0),
    BakeryItem(name: 'Croissants', price: 2.5),
    BakeryItem(name: 'Muffins', price: 2.0),
    BakeryItem(name: 'Scones', price: 2.5),
    BakeryItem(name: 'Cookies', price: 1.5),
    BakeryItem(name: 'Brownies & Blondies', price: 3.0),
    BakeryItem(name: 'Cinnamon Rolls', price: 4.0),
    BakeryItem(name: 'Specialty Cakes', price: 6.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(currPage: Text("menu")),
      appBar: AppBar(title: Text('Bakery Shop'), actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          ),
        )
      ]),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                final cart = context.read<CartProvider>();
                cart.addItem(item);
              },
            ),
          );
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: cart.cart.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.cart.length,
                    itemBuilder: (context, index) {
                      final item = cart.cart[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () => cart.removeItem(item),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          cart.clearCart();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Checkout successful!')));
                        },
                        child: Text('Checkout'),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
