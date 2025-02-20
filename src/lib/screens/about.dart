import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/widgets/home_button.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3CCB0), // Updated background color
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'About Simple Bakery',
          style: GoogleFonts.lora(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF7B421D),
      ),
      drawer: AppDrawer(currPage: Text("about")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard(
              icon: Icons.history,
              title: 'Our Story',
              content:
                  'Simple Bakery was founded on a simple idea: great bread and pastries don’t need to be complicated. We started as a home-based microbakery, '
                  'experimenting with traditional recipes and slow-fermentation techniques. Now, we serve our community with fresh and delicious baked goods every day.',
            ),
            
            _buildCard(
              icon: Icons.breakfast_dining,
              title: 'What We Offer',
              content:
                  '🥖 Sourdough & Artisan Breads – Naturally leavened and slow-fermented for deep flavors.\n'
                  '🥐 Flaky Croissants & Pastries – Buttery, golden, and freshly baked every morning.\n'
                  '🍰 Decadent Cakes & Desserts – Perfect for any occasion, made with high-quality ingredients.\n'
                  '🥧 Seasonal Pies & Tarts – Featuring fresh, in-season fruits with a flaky, buttery crust.\n'
                  '🍪 Cookies & Sweet Treats – Classic flavors and unique twists for every sweet tooth.\n'
                  '☕ Freshly Brewed Coffee & Tea – The perfect pairing for our baked goods.',
            ),

            _buildCard(
              icon: Icons.star,
              title: 'Why Choose Us?',
              content:
                  '🏠 **Handcrafted with Love** – Every item is made from scratch using time-honored techniques.\n'
                  '🌱 **Locally Sourced Ingredients** – We partner with local farmers for the freshest products.\n'
                  '❌ **No Preservatives or Additives** – Just pure, wholesome ingredients that let flavors shine.\n'
                  '🍞 **Small-Batch Quality** – Each batch is baked to perfection with care and passion.',
            ),

            _buildCard(
              icon: Icons.people,
              title: 'Our Commitment',
              content:
                  'We believe in giving back! We donate surplus baked goods to local shelters, partner with small businesses, and host **baking workshops** for the community. 🤝✨',
            ),

            _buildCard(
              icon: Icons.location_on,
              title: 'Visit Us!',
              content:
                  '⏰ **Hours:** Open Tuesday – Sunday, 7 AM – 3 PM 🕖\n'
                  '📍 **Location:** [Insert address here] 📌\n'
                  '📞 **Contact:** [Insert phone/email here] 📧\n\n'
                  'Come visit **Simple Bakery** and taste the difference of handcrafted, small-batch baking!',
            ),

            SizedBox(height: 16),

            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  'Visit Us Today!',
                  style: GoogleFonts.lora(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Footer
            Center(
              child: Text(
                'Follow us on social media!',
                style: GoogleFonts.lora(fontSize: 16, color: Colors.brown),
              ),
            ),
            SizedBox(height: 8),

            // Social Media Icons non working
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.facebook, color: Colors.brown, size: 30),
                SizedBox(width: 16),
                Icon(Icons.add_ic_call, color: Colors.brown, size: 30),
                SizedBox(width: 16),
                Icon(Icons.email, color: Colors.brown, size: 30),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: HomeButton(),
    );
  }

  Widget _buildCard({required IconData icon, required String title, required String content}) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Color(0xFFF5E6D3), // Light background for contrast
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.brown),
                SizedBox(width: 8),
                Text(
                  title,
                  style: GoogleFonts.lora(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: GoogleFonts.lora(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
