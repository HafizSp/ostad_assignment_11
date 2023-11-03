import 'package:flutter/material.dart';
import 'package:ostad_assignment_11/screens/photo_list_screen.dart';

void main() {
  runApp(const PhotoApp());
}

class PhotoApp extends StatelessWidget {
  const PhotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotoListScreen(),
    );
  }
}
