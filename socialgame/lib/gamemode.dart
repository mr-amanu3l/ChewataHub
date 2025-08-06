import 'package:flutter/material.dart';

class GameModeScreen extends StatelessWidget {
  const GameModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F2E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Text(
                  'Choose Your Mode',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.orangeAccent,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
              _buildModeButton(
                context,
                title: 'Team Mode',
                icon: Icons.groups,
                gradientColors: [Colors.deepOrangeAccent, Colors.orange],
                onTap: () {
                  Navigator.pushNamed(context, '/playerEntry', arguments: 'team');
                },
              ),
              const SizedBox(height: 30),
              _buildModeButton(
                context,
                title: 'Individual Mode',
                icon: Icons.person,
                gradientColors: [Colors.purpleAccent, Colors.deepPurple],
                onTap: () {
                  Navigator.pushNamed(context, '/playerEntry', arguments: 'individual');
                },
              ),
              const Spacer(),
              Text(
                'Powered by Chewata Hub ✨',
                style: TextStyle(
                  color: Colors.white54,
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModeButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withOpacity(0.6),
              blurRadius: 15,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
