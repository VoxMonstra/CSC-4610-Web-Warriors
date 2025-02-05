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
      "price": 5.0,
    },
    {
      "name": "Eggs",
      "quantity": 30,
      "unit": "pcs",
      "price": 0.5,
    }
  ];

  // Function to show add/edit dialog
  void showItemDialog({Map<String, dynamic>? item, int? index}) {
    TextEditingController nameController =
        TextEditingController(text: item?["ingredient_name"] ?? "");
    TextEditingController quantityController =
        TextEditingController(text: item?["amount"]?.toString() ?? "");
    TextEditingController unitController =
        TextEditingController(text: item?["ingredient_measurement"] ?? "");
    TextEditingController priceController =
        TextEditingController(text: item?["unit_price"]?.toString() ?? "");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item == null ? "Add Ingredient" : "Edit Ingredient"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Ingredient')),
                TextField(
                    controller: quantityController,
                    decoration: InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number),
                TextField(
                    controller: unitController,
                    decoration: InputDecoration(labelText: 'Unit')),
                TextField(
                    controller: priceController,
                    decoration: InputDecoration(labelText: 'Price per Unit'),
                    keyboardType: TextInputType.number),
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
                    "price": double.tryParse(priceController.text) ?? 0.0,
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
    bool showColumn4 = screenWidth > 420; // Adjust threshold as needed

    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
        backgroundColor: Colors.brown,
      ),
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width, // Full screen width
          height: 56, // Approximate height of DataTable header row
          decoration: BoxDecoration(
            color: Colors.brown[400], // Extends header color
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.3), // Match DataTable shadow effect
                blurRadius: 4,
                offset: Offset(0, 2), // Shadow direction downwards
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(
                Colors.transparent), // Removes cutoff issue

            columns: [
              DataColumn(
                  label:
                      Text('Item Name', style: TextStyle(color: Colors.white))),
              DataColumn(
                  label: Text('Amount', style: TextStyle(color: Colors.white))),
              DataColumn(
                  label: Text('Unit', style: TextStyle(color: Colors.white))),
              if (showColumn4)
                DataColumn(
                    label: Text('Price/Unit',
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
                  if (showColumn4)
                    DataCell(Text("\$${item["price"]}"),
                        onTap: () => showItemDialog(item: item, index: index)),
                ],
              );
            }).toList(),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showItemDialog(),
        child: Icon(Icons.add),
        backgroundColor: Colors.brown[200],
      ),
    );
  }
}
