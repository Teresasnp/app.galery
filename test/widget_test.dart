import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:galeri/main.dart';

void main() {
  testWidgets('MyApp displays MomentsScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verifikasi bahwa 'Moments' muncul di halaman utama.
    expect(find.text('Moments'), findsOneWidget);

    // Verifikasi bahwa teks 'Record all your special moments' muncul.
    expect(find.text('Record all your special moments'), findsOneWidget);

    // Verifikasi bahwa ikon foto, video, dan lokasi muncul.
    expect(find.byIcon(Icons.photo_library), findsOneWidget);
    expect(find.byIcon(Icons.video_library), findsOneWidget);
    expect(find.byIcon(Icons.location_on), findsOneWidget);
  });
}
