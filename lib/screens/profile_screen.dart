import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileScreen());
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anggota Kelompok',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GroupMembersPage(),
    );
  }
}

class GroupMembersPage extends StatelessWidget {
  const GroupMembersPage({super.key});

  // List anggota kelompok
  final List<Map<String, String>> members = const [
    {
      "name": "Teresa",
      "image": "assets/images/anggota1.jpg",
    },
    {
      "name": "Ayang",
      "image": "assets/images/member3.jpg",
    },
    {
      "name": "Rachel",
      "image": "assets/images/anggota2.jpg",
    },
    {
      "name": "Aidil",
      "image": "assets/images/member4.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anggota Kelompok'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio:
                0.75, // Mengatur rasio aspek grid agar lebih tinggi
          ),
          itemCount: members.length,
          itemBuilder: (context, index) {
            final member = members[index];
            return GestureDetector(
              onTap: () {
                _showImageDialog(context, member["image"]!);
              },
              child: _buildMemberCard(member["name"]!, member["image"]!),
            );
          },
        ),
      ),
    );
  }

  // Widget untuk setiap kartu anggota
  Widget _buildMemberCard(String name, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover, // Menyesuaikan gambar agar proporsional
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menampilkan dialog dengan gambar yang bisa di-zoom
  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(20),
            minScale: 0.5,
            maxScale: 4.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}
