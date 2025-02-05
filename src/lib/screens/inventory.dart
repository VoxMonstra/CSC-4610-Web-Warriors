import 'package:flutter/material.dart';
import 'package:src/widgets/drawer.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> { // This needs to be in our database
  final List<Map<String, dynamic>> inventory = [  //{"name": "", "quantity": 20, "icon": Icons.abc, "orderQty": 0},
    {"name": "All-purpose Flour", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Bread Flour", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Whole-Wheat Flour", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Cake Flour", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Rye Flour", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Cornmeal", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Oats", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Granulated Sugar", "quantity": 15, "icon": Icons.icecream, "orderQty": 0},
    {"name": "Brown Sugar", "quantity": 20, "icon": Icons.icecream, "orderQty": 0},
    {"name": "Powdered Sugar", "quantity": 20, "icon": Icons.icecream, "orderQty": 0},
    {"name": "Honey", "quantity": 20, "icon": Icons.hive, "orderQty": 0},
    {"name": "Maple Syrup", "quantity": 20, "icon": Icons.breakfast_dining, "orderQty": 0},
    {"name": "Molasses", "quantity": 20, "icon": Icons.breakfast_dining_outlined, "orderQty": 0},
    {"name": "Yeast", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Baking Powder", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Baking Soda", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Butter", "quantity": 10, "icon": Icons.breakfast_dining, "orderQty": 0},
    {"name": "Margarine", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Vegietable Oil", "quantity": 20, "icon": Icons.oil_barrel, "orderQty": 0},
    {"name": "Shortening", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Milk", "quantity": 30, "icon": Icons.coffee, "orderQty": 0},
    {"name": "Butter Milk", "quantity": 20, "icon": Icons.coffee, "orderQty": 0},
    {"name": "Heavy Cream", "quantity": 20, "icon": Icons.coffee, "orderQty": 0},
    {"name": "Eggs", "quantity": 20, "icon": Icons.egg, "orderQty": 0},
    {"name": "Salt", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Vanilla Extract", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Cocoa Powder", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Cinnamon", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Chocolate Chips", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Almonds", "quantity": 20, "icon": Icons.food_bank, "orderQty": 0},
  ];

// + button functionality
  void _incrementOrder(int index) { 
    setState(() {
        inventory[index]["orderQty"]++;
    });
  }

// - button functionality
  void _decrementOrder(int index) { 
    setState(() {
      if (inventory[index]["orderQty"] > 0) {
        inventory[index]["orderQty"]--;
      }
    });
  }

// "Order" button functionality
  void _placeOrder(int index) {
    if (inventory[index]["orderQty"] > 0) {
      setState(() {
        inventory[index]["quantity"] += inventory[index]["orderQty"];
        inventory[index]["orderQty"] = 0; // Reset order quantity after ordering
      });
    }
  }

// "Order All" button functionality.
  void _orderAll() {
    bool hasOrders = inventory.any((item) => item["orderQty"] > 0);
    
    if (!hasOrders) return; // Prevents unnecessary updates

    setState(() {
      for (var item in inventory) {
        if (item["orderQty"] > 0) {
          item["quantity"] += item["orderQty"];
          item["orderQty"] = 0;
        }
      }
    });

    // Pop up message when items have been ordered
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("All selected items have been ordered successfully!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // "Do any of the items have any pending orders?"
  bool _hasSelectedOrders() {
    return inventory.any((item) => item["orderQty"] > 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      drawer: AppDrawer(currPage: Text("inventory")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: inventory.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(inventory[index]["icon"], size: 40, color: Colors.brown),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(inventory[index]["name"], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("Stock: ${inventory[index]["quantity"]}", style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: Colors.red),
                              onPressed: () => _decrementOrder(index),
                            ),
                            Text("${inventory[index]['orderQty']}", style: const TextStyle(fontSize: 16)),
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.green),
                              onPressed: () => _incrementOrder(index),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: inventory[index]["orderQty"] > 0 ? () => _placeOrder(index) : null,
                          child: const Text("Order"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton.icon(
              onPressed: _hasSelectedOrders() ? _orderAll : null,
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Order All"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
