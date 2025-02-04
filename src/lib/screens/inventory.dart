import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> inventory = [
      {"name": "Bread", "quantity": 20},
      {"name": "Croissants", "quantity": 15},
      {"name": "Muffins", "quantity": 10},
      {"name": "Cookies", "quantity": 30},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      body: ListView.builder(
        itemCount: inventory.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(inventory[index]['name']),
            subtitle: Text("Stock: ${inventory[index]['quantity']}"),
          );
        },
      ),
    );
  }
}
