import 'package:flutter/material.dart';
import 'package:src/widgets/drawer.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredRecipes = [];
  final List<Map<String, dynamic>> recipes = [
    {
      "name": "muffin",
      "ingredients": ["all-purpose flour", "eggs", "milk"],
      "quantity": [20, 2, 1],
      "unit": ["kg", "dozen", "litre"],
      "price": [3.99, 2.99, 1.99],
      "icon": Icons.bakery_dining,
      "orderQty": 0
    }
  ];
  final List<Map<String, dynamic>> ingredients = [
    {
      "name": "all-purpose flour",
      "quantity": 20,
      "unit": "kg",
      "price": 1.50,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    }, // General grains/flour
    {
      "name": "bread flour",
      "quantity": 20,
      "unit": "kg",
      "price": 1.70,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "whole-wheat flour",
      "quantity": 20,
      "unit": "kg",
      "price": 1.80,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "cake flour",
      "quantity": 20,
      "unit": "kg",
      "price": 1.60,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "rye flour",
      "quantity": 20,
      "unit": "kg",
      "price": 2.00,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "cornmeal",
      "quantity": 20,
      "unit": "kg",
      "price": 1.50,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "granulated sugar",
      "quantity": 15,
      "unit": "kg",
      "price": 3.00,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    }, // Sweeteners
    {
      "name": "brown sugar",
      "quantity": 20,
      "unit": "kg",
      "price": 3.20,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "powdered sugar",
      "quantity": 20,
      "unit": "kg",
      "price": 3.40,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "salt",
      "quantity": 20,
      "unit": "kg",
      "price": 0.60,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    }, // Seasonings & spices
    {
      "name": "yeast",
      "quantity": 20,
      "unit": "g",
      "price": 1.00,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    }, // Baking ingredients
    {
      "name": "baking powder",
      "quantity": 20,
      "unit": "g",
      "price": 0.90,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "baking soda",
      "quantity": 20,
      "unit": "g",
      "price": 0.80,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },
    {
      "name": "vegetable oil",
      "quantity": 20,
      "unit": "L",
      "price": 2.50,
      "icon": Icons.bakery_dining,
      "orderQty": 0
    },

    {
      "name": "oats",
      "quantity": 20,
      "unit": "kg",
      "price": 2.20,
      "icon": Icons.rice_bowl,
      "orderQty": 0
    }, // Grains & cereals
    {
      "name": "honey",
      "quantity": 20,
      "unit": "L",
      "price": 5.00,
      "icon": Icons.icecream,
      "orderQty": 0
    }, // Syrups & liquid sweeteners
    {
      "name": "maple syrup",
      "quantity": 20,
      "unit": "L",
      "price": 6.50,
      "icon": Icons.icecream,
      "orderQty": 0
    },
    {
      "name": "molasses",
      "quantity": 20,
      "unit": "L",
      "price": 4.80,
      "icon": Icons.icecream,
      "orderQty": 0
    },

    {
      "name": "butter",
      "quantity": 10,
      "unit": "kg",
      "price": 4.50,
      "icon": Icons.lunch_dining,
      "orderQty": 0
    }, // Dairy & fats
    {
      "name": "margarine",
      "quantity": 20,
      "unit": "kg",
      "price": 3.80,
      "icon": Icons.lunch_dining,
      "orderQty": 0
    },
    {
      "name": "shortening",
      "quantity": 20,
      "unit": "kg",
      "price": 3.20,
      "icon": Icons.lunch_dining,
      "orderQty": 0
    },

    {
      "name": "milk",
      "quantity": 30,
      "unit": "L",
      "price": 1.20,
      "icon": Icons.local_drink,
      "orderQty": 0
    }, // Dairy
    {
      "name": "butter milk",
      "quantity": 20,
      "unit": "L",
      "price": 1.50,
      "icon": Icons.local_drink,
      "orderQty": 0
    },
    {
      "name": "heavy cream",
      "quantity": 20,
      "unit": "L",
      "price": 2.80,
      "icon": Icons.local_drink,
      "orderQty": 0
    },

    {
      "name": "eggs",
      "quantity": 20,
      "unit": "dozen",
      "price": 2.00,
      "icon": Icons.egg,
      "orderQty": 0
    }, // Eggs
    {
      "name": "vanilla extract",
      "quantity": 20,
      "unit": "ml",
      "price": 8.00,
      "icon": Icons.liquor,
      "orderQty": 0
    },
    {
      "name": "cocoa powder",
      "quantity": 20,
      "unit": "kg",
      "price": 5.50,
      "icon": Icons.cookie,
      "orderQty": 0
    },
    {
      "name": "cinnamon",
      "quantity": 20,
      "unit": "kg",
      "price": 6.00,
      "icon": Icons.cookie,
      "orderQty": 0
    },
    {
      "name": "chocolate chips",
      "quantity": 20,
      "unit": "kg",
      "price": 7.50,
      "icon": Icons.cookie,
      "orderQty": 0
    },
    {
      "name": "almonds",
      "quantity": 20,
      "unit": "kg",
      "price": 10.00,
      "icon": Icons.cookie,
      "orderQty": 0
    }, // Nuts & seeds
  ];

  List<String> ingredientNames = [];

  @override
  void initState() {
    super.initState();
    filteredRecipes =
        List.from(recipes); // Ensure full list is displayed at startup
    for (var item in ingredients) {
      ingredientNames.add(item["name"]);
    }
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
              const Text("Ingredients:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8), // Add spacing

              // Generate a bullet list of ingredients
              for (int i = 0; i < recipes[index]["quantity"].length; i++)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("• "), // Bullet point
                    Expanded(
                      child: Text(
                        '${recipes[index]["quantity"][i]} ${recipes[index]["unit"][i]} ${recipes[index]["ingredients"][i]}',
                      ),
                    ),
                  ],
                ),
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

  // void _showAddItemDialog() {
  //   String name = '';
  //   int quantity = 1;
  //   String unit = '';
  //   double price = 0.0;

  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text("Add new item"),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextField(
  //               decoration: const InputDecoration(labelText: "Item name"),
  //               onChanged: (value) => name = value,
  //             ),
  //             TextField(
  //               decoration: const InputDecoration(labelText: "Quantity"),
  //               keyboardType: TextInputType.number,
  //               onChanged: (value) => quantity = int.tryParse(value) ?? 1,
  //             ),
  //             TextField(
  //               decoration: const InputDecoration(labelText: "Unit (metric)"),
  //               onChanged: (value) => unit = value,
  //             ),
  //             TextField(
  //               decoration: const InputDecoration(labelText: "Unit price"),
  //               keyboardType: TextInputType.number,
  //               onChanged: (value) => price = double.tryParse(value) ?? 0.0,
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: const Text("Cancel"),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               if (name.isNotEmpty && unit.isNotEmpty) {
  //                 setState(() {
  //                   recipes.add({
  //                     "name": name,
  //                     "quantity": quantity,
  //                     "unit": unit,
  //                     "price": price,
  //                     "icon": Icons
  //                         .local_grocery_store, // Default broad category icon
  //                     "orderQty": 0,
  //                   });
  //                 });
  //                 Navigator.pop(context);
  //               }
  //             },
  //             child: const Text("Add"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void _editItem(int index) {
// Find the actual index in the main recipes list
    int recipesIndex = recipes
        .indexWhere((item) => item["name"] == filteredRecipes[index]["name"]);

    if (recipesIndex == -1) return; // Ensure item exists in main inventory

    String? selectedIngredient = ingredientNames.first;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Item"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10), // Add spacing
              for (int i = 0; i < recipes[index]["ingredients"].length; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: recipes[index]["ingredients"]
                          [i], // Bind the selected ingredient
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedIngredient =
                              newValue; // Update selected ingredient
                        });
                      },
                      items: ingredientNames
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value), // Display ingredient names
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                        width:
                            10), // Add spacing between DropdownButton and quantity input
                    // Quantity input field (using TextField for simplicity)
                    SizedBox(
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (String newValue) {
                          setState(() {
                            // Update the quantity here (e.g., store it in a map or list)
                            recipes[index]["ingredientsQuantity"][i] =
                                int.tryParse(newValue) ?? 0;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Qty',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
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
        ],
      ),

      // Sidebar
      drawer: AppDrawer(currPage: Text("recipes")),

      backgroundColor: Color(0xFFE3CCB0), // Light brown background

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
                  color: Color(0xFFF5E6D3),
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
                                  "${filteredRecipes[index]["ingredients"].join(', ')}",
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFE3CCB0),
                            foregroundColor: Colors.black,
                          ),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _showAddItemDialog(),
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
