import 'package:flutter/material.dart';

class InteriorPage extends StatelessWidget {
  final String image;
  final String category;
  final String subtext;

  const InteriorPage({
    Key? key,
    required this.image,
    required this.category,
    required this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interior Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    subtext,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  // Add more details here as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
