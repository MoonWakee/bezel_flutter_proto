import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/lamp_yellow.png",
      "assets/images/lamp_white.png",
    ],
    colors: [
      Color.fromARGB(255, 255, 210, 97),
      Colors.white,
    ],
    title: "Simple Designs LF2000-BLK Lamp",
    price: 64.99,
    description:
        "Simple Designs creates affordable decorative lighting designs for your home. From table and floor lamps to desk lamps, ceiling lights and everything in between, Simple Designs knows the value of practical lighting solutions, and our mission is to provide a wide selection of lighting designs you'll love.",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/black_pillow.png",
    ],
    colors: [
      Colors.black,
      Colors.white,
    ],
    title:
        "Emvency Throw Pillow Cover Car Cool Black White Formula Checkered Pillow Case",
    price: 11.99,
    description:
        "The super soft velvet cushion cover can not only protect your beloved pillow cushion, but also can be used with other pillows and furniture to make your home more different.",
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/yellow_pillow.png",
    ],
    colors: [
      Color(0xFFDECB9C),
    ],
    title: "CaliTime Pack of 2 Soft Canvas Throw Pillow Covers Cases",
    price: 14.95,
    description:
        "CaliTime has always been committed to developing and providing unique design and high-quality THROW PILLOW COVERS for you, bringing colorful warmth to your life and refreshing your living space!",
    rating: 4.6,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/yellow_table.png",
      "assets/images/black_table.png",
    ],
    colors: [
      Color(0xFFDECB9C),
      Colors.black,
    ],
    title: "Side Tables Laptop Table Nordic Marble Coffee Cshaped",
    price: 245.95,
    description:
        "Made from a metal structure with a marble table top, it is both stylish and elegant. No assembly required, it can be used directly.",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
