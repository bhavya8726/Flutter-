import 'package:flutter/material.dart';
import 'form.dart'; // ✅ Import UserFormScreen

class MatrimonialScreen extends StatelessWidget {
  const MatrimonialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrimonial'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            buildMenuItem(
              icon: Icons.person_add,
              label: 'Add User',
              onTap: () {
                // ✅ Navigate to UserFormScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserFormScreen(),
                  ),
                );
              },
            ),
            buildMenuItem(
              icon: Icons.list,
              label: 'User List',
              onTap: () {
                // TODO: Add navigation
              },
            ),
            buildMenuItem(
              icon: Icons.favorite,
              label: 'Favourite',
              onTap: () {
                // TODO: Add navigation
              },
            ),
            buildMenuItem(
              icon: Icons.info,
              label: 'About Us',
              onTap: () {
                // TODO: Add navigation
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.black87),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
