import 'package:flutter/material.dart';
import 'package:jihc_coin/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        backgroundColor: const Color(0xFF0057FF),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF0057FF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Profile',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                const SizedBox(height: 16),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'lib/assets/home/user1.png',
                  ), // <- Change image path
                ),
                const SizedBox(height: 12),
                Text(
                  "${user?.name ?? 'No Name'}",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "${user?.group ?? 'Unknown'} Student",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          buildMenuItem(Icons.person, 'Edit Profile'),
          buildMenuItem(Icons.payment, 'Payment Method'),
          buildMenuItem(Icons.language, 'Language'),
          buildMenuItem(Icons.history, 'Order History'),
          buildMenuItem(Icons.person_add, 'Invite Friends'),
          buildMenuItem(Icons.help_outline, 'Help Center'),
        ],
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(icon, size: 28),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {}, // Add navigation
        ),
      ),
    );
  }
}
