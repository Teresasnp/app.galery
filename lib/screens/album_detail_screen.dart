import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class AlbumDetailScreen extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;

  const AlbumDetailScreen({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: _buildPhotoGrid(context),
    );
  }

  // Membuat grid foto berdasarkan data yang diberikan
  Widget _buildPhotoGrid(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildPhotoSection(
          context,
          'Today',
          'Seodaemun Museum of Natural History',
          [
            'assets/images/screenshots_1.jpg',
            'assets/images/screenshots_2.jpg',
            'assets/images/screenshots_3.jpg',
            'assets/images/screenshots_4.jpg',
            'assets/images/screenshots_5.jpg',
            'assets/images/screenshots_6.jpg',
          ],
        ),
        const SizedBox(height: 24),
        _buildPhotoSection(
          context,
          'Yesterday',
          'Jepang',
          [
            'assets/images/screenshots_7.jpg',
            'assets/images/screenshots_8.jpg',
            'assets/images/screenshots_9.jpg',
            'assets/images/screenshots_10.jpg',
          ],
        ),
        const SizedBox(height: 24),
        _buildPhotoSection(
          context,
          'September 16',
          'Distrik Dobong',
          [
            'assets/images/screenshots_11.jpg',
            'assets/images/screenshots_12.jpg',
            'assets/images/screenshots_13.jpg',
            'assets/images/screenshots_14.jpg',
            'assets/images/screenshots_15.jpg',
            'assets/images/screenshots_16.jpg',
          ],
        ),
      ],
    );
  }

  // Widget untuk membuat setiap bagian dengan grid gambar
  Widget _buildPhotoSection(BuildContext context, String date, String location,
      List<String> imagePaths) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _openPhotoViewer(context, imagePaths, index),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback jika gambar tidak ditemukan
                    return Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Fungsi untuk membuka tampilan zoom gambar
  void _openPhotoViewer(
      BuildContext context, List<String> imagePaths, int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoViewerScreen(
          imagePaths: imagePaths,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

class PhotoViewerScreen extends StatelessWidget {
  final List<String> imagePaths;
  final int initialIndex;

  const PhotoViewerScreen({
    super.key,
    required this.imagePaths,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.black,
      body: PhotoViewGallery.builder(
        itemCount: imagePaths.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(imagePaths[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        pageController: PageController(initialPage: initialIndex),
        scrollPhysics: const BouncingScrollPhysics(),
      ),
    );
  }
}
