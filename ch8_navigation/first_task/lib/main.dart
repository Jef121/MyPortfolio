import 'package:flutter/material.dart';

ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeMode,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'Navigation Bar Demo',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeMode,
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    const Center(
      child: Text(
        'My Home Page',
        style: TextStyle(fontSize: 24),
      ),
    ),
    const ProfilePage(),
    const SettingsScreen(),
    const Center(
      child: Text(
        'Settings Page',
        style: TextStyle(fontSize: 24),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Navigation'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 26, 113, 185),
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
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
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.grey[200],
            backgroundImage: const AssetImage(
              'assets/images/MyProfile.jpg',
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Jeferson Mabulay',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Flutter Developer | Tech Enthusiast',
            style: TextStyle(
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.edit),
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  // Add your action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.message),
                label: const Text(
                  'Message',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // About Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'I am a passionate Flutter developer with a keen interest in creating beautiful and responsive mobile applications. I love exploring new technologies and solving challenging problems.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  String _selectedTheme = 'Light';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Notifications Toggle
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            const Divider(),

            // Theme Selection Dropdown
            const Text(
              'Select Theme',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedTheme,
              items: ['Light', 'Dark', 'System Default']
                  .map((theme) => DropdownMenuItem<String>(
                        value: theme,
                        child: Text(theme),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTheme = value!;
                });
              },
            ),
            const Divider(),

            // Save Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Save Settings Logic
                  if (_selectedTheme == 'Dark') {
                    themeMode.value = ThemeMode.dark;
                  } else if (_selectedTheme == 'Light') {
                    themeMode.value = ThemeMode.light;
                  } else {
                    themeMode.value = ThemeMode.system; // System Default
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Settings saved successfully! Theme: $_selectedTheme'),
                    ),
                  );
                },
                icon: const Icon(Icons.save),
                label: const Text('Save Settings'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
