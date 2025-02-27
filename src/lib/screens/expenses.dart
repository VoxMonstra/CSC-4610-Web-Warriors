import 'package:flutter/material.dart';
import 'package:src/widgets/drawer.dart';
import 'package:src/widgets/home_button.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
        backgroundColor: const Color(0xFF7B421D),
      ),
      body: Container(
        color: const Color(0xFFE3CCB0),
        child: const Center(
          child: Text(
            "Expenses n such.",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}