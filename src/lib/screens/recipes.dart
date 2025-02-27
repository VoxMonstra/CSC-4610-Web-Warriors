import 'package:flutter/material.dart';
import 'package:src/widgets/drawer.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  String _saveButtonText = "Save changes";
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredRecipes = [];
  final List<Map<String, dynamic>> recipes = [
    {
      "name": "All-purpose Flour",
      "quantity": 20,
      "unit": "kg",
      "price": 1.50,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    }
  ];

  @override
  void initState() {
    super.initState();
    filteredRecipes =
        List.from(recipes); // Ensure full list is displayed at startup
  }

  void _filterRecipes(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredRecipes = List.from(recipes);
      } else {
        filteredRecipes = recipes
            .where((item) =>
                item["name"].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _saveChanges() {}

  void _viewItemDetails(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(recipes[index]["name"]),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Stock: ${recipes[index]["quantity"]}"),
              Text("Unit: ${recipes[index]["unit"] ?? 'N/A'}"),
              Text(
                  "Price per unit: \$${recipes[index]["price"]?.toStringAsFixed(2) ?? 'N/A'}"),
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
    return recipes.any((item) =>
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
                    recipes.add({
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
// Find the actual index in the main recipes list
    int recipesIndex = recipes
        .indexWhere((item) => item["name"] == filteredRecipes[index]["name"]);

    if (recipesIndex == -1) return; // Ensure item exists in main inventory

    TextEditingController quantityController = TextEditingController(
        text: recipes[recipesIndex]["quantity"].toString());
    TextEditingController unitController =
        TextEditingController(text: recipes[recipesIndex]["unit"] ?? '');
    TextEditingController priceController = TextEditingController(
        text: recipes[recipesIndex]["price"]?.toString() ?? '');

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
                  recipes[recipesIndex]["quantity"] =
                      int.tryParse(quantityController.text) ??
                          recipes[recipesIndex]["quantity"];
                  recipes[recipesIndex]["unit"] = unitController.text.isNotEmpty
                      ? unitController.text
                      : recipes[recipesIndex]["unit"];
                  recipes[recipesIndex]["price"] =
                      double.tryParse(priceController.text) ??
                          recipes[recipesIndex]["price"];
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
                  hintText: "Search Recipes...",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white60),
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                onChanged: _filterRecipes,
              )
            : const Text('Recipes'),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  _filterRecipes("");
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
      drawer: AppDrawer(currPage: Text("recipes")),

      // Displays all of the raw materials we currently have in stock, as well +- buttons for ordering raw materials
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredRecipes.length,
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
                            filteredRecipes[index]["icon"],
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
                                  filteredRecipes[index]["name"],
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
                                  "${filteredRecipes[index]["quantity"]} ${filteredRecipes[index]["unit"] ?? ''}",
                                  style: const TextStyle(fontSize: 14),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
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
