import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import 'package:provider/provider.dart';

class BakeryItem {
  final String name;
  final double price;

  BakeryItem({required this.name, required this.price});
}

// Class for managing the shopping cart's data and notifying the UI when changes occur
class CartProvider with ChangeNotifier {
  // ensures the list cannot be modified outside of the class
  final List<BakeryItem> _cart = [];

  // Provides read-only access to the _cart list.
  List<BakeryItem> get cart => _cart;

  // uses .fold() to add all of the individual prices together to get a total price
  double get totalPrice => _cart.fold(0, (sum, item) => sum + item.price);

  // adds item to the cart
  void addItem(BakeryItem item) {
    _cart.add(item);
    notifyListeners();
  }

  // removes item from the cart
  void removeItem(BakeryItem item) {
    _cart.remove(item);
    notifyListeners();
  }

  // empties _cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}

class BakeryShop extends StatelessWidget {
  // This needs to be in the database, along with the ability for an admin to add, remove, or edit items
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
      // Sidebar
      drawer: AppDrawer(currPage: Text("menu")),

      // Title
      appBar: AppBar(
          title: Text('Bakery Shop'),
          backgroundColor: Color(0xFF7B421D),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            // Shopping cart button in the top right of the menu screen that goes to the cart screen when clicked.
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              ),
            )
          ]),

      backgroundColor: Color(0xFFE3CCB0), // Light brown background

      // Lists all of the consumer products with button to add item to cart when pushed
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2 / 3,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            color: Color(0xFFF5E6D3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/${item.name}.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name),
                      Text('\$${item.price.toStringAsFixed(2)}'),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            final cart = context.read<CartProvider>();
                            cart.addItem(item);
                            ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content:
                                    Text('Added ' + item.name + ' to cart'),
                                    duration: Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
      // Title
      appBar: AppBar(
        title: Text('Your Cart'),
        backgroundColor: Color(0xFF7B421D),
      ),
      backgroundColor: Color(0xFFE3CCB0), // Light brown background

      // Displays everything that has been added to the cart, or "Your cart is empty" if the cart is empty
      body: cart.cart.isEmpty //boolean condition

          // If .isEmpty returns true
          ? Center(child: Text('Your cart is empty'))

          // If .isEmpty returns false
          : Column(
              children: [
                Expanded(
                  // displays each item in the shopping cart
                  child: ListView.builder(
                    itemCount: cart.cart.length,
                    itemBuilder: (context, index) {
                      final item = cart.cart[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('\$${item.price.toStringAsFixed(2)}'),

                        // Button for removing an item from the cart
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () => cart.removeItem(item),
                        ),
                      );
                    },
                  ),
                ),

                // Bottom section to include total price of all cart items and checkout button
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      // Displays the total cost of everything in the cart
                      Text('Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),

                      // Button to "Checkout" all of the items in the cart
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
