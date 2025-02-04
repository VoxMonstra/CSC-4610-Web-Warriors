// To be desired: This page to simply show you all items,
// then a small icon to the right will allow you to edit, then a + icon
// allows for creation. This will be when database connection is closer
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: InventoryPage(),
  ));
}

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  // Sample inventory data
  List<Map<String, dynamic>> inventory = [
    {
      "name": "Flour",
      "quantity": 10,
      "unit": "kg",
      "category": "Ingredient",
      "price": 5.0,
      "supplier": "Bakery Wholesale",
      "expiry": "2025-06-30",
    },
    {
      "name": "Eggs",
      "quantity": 30,
      "unit": "pcs",
      "category": "Dairy",
      "price": 0.5,
      "supplier": "Local Farm",
      "expiry": "2025-02-20",
    }
  ];

  // Function to show add/edit dialog
  void showItemDialog({Map<String, dynamic>? item, int? index}) {
    TextEditingController nameController =
        TextEditingController(text: item?["name"] ?? "");
    TextEditingController quantityController =
        TextEditingController(text: item?["quantity"]?.toString() ?? "");
    TextEditingController unitController =
        TextEditingController(text: item?["unit"] ?? "");
    TextEditingController categoryController =
        TextEditingController(text: item?["category"] ?? "");
    TextEditingController priceController =
        TextEditingController(text: item?["price"]?.toString() ?? "");
    TextEditingController supplierController =
        TextEditingController(text: item?["supplier"] ?? "");
    TextEditingController expiryController =
        TextEditingController(text: item?["expiry"] ?? "");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item == null ? "Add Item" : "Edit Item"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Item Name')),
                TextField(
                    controller: quantityController,
                    decoration: InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number),
                TextField(
                    controller: unitController,
                    decoration: InputDecoration(labelText: 'Unit')),
                TextField(
                    controller: categoryController,
                    decoration: InputDecoration(labelText: 'Category')),
                TextField(
                    controller: priceController,
                    decoration: InputDecoration(labelText: 'Price per Unit'),
                    keyboardType: TextInputType.number),
                TextField(
                    controller: supplierController,
                    decoration: InputDecoration(labelText: 'Supplier')),
                TextField(
                    controller: expiryController,
                    decoration: InputDecoration(labelText: 'Expiration Date')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  Map<String, dynamic> newItem = {
                    "name": nameController.text,
                    "quantity": int.tryParse(quantityController.text) ?? 0,
                    "unit": unitController.text,
                    "category": categoryController.text,
                    "price": double.tryParse(priceController.text) ?? 0.0,
                    "supplier": supplierController.text,
                    "expiry": expiryController.text,
                  };

                  if (item == null) {
                    // Add new item
                    inventory.add(newItem);
                  } else {
                    // Edit existing item
                    inventory[index!] = newItem;
                  }
                });

                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool showColumn5 = screenWidth > 510; // Adjust threshold as needed
    bool showColumn6 = screenWidth > 675;
    bool showColumn7 = screenWidth > 825;

    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(
              Colors.brown[400]), // Lighter brown header
          columns: [
            DataColumn(
                label:
                    Text('Item Name', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Qty', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Unit', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Category', style: TextStyle(color: Colors.white))),
            if (showColumn5)
              DataColumn(
                  label: Text('Price/Unit',
                      style: TextStyle(color: Colors.white))),
            if (showColumn6)
              DataColumn(
                  label:
                      Text('Supplier', style: TextStyle(color: Colors.white))),
            if (showColumn7)
              DataColumn(
                  label: Text('Expiry Date',
                      style: TextStyle(color: Colors.white))),
          ],
          rows: inventory.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> item = entry.value;

            return DataRow(
              cells: [
                DataCell(
                  Container(
                    child: Text(item["name"]),
                  ),
                  onTap: () => showItemDialog(item: item, index: index),
                ),
                DataCell(
                  Container(
                    child: Text(item["quantity"].toString()),
                  ),
                  onTap: () => showItemDialog(item: item, index: index),
                ),
                DataCell(Text(item["unit"]),
                    onTap: () => showItemDialog(item: item, index: index)),
                DataCell(Text(item["category"]),
                    onTap: () => showItemDialog(item: item, index: index)),
                if (showColumn5)
                  DataCell(Text("\$${item["price"]}"),
                      onTap: () => showItemDialog(item: item, index: index)),
                if (showColumn6)
                  DataCell(Text(item["supplier"]),
                      onTap: () => showItemDialog(item: item, index: index)),
                if (showColumn7)
                  DataCell(Text(item["expiry"]),
                      onTap: () => showItemDialog(item: item, index: index)),
              ],
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showItemDialog(),
        child: Icon(Icons.add),
        backgroundColor: Colors.brown[200],
      ),
    );
  }
}
