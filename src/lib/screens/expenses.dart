import 'package:flutter/material.dart';
import 'package:src/widgets/drawer.dart';
import 'package:src/widgets/home_button.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final List<Map<String, dynamic>> inventoryItems = [
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

  // Function to calculate the total spent on all items
  double calculateTotalSpent() {
    double total = 0;
    for (var item in inventoryItems) {
      total += item["quantity"] * item["price"];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the absolute total
    final double totalSpent = calculateTotalSpent();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
        backgroundColor: const Color(0xFF7B421D),
      ),
      body: Container(
        color: const Color(0xFFE3CCB0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  "Inventory Expenses",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text("Item")),
                          DataColumn(label: Text("Stock")),
                          DataColumn(label: Text("Unit")),
                          DataColumn(label: Text("Price (\$)")),
                          DataColumn(label: Text("Total Price (\$)")),
                        ],
                        rows: [
                          // Rows for each inventory item
                          ...inventoryItems.map((item) {
                            final double totalPrice =
                                item["quantity"] * item["price"];
                            return DataRow(cells: [
                              DataCell(Text(item["name"])),
                              DataCell(Text("${item["quantity"]}")),
                              DataCell(Text(item["unit"])),
                              DataCell(Text("\$${item["price"].toStringAsFixed(2)}")),
                              DataCell(Text("\$${totalPrice.toStringAsFixed(2)}")),
                            ]);
                          }).toList(),
                          // Footer row for the absolute total
                          DataRow(
                            cells: [
                              const DataCell(Text("")), 
                              const DataCell(Text("")), 
                              const DataCell(Text("")), 
                              const DataCell(Text("Total Spent:")),
                              DataCell(Text(
                                "\$${totalSpent.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}