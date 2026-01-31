import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'album_detail_screen.dart';
import 'explore_screen.dart'; // Impor ExploreScreen jika belum diimpor

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildNavigation(context),
            Expanded(
              child: _buildPhotoGrid(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Moments',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Record all your special moments',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Icon(Icons.photo_library, color: Colors.blue[600]),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            child: Icon(Icons.image, color: Colors.grey[400]),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AlbumDetailScreen(
                    title: 'Album Details',
                    count: '15 Photos',
                    icon: Icons.access_time,
                  ),
                ),
              );
            },
            child: Icon(Icons.access_time, color: Colors.grey[400]),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExploreScreen(
                    title: 'Explore',
                    subtitle: 'Explore your life',
                  ),
                ),
              );
            },
            child: Icon(Icons.image_outlined, color: Colors.grey[400]),
          ),
          const Spacer(),
          Icon(Icons.more_vert, color: Colors.grey[400]),
        ],
      ),
    );
  }

  Widget _buildPhotoGrid(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildPhotoSection(
          context,
          'Today',
          'Oxford Street London',
          [
            'image1.jpg',
            'image2.jpg',
            'image3.jpg',
            'image4.jpg',
            'image5.jpg',
            'image6.jpg'
          ],
        ),
        const SizedBox(height: 24),
        _buildPhotoSection(
          context,
          'Yesterday',
          'New York',
          ['image7.jpg', 'image8.jpg', 'image9.jpg', 'image10.jpg'],
        ),
        const SizedBox(height: 24),
        _buildPhotoSection(
          context,
          'September 16',
          'Paris',
          [
            'image11.jpg',
            'image12.jpg',
            'image13.jpg',
            'image14.jpg',
            'image15.jpg',
            'image16.jpg'
          ],
        ),
      ],
    );
  }

  Widget _buildPhotoSection(BuildContext context, String title, String location,
      List<String> photos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(Icons.location_on, size: 16, color: Colors.grey[400]),
            const SizedBox(width: 4),
            Text(
              location,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: photos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExploreScreen(
                      title: 'Explore',
                      subtitle: 'Explore your life',
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/${photos[index]}',
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
