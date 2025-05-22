import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFF4B0082), // ungu mewah light
    primarySwatch: Colors.deepPurple,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF6A0DAD),
      foregroundColor: Colors.white,
    ),
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF311B92), // ungu gelap dark
    primarySwatch: Colors.deepPurple,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF512DA8),
      foregroundColor: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: HomePage(onToggleTheme: _toggleTheme),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const HomePage({super.key, required this.onToggleTheme});

  void _showBiodataSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/portfolio.png'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'RYAN RAMBU RABBANI',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('Flutter Developer • UI/UX Designer'),
                  const Divider(height: 30),
                  const ListTile(
                    leading: Icon(Icons.email),
                    title: Text('rayen.rrr7@example.com'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('0812-3456-7890'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Tangerang, Indonesia'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.code),
                    title: Text('Keahlian: Flutter, Firebase, UI/UX'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.description),
                    label: const Text('Lihat Resume'),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ResumePage()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Tutup'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showBiodataSheet(context),
          child: AnimatedScale(
            scale: 1,
            duration: const Duration(milliseconds: 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: 'profile-pic',
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/portfolio.png'),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Klik foto untuk lihat biodata',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "• ",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resume Saya')),
      backgroundColor: const Color(0xFF4B0082),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 6,
          color: const Color(0xFF6A0DAD),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('📄 Pengalaman:'),
                  bulletPoint('Flutter Developer di ABC Tech (2022 - sekarang)'),
                  bulletPoint('UI/UX Designer Freelance (2020 - 2022)'),
                  const SizedBox(height: 20),
                  sectionTitle('🎓 Pendidikan:'),
                  bulletPoint('S1 Teknik Informatika, Universitas Insan Pembangunan Indonesia'),
                  const SizedBox(height: 20),
                  sectionTitle('🛠️ Proyek:'),
                  bulletPoint('Aplikasi Belajar Flutter'),
                  bulletPoint('Website Portofolio'),
                  bulletPoint('UI Kit Mobile App'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
