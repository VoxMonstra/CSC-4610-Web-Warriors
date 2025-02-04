import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Simple Bakery'),
        backgroundColor: Colors.brown,
      ),
      drawer: AppDrawer(currPage: Text("about")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🍞 Welcome to Simple Bakery! 🥐',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Simple Bakery is your neighborhood microbakery dedicated to crafting fresh, handcrafted baked goods with love and care. '
              'We are a small, passionate team of bakers committed to bringing you high-quality, artisanal treats made from the finest locally sourced ingredients. 🏡❤️',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              '📖 Our Story',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Simple Bakery was founded on a simple idea: great bread and pastries don’t need to be complicated. We started as a home-based microbakery, '
              'experimenting with traditional recipes and slow-fermentation techniques to create flavors that bring warmth and nostalgia. '
              'What began as small weekend batches for friends and family quickly grew into a beloved local bakery, providing fresh and delicious baked goods to our community every day. 🌾✨',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              '🥖 What We Offer',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '🥖 Sourdough & Artisan Breads – Naturally leavened and made with long fermentation for deep, complex flavors.\n'
              '🥐 Flaky Croissants & Pastries – Buttery, golden, and freshly baked every morning.\n'
              '🍰 Decadent Cakes & Desserts – Perfect for any occasion, made with high-quality ingredients.\n'
              '🥧 Seasonal Pies & Tarts – Made with fresh, in-season fruits and a flaky, buttery crust.\n'
              '🍪 Cookies & Sweet Treats – Classic flavors, unique twists, and something for every sweet tooth.\n'
              '☕ Freshly Brewed Coffee & Tea – The perfect complement to our baked goods.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              '🌟 Why Choose Simple Bakery?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '🏠 Handcrafted with Love – Every item is made from scratch using time-honored techniques.\n'
              '🌱 Locally Sourced Ingredients – We partner with local farmers and suppliers to ensure freshness.\n'
              '❌ No Preservatives or Additives – Just pure, wholesome ingredients that let the flavors shine.\n'
              '🍞 Small-Batch Quality – As a microbakery, we focus on quality over quantity, ensuring that each batch is baked to perfection.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              '❤️ Our Commitment to the Community',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'As a microbakery, we believe in giving back to the community that supports us. We regularly donate surplus baked goods to local shelters, '
              'partner with small businesses, and host **baking workshops** for those interested in learning the craft. 🤝✨',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              '📍 Visit Us!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '⏰ **Hours:** Open Tuesday – Sunday, 7 AM – 3 PM 🕖\n'
              '📍 **Location:** [Insert address here] 📌\n'
              '📞 **Contact:** [Insert phone/email here] 📧\n\n'
              'Come visit **Simple Bakery** and taste the difference of handcrafted, small-batch baking! 🍞✨',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
