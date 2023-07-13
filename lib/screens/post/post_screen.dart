import 'dart:io';
import 'package:Bezel/constants.dart';
import 'package:Bezel/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:custom_marker/marker_icon.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  File? _image;

  Future pickImage(ImageSource source) async {
    try {
      final _image = await ImagePicker().pickImage(source: source);
      if (_image == null) return;

      final imageTemp = File(_image.path);
      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  void _navigateToFullScreenView() {
    if (_image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaggingPage(image: _image),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post'), automaticallyImplyLeading: false),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                if (_image != null) {
                  _navigateToFullScreenView();
                }
              },
              child: Container(
                color: Colors.grey[300],
                height: 400,
                child: Center(
                  child: _image != null
                      ? Image.file(_image!, fit: BoxFit.fill)
                      : Text(
                          'Upload Photo',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
            if (_image != null)
              Text.rich(
                TextSpan(
                  text: "Tap on selected Photo to confirm!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            SizedBox(height: 16),
            CustomButton(
              icon: Icons.photo_library,
              label: 'Select from Gallery',
              onPressed: () => pickImage(ImageSource.gallery),
            ),
            SizedBox(height: 16),
            CustomButton(
              icon: Icons.photo_camera,
              label: 'Pick from Camera',
              onPressed: () => pickImage(ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }
}

class TaggingPage extends StatelessWidget {
  final File? image;

  const TaggingPage({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Implement your logic for interacting with the full-screen image
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  child: image != null
                      ? Image.file(image!, fit: BoxFit.cover)
                      : Container(),
                ),
              ),
            ),
            // SizedBox(height: 16),
            CustomButton(
              icon: Icons.local_offer,
              label: 'Tap to tag your products!',
              onPressed: () => {
                if (image != null)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenImage(image: image!),
                      ),
                    )
                  }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(320),
      height: getProportionateScreenHeight(60),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          // padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}

class FullScreenImage extends StatefulWidget {
  final File? image;

  const FullScreenImage({required this.image});

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  List<Widget> markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          GestureDetector(
            onTapUp: (details) {
              final RenderBox box = context.findRenderObject() as RenderBox;
              final Offset localPosition =
                  box.globalToLocal(details.globalPosition);
              setState(() {
                markers.add(
                  Positioned(
                    left: localPosition.dx,
                    top: localPosition.dy,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                );
              });
            },
            child: Container(
              child: PhotoView(
                imageProvider: FileImage(widget.image!),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2.5,
                initialScale: PhotoViewComputedScale.contained,
                loadingBuilder: (context, event) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          ...markers,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            markers.clear();
          });
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
