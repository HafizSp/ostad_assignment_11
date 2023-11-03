import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad_assignment_11/screens/photo.dart';
import 'package:ostad_assignment_11/widgets/photo_item.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  List<Photo> photoList = [];
  bool isFetch = false;

  Future<void> getPhoto() async {
    try {
      isFetch = true;
      setState(() {});
      Response response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos'),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        for (Map<String, dynamic> mapPhoto in responseData) {
          photoList.add(Photo.fromJson(mapPhoto));
        }
      } else {
        throw Exception('Failed to fetch photo');
      }
    } catch (e) {
      print('Error occurred during API request: $e');
      throw Exception('Failed to fetch photo');
    } finally {
      isFetch = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    getPhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: isFetch
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: photoList.length,
              itemBuilder: (BuildContext context, int index) {
                return PhotoItem(photo: photoList[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
    );
  }
}
