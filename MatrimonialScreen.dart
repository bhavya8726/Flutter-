import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MatrimonialScreen(),
  ));
}

class MatrimonialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrimonial'),
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
                // Navigate to Add User
              },
            ),
            buildMenuItem(
              icon: Icons.list,
              label: 'User List',
              onTap: () {
                // Navigate to User List
              },
            ),
            buildMenuItem(
              icon: Icons.favorite,
              label: 'Favourite',
              onTap: () {
                // Navigate to Favourite
              },
            ),
            buildMenuItem(
              icon: Icons.info,
              label: 'About Us',
              onTap: () {
                // Navigate to About Us
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
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}