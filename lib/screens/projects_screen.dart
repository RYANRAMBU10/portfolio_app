import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart'; // Import animasi
import '../models/project.dart';
import '../widgets/project_item.dart';

class ProjectsScreen extends StatefulWidget { // Ubah ke StatefulWidget
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> with TickerProviderStateMixin { // Tambah TickerProviderStateMixin
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Biar background sampai atas
      appBar: AppBar(
        title: const Text("Projects"),
        backgroundColor: Colors.transparent, // Transparan
        elevation: 0, // Hilangkan shadow
      ),
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1D2671), Color(0xFFC33764)], // Sama seperti HomeScreen
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Animated Background
          AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: ParticleOptions(
                baseColor: Colors.white,
                spawnOpacity: 0.0,
                opacityChangeRate: 0.25,
                minOpacity: 0.1,
                maxOpacity: 0.4,
                spawnMinSpeed: 10.0,
                spawnMaxSpeed: 30.0,
                spawnMinRadius: 2.0,
                spawnMaxRadius: 6.0,
                particleCount: 40,
              ),
            ),
            vsync: this,
            child: ListView.builder( // Gunakan ListView.builder di dalam AnimatedBackground
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return Padding( // Tambahkan padding untuk ruang
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ProjectItem(project: projects[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}