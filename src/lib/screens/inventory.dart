import 'package:flutter/material.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final List<Map<String, dynamic>> inventory = [
    {"name": "Bread", "quantity": 20, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Croissants", "quantity": 15, "icon": Icons.bakery_dining, "orderQty": 0},
    {"name": "Muffins", "quantity": 10, "icon": Icons.cake, "orderQty": 0},
    {"name": "Cookies", "quantity": 30, "icon": Icons.cookie, "orderQty": 0},
  ];

  void _incrementOrder(int index) {
    setState(() {
        inventory[index]["orderQty"]++;
    });
  }

  void _decrementOrder(int index) {
    setState(() {
      if (inventory[index]["orderQty"] > 0) {
        inventory[index]["orderQty"]--;
      }
    });
  }

  void _placeOrder(int index) {
    if (inventory[index]["orderQty"] > 0) {
      setState(() {
        inventory[index]["quantity"] += inventory[index]["orderQty"];
        inventory[index]["orderQty"] = 0; // Reset order quantity after ordering
      });
    }
  }

  void _orderAll() {
    bool hasOrders = inventory.any((item) => item["orderQty"] > 0);
    
    if (!hasOrders) return; // Prevents unnecessary updates

    setState(() {
      for (var item in inventory) {
        if (item["orderQty"] > 0) {
          item["quantity"] -= item["orderQty"];
          item["orderQty"] = 0;
        }
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("All selected items have been ordered successfully!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  bool _hasSelectedOrders() {
    return inventory.any((item) => item["orderQty"] > 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
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
