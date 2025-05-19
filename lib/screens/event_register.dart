import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController groupController = TextEditingController();
    launchUrl(Uri.parse('https://t.me/jihc.kz'));
    Future<void> _launchInstagram() async {
      // Instagram profile URL
      final Uri instagramUrl = Uri.parse(
        'https://www.instagram.com/your_username/',
      );

      if (await canLaunchUrl(instagramUrl)) {
        await launchUrl(instagramUrl, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $instagramUrl';
      }
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF8323E2), Color(0xFF1E3DF2)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Назад
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: const [
                      Icon(Icons.arrow_back, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                const Center(
                  child: Text(
                    'Registration',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                //comp
                const Text(
                  'Competition',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),

                TextField(
                  controller: groupController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter competition',
                    hintStyle: const TextStyle(color: Colors.white54),
                  ),
                ),
                const SizedBox(height: 30),

                // Поле для имени
                const Text(
                  'Name',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter your name',
                    hintStyle: const TextStyle(color: Colors.white54),
                  ),
                ),
                const SizedBox(height: 24),

                // Поле для группы
                const Text(
                  'Group',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: groupController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter your group',
                    hintStyle: const TextStyle(color: Colors.white54),
                  ),
                ),
                const SizedBox(height: 30),

                // Кнопка регистрации
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      final name = nameController.text;
                      final group = groupController.text;

                      // Здесь можно обработать отправку данных
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Имя: $name, Группа: $group')),
                      );
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Telegram ссылка
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _launchInstagram;
                    },
                    child: const Text(
                      'Subscribe to our instagram  ',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
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
