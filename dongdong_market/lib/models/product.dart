import 'package:flutter/material.dart';

class Product {
  final String name;
  final String imageUrl;
  final int price;

  Product({required this.name, required this.imageUrl, required this.price});
}

/// 색상 상수
const kAppBarBackgroundColor = Color(0xFFF7DEB1);
const kSelectedNavColor = Color(0xFFE9BF7E);

/// 텍스트 스타일
const kAppBarTitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

/// 아이콘
const kAppIcon = Icon(Icons.shopping_cart, color: Colors.white);
const kMenuIcon = Icon(Icons.menu, color: Colors.white);

/// 텍스트
const kAppBarTitle = '동동시장';
