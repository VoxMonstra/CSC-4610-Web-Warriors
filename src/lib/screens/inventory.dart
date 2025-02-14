import 'package:flutter/material.dart';
import 'package:src/widgets/drawer.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  String _saveButtonText = "Save changes";
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();
  String currInventory = "ingredients";
  List<Map<String, dynamic>> inventory = [];
  List<Map<String, dynamic>> filteredInventory = [];
  // This needs to be in our database, along with the ability for an admin to add, remove, and edit items
  final List<Map<String, dynamic>> ingredients = [
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

  List<Map<String, dynamic>> products = [
    {
      "name": "Baguette",
      "quantity": 10,
      "unit": "pcs",
      "price": 2.50,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "Croissant",
      "quantity": 8,
      "unit": "pcs",
      "price": 3.00,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
  ];

  List<Map<String, dynamic>> damages = [
    {
      "name": "Croissant",
      "quantity": 8,
      "unit": "pcs",
      "price": 3.00,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    }
  ];

  @override
  void initState() {
    super.initState();
    inventory =
        List.from(ingredients); // Ensure full list is displayed at startup
    filteredInventory =
        List.from(inventory); // Ensure full list is displayed at startup
  }

  void _switchInventory(String newInventory) {
    setState(() {
      currInventory = newInventory; // Update the current inventory name
      if (currInventory == "ingredients") {
        inventory = List.from(ingredients);
      }
      if (currInventory == "products") {
        inventory = List.from(products);
      }
      if (currInventory == "damages") {
        inventory = List.from(damages);
      } else {
        inventory = List.from(ingredients); // Default to Ingredients
      }
      filteredInventory = List.from(inventory); // Sync filtered list
    });
    _filterInventory(_searchController.text);
  }

  void _filterInventory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredInventory = List.from(inventory);
      } else {
        filteredInventory = inventory
            .where((item) =>
                item["name"].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

// + button functionality
  void _incrementOrder(int index) {
    setState(() {
      // Find the item in the original inventory list
      int inventoryIndex = inventory.indexWhere(
          (item) => item["name"] == filteredInventory[index]["name"]);
      if (inventoryIndex == -1) return; // Ensure item exists

      // Increment orderQty in the main inventory list
      inventory[inventoryIndex]["orderQty"]++;

      // Also update filteredInventory to reflect changes immediately
      filteredInventory[index]["orderQty"] =
          inventory[inventoryIndex]["orderQty"];

      // Refresh UI
      _filterInventory(_searchController.text);
    });
  }

// - button functionality
  void _decrementOrder(int index) {
    setState(() {
      // if (inventory[index]["orderQty"] > 0) {
      if (inventory[index]["quantity"] + inventory[index]["orderQty"] > 0) {
        // Find the item in the original inventory list
        int inventoryIndex = inventory.indexWhere(
            (item) => item["name"] == filteredInventory[index]["name"]);
        if (inventoryIndex == -1) return; // Ensure item exists

        // Decrement orderQty in the main inventory list (prevent negative values)
        // if (inventory[inventoryIndex]["orderQty"] > 0) {
        inventory[inventoryIndex]["orderQty"]--;
        // }

        // Also update filteredInventory to reflect changes immediately
        filteredInventory[index]["orderQty"] =
            inventory[inventoryIndex]["orderQty"];

        // Refresh UI
        _filterInventory(_searchController.text);
      }
    });
  }

  void _saveChanges() {
    setState(() {
      for (var item in inventory) {
        if (item["quantity"] + item["orderQty"] >= 0) {
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

  void _viewItemDetails(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(filteredInventory[index]["name"]),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Stock: ${filteredInventory[index]["quantity"]}"),
              Text("Unit: ${filteredInventory[index]["unit"] ?? 'N/A'}"),
              Text(
                  "Price per unit: \$${filteredInventory[index]["price"]?.toStringAsFixed(2) ?? 'N/A'}"),
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
    return inventory.any((item) =>
        item["quantity"] + item["orderQty"] >= 0 && item["orderQty"] != 0);
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
                    _filterInventory(_searchController.text);
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
// Find the actual index in the main inventory list
    int inventoryIndex = inventory
        .indexWhere((item) => item["name"] == filteredInventory[index]["name"]);

    if (inventoryIndex == -1) return; // Ensure item exists in main inventory

    TextEditingController quantityController = TextEditingController(
        text: inventory[inventoryIndex]["quantity"].toString());
    TextEditingController unitController =
        TextEditingController(text: inventory[inventoryIndex]["unit"] ?? '');
    TextEditingController priceController = TextEditingController(
        text: inventory[inventoryIndex]["price"]?.toString() ?? '');

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
                  // Update the actual item in inventory
                  inventory[inventoryIndex]["quantity"] =
                      int.tryParse(quantityController.text) ??
                          inventory[inventoryIndex]["quantity"];
                  inventory[inventoryIndex]["unit"] =
                      unitController.text.isNotEmpty
                          ? unitController.text
                          : inventory[inventoryIndex]["unit"];
                  inventory[inventoryIndex]["price"] =
                      double.tryParse(priceController.text) ??
                          inventory[inventoryIndex]["price"];

                  // Re-filter the inventory so the updated item appears correctly
                  _filterInventory(_searchController.text);
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
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Search Inventory...",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white60),
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                onChanged: _filterInventory,
              )
            : const Text('Inventory'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  _filterInventory("");
                }
              });
            },
          ),
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
          // Toggle Button Row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => _switchInventory("ingredients"),
                  child: Text(
                    "Ingredients",
                    style: TextStyle(
                      fontWeight: currInventory == "ingredients"
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: currInventory == "ingredients"
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ),
                const Text(" | "), // Divider between buttons
                TextButton(
                  onPressed: () => _switchInventory("products"),
                  child: Text(
                    "Products",
                    style: TextStyle(
                      fontWeight: currInventory == "products"
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: currInventory == "products"
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ),
                const Text(" | "), // Divider between buttons
                TextButton(
                  onPressed: () => _switchInventory("damages"),
                  child: Text(
                    "Damages",
                    style: TextStyle(
                      fontWeight: currInventory == "damages"
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: currInventory == "damages"
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredInventory.length,
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
                            filteredInventory[index]["icon"],
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
                                  filteredInventory[index]["name"],
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
                                  "${filteredInventory[index]["quantity"]} ${filteredInventory[index]["unit"] ?? ''}",
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
                            if (currInventory == "products" ||
                                currInventory == "damages") ...[
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
