import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _flutterUrl = Uri.parse('https://flutter.dev');

void main() => runApp(
      const MaterialApp(
        home: SocialMediaButtons(),
      ),
    );

class SocialMediaButtons extends StatefulWidget {
  const SocialMediaButtons({super.key});

  @override
  State<SocialMediaButtons> createState() => _SocialMediaButtonsState();
}

class _SocialMediaButtonsState extends State<SocialMediaButtons> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 31, 34),
        elevation: 0,
        title: const Text(
          'Social Media Links',
          style: TextStyle(color: Colors.white),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: _selectedIndex == 0
          ? Stack(
              children: [
                Image.asset(
                  'assets/nice.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                _buildSocialMediaButtons(),
              ],
            )
          : _selectedIndex == 1
              ? _buildProfilePage()
              : _buildSettingsPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor:  const Color.fromARGB(255, 27, 31, 34),
      ),
    );
  }

  Widget _buildSocialMediaButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: _buildButton(
            context,
            'Facebook',
            'assets/facebook.png',
            Colors.blueAccent,
            'https://facebook.com',
          ),
        ),
        GestureDetector(
          child: _buildButton(
            context,
            'Pinterest',
            'assets/pinterest.png',
            Colors.redAccent,
            'https://www.pinterest.com',
          ),
        ),
        GestureDetector(
          child: _buildButton(
            context,
            'GitHub',
            'assets/githup.png',
            Colors.black26,
            'https://github.com/amelia123k/social-media-link',
          ),
        ),
        GestureDetector(
          child: _buildButton(
            context,
            'LinkedIn',
            'assets/linkedin.png',
            Colors.lightBlueAccent,
            'https://linkedin.com',
          ),
        ),
        GestureDetector(
          child: _buildButton(
            context,
            'WhatsApp',
            'assets/whatsapp.png',
            Colors.greenAccent,
            'https://whatsapp.com',
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String title, String imagePath,
      Color color, String url) {
    return InkWell(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (!await launchUrl(uri)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $url')),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePage() {
    return const Center(
      child: Text(
        'Profile Page Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildSettingsPage() {
    return const Center(
      child: Text(
        'Settings Page Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}