import 'package:flutter/material.dart';
import 'package:src/widgets/drawer.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  String _saveButtonText = "Save changes";
  // This needs to be in our database, along with the ability for an admin to add, remove, and edit items
  final List<Map<String, dynamic>> inventory = [
    {
      "name": "All-purpose Flour",
      "quantity": 20,
      "unit": "kg",
      "price": 1.50,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    }, // General grains/flour
    {
      "name": "Bread Flour",
      "quantity": 20,
      "unit": "kg",
      "price": 1.70,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "Whole-Wheat Flour",
      "quantity": 20,
      "unit": "kg",
      "price": 1.80,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "Cake Flour",
      "quantity": 20,
      "unit": "kg",
      "price": 1.60,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "Rye Flour",
      "quantity": 20,
      "unit": "kg",
      "price": 2.00,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "Cornmeal",
      "quantity": 20,
      "unit": "kg",
      "price": 1.50,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "Granulated Sugar",
      "quantity": 15,
      "unit": "kg",
      "price": 3.00,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    }, // Sweeteners
    {
      "name": "Brown Sugar",
      "quantity": 20,
      "unit": "kg",
      "price": 3.20,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "Powdered Sugar",
      "quantity": 20,
      "unit": "kg",
      "price": 3.40,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "Salt",
      "quantity": 20,
      "unit": "kg",
      "price": 0.60,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    }, // Seasonings & spices
    {
      "name": "Yeast",
      "quantity": 20,
      "unit": "g",
      "price": 1.00,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    }, // Baking ingredients
    {
      "name": "Baking Powder",
      "quantity": 20,
      "unit": "g",
      "price": 0.90,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "Baking Soda",
      "quantity": 20,
      "unit": "g",
      "price": 0.80,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "Vegetable Oil",
      "quantity": 20,
      "unit": "L",
      "price": 2.50,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },

    {
      "name": "Oats",
      "quantity": 20,
      "unit": "kg",
      "price": 2.20,
      "icon": Icons.rice_bowl,
      "orderQty": 0
    }, // Grains & cereals
    {
      "name": "Honey",
      "quantity": 20,
      "unit": "L",
      "price": 5.00,
      "icon": Icons.icecream,
      "orderQty": 0
    }, // Syrups & liquid sweeteners
    {
      "name": "Maple Syrup",
      "quantity": 20,
      "unit": "L",
      "price": 6.50,
      "icon": Icons.icecream,
      "orderQty": 0
    },
    {
      "name": "Molasses",
      "quantity": 20,
      "unit": "L",
      "price": 4.80,
      "icon": Icons.icecream,
      "orderQty": 0
    },

    {
      "name": "Butter",
      "quantity": 10,
      "unit": "kg",
      "price": 4.50,
      "icon": Icons.lunch_dining,
      "orderQty": 0
    }, // Dairy & fats
    {
      "name": "Margarine",
      "quantity": 20,
      "unit": "kg",
      "price": 3.80,
      "icon": Icons.lunch_dining,
      "orderQty": 0
    },
    {
      "name": "Shortening",
      "quantity": 20,
      "unit": "kg",
      "price": 3.20,
      "icon": Icons.lunch_dining,
      "orderQty": 0
    },

    {
      "name": "Milk",
      "quantity": 30,
      "unit": "L",
      "price": 1.20,
      "icon": Icons.local_drink,
      "orderQty": 0
    }, // Dairy
    {
      "name": "Butter Milk",
      "quantity": 20,
      "unit": "L",
      "price": 1.50,
      "icon": Icons.local_drink,
      "orderQty": 0
    },
    {
      "name": "Heavy Cream",
      "quantity": 20,
      "unit": "L",
      "price": 2.80,
      "icon": Icons.local_drink,
      "orderQty": 0
    },

    {
      "name": "Eggs",
      "quantity": 20,
      "unit": "dozen",
      "price": 2.00,
      "icon": Icons.egg,
      "orderQty": 0
    }, // Eggs
    {
      "name": "Vanilla Extract",
      "quantity": 20,
      "unit": "ml",
      "price": 8.00,
      "icon": Icons.liquor,
      "orderQty": 0
    },
    {
      "name": "Cocoa Powder",
      "quantity": 20,
      "unit": "kg",
      "price": 5.50,
      "icon": Icons.cookie,
      "orderQty": 0
    },
    {
      "name": "Cinnamon",
      "quantity": 20,
      "unit": "kg",
      "price": 6.00,
      "icon": Icons.cookie,
      "orderQty": 0
    },
    {
      "name": "Chocolate Chips",
      "quantity": 20,
      "unit": "kg",
      "price": 7.50,
      "icon": Icons.cookie,
      "orderQty": 0
    },
    {
      "name": "Almonds",
      "quantity": 20,
      "unit": "kg",
      "price": 10.00,
      "icon": Icons.cookie,
      "orderQty": 0
    }, // Nuts & seeds
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

  void _saveChanges() {
    setState(() {
      for (var item in inventory) {
        if (item["orderQty"] > 0) {
          item["quantity"] += item["orderQty"];
          item["orderQty"] = 0;
        }
      }
      _saveButtonText = "Save complete!"; // Change text after saving
    });

    // Keep the button visible for 2 seconds before checking for changes again
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _saveButtonText = "Save changes";
      });
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

  void _viewItemDetails(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(inventory[index]["name"]),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Stock: ${inventory[index]["quantity"]}"),
              Text("Unit: ${inventory[index]["unit"] ?? 'N/A'}"),
              Text(
                  "Price per unit: \$${inventory[index]["price"]?.toStringAsFixed(2) ?? 'N/A'}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close details dialog
                _editItem(index); // Open edit dialog
              },
              child: const Text("Edit"),
            ),
          ],
        );
      },
    );
  }

  bool _hasChanges() {
    return inventory.any((item) => item["orderQty"] > 0);
  }

  void _showAddItemDialog() {
    String name = '';
    int quantity = 1;
    String unit = '';
    double price = 0.0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add new item"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Item name"),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Quantity"),
                keyboardType: TextInputType.number,
                onChanged: (value) => quantity = int.tryParse(value) ?? 1,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Unit (metric)"),
                onChanged: (value) => unit = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Unit price"),
                keyboardType: TextInputType.number,
                onChanged: (value) => price = double.tryParse(value) ?? 0.0,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (name.isNotEmpty && unit.isNotEmpty) {
                  setState(() {
                    inventory.add({
                      "name": name,
                      "quantity": quantity,
                      "unit": unit,
                      "price": price,
                      "icon": Icons
                          .local_grocery_store, // Default broad category icon
                      "orderQty": 0,
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _editItem(int index) {
    TextEditingController quantityController =
        TextEditingController(text: inventory[index]["quantity"].toString());
    TextEditingController unitController =
        TextEditingController(text: inventory[index]["unit"] ?? '');
    TextEditingController priceController = TextEditingController(
        text: inventory[index]["price"]?.toString() ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Item"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: "Quantity"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: unitController,
                decoration: const InputDecoration(labelText: "Unit (metric)"),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: "Price per Unit"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  inventory[index]["quantity"] =
                      int.tryParse(quantityController.text) ??
                          inventory[index]["quantity"];
                  inventory[index]["unit"] = unitController.text.isNotEmpty
                      ? unitController.text
                      : inventory[index]["unit"];
                  inventory[index]["price"] =
                      double.tryParse(priceController.text) ??
                          inventory[index]["price"];
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Title
      appBar: AppBar(
        title: const Text('Inventory'),
        actions: [
          if (_hasChanges() ||
              _saveButtonText ==
                  "Save complete!") // Keep it visible if "Save Complete"
            TextButton.icon(
              onPressed: _hasChanges() ? _saveChanges : null,
              icon: const Icon(Icons.save, color: Colors.white),
              label: Text(
                _saveButtonText,
                style: const TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),

      // Sidebar
      drawer: AppDrawer(currPage: Text("inventory")),

      // Displays all of the raw materials we currently have in stock, as well +- buttons for ordering raw materials
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: inventory.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Displays the icon of the item
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12.0), // Adds right padding
                          child: Icon(
                            inventory[index]["icon"],
                            size: 40,
                            color: Colors.brown,
                          ),
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Ensures left alignment
                            children: [
                              Align(
                                alignment:
                                    Alignment.centerLeft, // Left-aligns text
                                child: Text(
                                  inventory[index]["name"],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign
                                      .left, // Ensures text stays left-aligned
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${inventory[index]["quantity"]} ${inventory[index]["unit"] ?? ''}",
                                  style: const TextStyle(fontSize: 14),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            // minus button that decrements order quantity
                            IconButton(
                              icon: const Icon(Icons.remove,
                                  color: Color(0xFFc75c5c)),
                              onPressed: () => _decrementOrder(index),
                            ),

                            // Displays the order quantity
                            Text("${inventory[index]['orderQty']}",
                                style: const TextStyle(fontSize: 16)),

                            // plus button that increments the order quantity
                            IconButton(
                              icon: const Icon(Icons.add,
                                  color: Color(0xFF5f967c)),
                              onPressed: () => _incrementOrder(index),
                            ),
                          ],
                        ),

// View button to open details page
                        ElevatedButton(
                          onPressed: () => _viewItemDetails(index),
                          child: const Text("View"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddItemDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
