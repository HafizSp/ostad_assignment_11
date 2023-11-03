import 'package:flutter/material.dart';

import '../screens/photo.dart';
import '../screens/photo_details_screen.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({super.key, required this.photo});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoDetailsScreen(photo: photo),
          ),
        );
      },
      leading: Image.network(photo.url),
      title: Text(photo.title),
    );
  }
}
