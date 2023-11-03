import 'package:flutter/material.dart';
import 'package:ostad_assignment_11/screens/photo.dart';

class PhotoDetailsScreen extends StatelessWidget {
  const PhotoDetailsScreen({super.key, required this.photo});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 400,
                child: Image.network(photo.url),
              ),
              const SizedBox(height: 20),
              Text('Title: ${photo.title}'),
              Text('ID: ${photo.id}')
            ],
          ),
        ),
      ),
    );
  }
}
