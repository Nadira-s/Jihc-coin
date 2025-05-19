import 'package:flutter/material.dart';
import 'package:jihc_coin/screens/event_register.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0057FF),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'lib/assets/events/logo3.png',
                  width: 50,
                ), // Replace with your logo
                Row(
                  children: const [
                    Icon(Icons.search, size: 28),
                    SizedBox(width: 16),
                    Stack(
                      children: [
                        Icon(Icons.notifications_none, size: 28),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: CircleAvatar(
                            radius: 6,
                            backgroundColor: Colors.red,
                            child: Text(
                              '2',
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Center(
              child: Text(
                'Events & News',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0057FF),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Upcoming Events
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Upcoming Events',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'View all',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),

            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegistrationPage(),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Image.asset(
                            'lib/assets/events/ktk.jpg',
                            width: 300,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                          const Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: Text(
                              'KTK 2025 coming!',
                              style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.black54,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegistrationPage(),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Image.asset(
                            'lib/assets/events/voice.png',
                            width: 300,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                          const Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: Text(
                              'Tomorrow we have JIHC Voice,\n+15 coins for volunteers!',
                              style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.black54,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegistrationPage(),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Image.asset(
                            'lib/assets/events/strike.JPG',
                            width: 300,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                          const Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: Text(
                              'Counter Strike starts soon!',
                              style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.black54,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // News Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'JIHC News',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'View all',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // News Card 1
            newsCard(
              image: 'lib/assets/events/cup.png',
              category: 'Sports',
              title: 'Spring Cup',
              description:
                  'Join the Spring SAMP Tournament Telegram channel and take part in exciting competitions! Guess the correct match score and stand a chance to win cool prizes!',
            ),
            const SizedBox(height: 16),

            // News Card 2
            newsCard(
              image: 'lib/assets/events/eduhack.png',
              category: 'Education',
              title: 'EDUHACK',
              description:
                  'Zhambyl Innovative Higher College (JIHC), in collaboration with Zhambyl Hub, invites all 10th–11th grade students and college students to EDUHACK 2024!',
            ),
          ],
        ),
      ),
    );
  }

  Widget newsCard({
    required String image,
    required String category,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(image, width: 100, height: 100, fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF3A0CA3),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(fontSize: 13, color: Colors.black87),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: const Color(0xFF0057FF),
      ),
      body: const Center(
        child: Text(
          'Search functionality coming soon...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
