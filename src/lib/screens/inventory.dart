// To be desired: This page to simply show you all items,
// then a small icon to the right will allow you to edit, then a + icon
// allows for creation. This will be when database connection is closer
import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to the Inventory'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The view box (no real future needed besides linking of database, 
            // maybe a search feature within, and maybe moving the edit here)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewPage()),
                );
              },
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'View',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // The create box (future use is to create inventory items)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePage()),
                );
              },
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Create',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), 

            // The edit box (future use will show inventory items to edit OR
            // will be within the view page itself which is likely)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditPage()),
                );
              },
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*Below will be the general placeholders for the create, view, 
and edit functions/pages of the inventory. They are left basically empty
for now until we can link them to the databases with the SQL commands
Change the colors as you desire for our scheme*/
class ViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('This is the View Page'),
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('This is the Create Page'),
      ),
    );
  }
}

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text('This is the Edit Page'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InventoryPage(),
  ));
}