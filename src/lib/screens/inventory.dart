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
      if (inventory[index]["orderQty"] < inventory[index]["quantity"]) {
        inventory[index]["orderQty"]++;
      }
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ordered ${inventory[index]['name']} successfully!"),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      body: ListView.builder(
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
    );
  }
}
