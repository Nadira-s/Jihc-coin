import 'package:flutter/material.dart';
import 'package:jihc_coin/providers/user_provider.dart';
import 'package:jihc_coin/screens/addcoin.dart';
import 'package:jihc_coin/screens/event_page.dart';
import 'package:jihc_coin/screens/info.dart';
import 'package:jihc_coin/screens/profile.dart';
import 'package:jihc_coin/screens/store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String? fullname;
  HomePage({super.key, this.fullname});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. Add a selected index variable
  int _selectedIndex = 0;

  // 2. Create a list of pages/screens to switch between
  // Replace these placeholders with your actual page widgets

  final List<Widget> _pages = [
    // This should be your original homepage content
    HomeContent(),
    StorePage(),
    EventPage(),
    ProfilePage(fullName: ''),

    // Add more pages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 3. Use _selectedIndex to show the selected page
      body: _pages[_selectedIndex],

      // 4. Add the bottom navigation bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Colors.grey.shade300),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Events',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            // Add more items corresponding to your pages
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/first_page/noisy-gradients.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(),

            // Верхняя часть с профилем и балансом
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Профиль
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'lib/assets/home/user1.png',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user?.group ?? 'Unknown'} Student",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "${user?.name ?? 'No Name'}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Image.asset(
                          'lib/assets/home/logo2.png',
                          height: 40,
                        ), // логотип колледжа
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Баланс
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Available', style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              '1 579,89',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Coins'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddFormPage(),
                              ),
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2A2FAA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: const Text(
                              'Top up balance',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Сообщения
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.mail_outline, size: 28),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Message',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '14.May  Congratulations! You\'ve earned +10 coins for participating in the hackathon',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          '14.May  Congratulations! You\'ve earned +10 coins for participating in a quiz',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width:
                            MediaQuery.of(context).size.width *
                            0.5, // Full screen width

                        child: OutlinedButton(
                          onPressed: () {
                            // Add navigation logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InfoScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: BorderSide(width: 1, color: Colors.white),
                            foregroundColor: Colors.black,
                            minimumSize: const Size(
                              double.infinity,
                              90,
                            ), // Height set to 70
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ), // Internal padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(23),
                                bottomLeft: Radius.circular(23),
                              ),
                            ),
                            elevation: 3,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Image.asset('lib/assets/home/grades.png'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Grades',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width:
                            MediaQuery.of(context).size.width *
                            0.5, // Full screen width

                        child: OutlinedButton(
                          onPressed: () {
                            // Add navigation logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InfoScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,

                            side: BorderSide(width: 1, color: Colors.white),

                            minimumSize: const Size(
                              double.infinity,
                              90,
                            ), // Height set to 70
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ), // Internal padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(23),
                                bottomRight: Radius.circular(23),
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset('lib/assets/home/unity.png'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Unity',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width:
                            MediaQuery.of(context).size.width *
                            0.5, // Full screen width

                        child: OutlinedButton(
                          onPressed: () {
                            // Add navigation logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InfoScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: BorderSide(width: 1, color: Colors.white),
                            foregroundColor: Colors.black,
                            minimumSize: const Size(
                              double.infinity,
                              90,
                            ), // Height set to 70
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ), // Internal padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(23),
                                bottomLeft: Radius.circular(23),
                              ),
                            ),
                            elevation: 3,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Image.asset('lib/assets/home/events.png'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Competition',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width:
                            MediaQuery.of(context).size.width *
                            0.5, // Full screen width

                        child: OutlinedButton(
                          onPressed: () {
                            // Add navigation logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InfoScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,

                            side: BorderSide(width: 1, color: Colors.white),

                            minimumSize: const Size(
                              double.infinity,
                              90,
                            ), // Height set to 70
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ), // Internal padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(23),
                                bottomRight: Radius.circular(23),
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset('lib/assets/home/society.png'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Society',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width:
                            MediaQuery.of(context).size.width *
                            0.5, // Full screen width

                        child: OutlinedButton(
                          onPressed: () {
                            // Add navigation logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InfoScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: BorderSide(width: 1, color: Colors.white),
                            foregroundColor: Colors.black,
                            minimumSize: const Size(
                              double.infinity,
                              90,
                            ), // Height set to 70
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ), // Internal padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(23),
                                bottomLeft: Radius.circular(23),
                              ),
                            ),
                            elevation: 3,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'lib/assets/home/organization.png',
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Organization',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width:
                            MediaQuery.of(context).size.width *
                            0.5, // Full screen width

                        child: OutlinedButton(
                          onPressed: () {
                            // Add navigation logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InfoScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,

                            side: BorderSide(width: 1, color: Colors.white),

                            minimumSize: const Size(
                              double.infinity,
                              90,
                            ), // Height set to 70
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ), // Internal padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(23),
                                bottomRight: Radius.circular(23),
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'lib/assets/home/cleanliness.png',
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Cleanliness',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width:
                            MediaQuery.of(context).size.width *
                            0.5, // Full screen width

                        child: OutlinedButton(
                          onPressed: () {
                            // Add navigation logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InfoScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: BorderSide(width: 1, color: Colors.white),
                            foregroundColor: Colors.black,
                            minimumSize: const Size(
                              double.infinity,
                              90,
                            ), // Height set to 70
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ), // Internal padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(23),
                                bottomLeft: Radius.circular(23),
                              ),
                            ),
                            elevation: 3,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Image.asset('lib/assets/home/volunteer.png'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Volunteering',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width:
                            MediaQuery.of(context).size.width *
                            0.5, // Full screen width

                        child: OutlinedButton(
                          onPressed: () {
                            // Add navigation logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InfoScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,

                            side: BorderSide(width: 1, color: Colors.white),

                            minimumSize: const Size(
                              double.infinity,
                              90,
                            ), // Height set to 70
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ), // Internal padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(23),
                                bottomRight: Radius.circular(23),
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset('lib/assets/home/projects.png'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Projects',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Навигация
    );
  }
}
