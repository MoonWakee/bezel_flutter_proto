import 'dart:io';
import 'package:Bezel/constants.dart';
import 'package:Bezel/models/Cart.dart';
import 'package:Bezel/screens/cart/cart_screen.dart';
import 'package:Bezel/screens/post/components/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

import '../../models/Product.dart';
import '../details/details_screen.dart';

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
                      ? FullScreenImage(image: image!)
                      : Container(),
                ),
              ),
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
      width: 320,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
  bool adding = false;
  List<Offset> buttonPositions = [];
  List<String> buttonNames = [];
  List<Product> products = [];

  void handleTapUp(TapUpDetails details, Matrix4 transform) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset localPosition = box.globalToLocal(details.globalPosition);
    final Matrix4? invertedMatrix = Matrix4.tryInvert(transform);
    if (invertedMatrix != null) {
      final Offset transformedPosition =
          MatrixUtils.transformPoint(invertedMatrix, localPosition);
      setState(() {
        buttonPositions.add(transformedPosition);
      });
    }
  }

  // void showAddButtonDialog(BuildContext context) {
  //   TextEditingController controller = TextEditingController();

  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Add Tag'),
  //         content: TextField(
  //           controller: controller,
  //           decoration: InputDecoration(
  //             labelText: 'Tag Name',
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             child: Text('Cancel'),
  //             onPressed: () {
  //               setState(() {
  //                 buttonPositions.removeLast();
  //                 adding = !adding;
  //               });
  //               Navigator.pop(context);
  //             },
  //           ),
  //           TextButton(
  //             child: Text('Add'),
  //             onPressed: () {
  //               String name = controller.text.trim();
  //               setState(() {
  //                 adding = !adding;
  //               });
  //               if (name.isNotEmpty) {
  //                 setState(() {
  //                   buttonNames.add(name);
  //                 });
  //               }
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MatrixGestureDetector(
        onMatrixUpdate: (Matrix4 matrix, Matrix4 _, Matrix4 __, Matrix4 ___) {},
        child: Stack(
          children: [
            GestureDetector(
              onTapUp: (details) async {
                final RenderBox box = context.findRenderObject() as RenderBox;
                final Matrix4? transform = box.getTransformTo(null);
                if (transform != null && adding) {
                  handleTapUp(details, transform);
                  final result =
                      await Navigator.pushNamed(context, ProductList.routeName)
                          as Product;
                  setState(() {
                    products.add(result);
                    buttonNames.add(result.subtitle);
                    adding = !adding;
                  });
                }
                //   if (adding)
                //     showAddButtonDialog(
                //         context); // Show dialog to add button name
                // }
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
            ...buttonPositions.asMap().entries.map((entry) {
              int index = entry.key;
              Offset position = entry.value;
              String name =
                  buttonNames.length > index ? buttonNames[index] : '';
              return Positioned(
                left: position.dx,
                top: position.dy - 20,
                child: ElevatedButton(
                    onPressed: () {
                      // Handle button tap
                      Navigator.pushNamed(
                        context,
                        DetailsScreen.routeName,
                        arguments:
                            ProductDetailsArguments(product: products[index]),
                      );
                    },
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(122, 203, 71, 0)))),
              );
            }),
          ],
        ),
      ),
      persistentFooterButtons: [
        if (adding)
          Text.rich(
            TextSpan(
              text: "Tap on Photo to add tag!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              adding = !adding;
            });
          },
          child: Icon(Icons.new_label),
          backgroundColor: adding ? Colors.orange : Colors.blueAccent,
          heroTag: null,
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              buttonPositions.clear();
              buttonNames.clear();
            });
          },
          child: Icon(Icons.delete),
          backgroundColor: Colors.red,
          heroTag: null,
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Icon(Icons.arrow_forward_ios),
          backgroundColor: kPrimaryColor,
          heroTag: null,
        ),
      ],
    );
  }
}
