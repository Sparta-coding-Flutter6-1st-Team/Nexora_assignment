import 'package:flutter/material.dart';

class Product {
  final String name;
  final String imageUrl;
  final int price;

  Product({required this.name, required this.imageUrl, required this.price});
}

class Layout {
  final Widget child;
  final int currentIndex;
  final Function(int) onTap;

  const Layout({
    required this.child,
    required this.currentIndex,
    required this.onTap,
  });
}
