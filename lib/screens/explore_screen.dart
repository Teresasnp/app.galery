import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final String title;
  final String subtitle;

  const ExploreScreen({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Explore your life',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Icon(Icons.mic, color: Colors.grey[400]),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'People',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 130, // Menambah tinggi list agar terlihat lebih rapi
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: peopleData.length,
                  itemBuilder: (context, index) {
                    final person = peopleData[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 16.0), // Memberikan jarak antar item
                      child: _buildPersonItem(
                        context,
                        person['name']!,
                        person['age']!,
                        person['imagePath']!,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonItem(
      BuildContext context, String name, String age, String imagePath) {
    return GestureDetector(
      onTap: () {
        _showPersonDetails(context, name, age, imagePath);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 8),
          Text(name),
          Text(
            age,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  void _showPersonDetails(
      BuildContext context, String name, String age, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(imagePath),
              ),
              const SizedBox(height: 8),
              Text('Age: $age', style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 8),
              Text(
                'This is additional information about $name.',
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

const peopleData = [
  {"name": "May", "age": "27", "imagePath": "assets/images/explore1.jpg"},
  {"name": "Caroline", "age": "12", "imagePath": "assets/images/explore2.jpg"},
  {"name": "Olivia", "age": "21", "imagePath": "assets/images/explore3.jpg"},
  {"name": "Charlotte", "age": "23", "imagePath": "assets/images/explore4.jpg"},
  {"name": "tere", "age": "27", "imagePath": "assets/images/explore5.jpg"},
  {"name": "Aya", "age": "12", "imagePath": "assets/images/explore6.jpg"},
  {"name": "Raihan", "age": "21", "imagePath": "assets/images/explore7.jpg"},
  {"name": "Chel", "age": "23", "imagePath": "assets/images/explore8.jpg"},
  {"name": "Yeri", "age": "27", "imagePath": "assets/images/explore9.jpg"},
  {"name": "Felix", "age": "12", "imagePath": "assets/images/explore10.jpg"},
  {"name": "Olga", "age": "21", "imagePath": "assets/images/explore11.jpg"},
  {"name": "Nadia", "age": "19", "imagePath": "assets/images/explore12.jpg"},
  {"name": "Dewi", "age": "19", "imagePath": "assets/images/explore13.jpg"},
  {"name": "Ratih", "age": "19", "imagePath": "assets/images/explore14.jpg"},
  {"name": "Sarah", "age": "19", "imagePath": "assets/images/explore15.jpg"},
];
