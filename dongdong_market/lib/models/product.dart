import 'package:flutter/material.dart';

class Product {
  final String name;
  final String imageUrl;
  final int price;

  Product({required this.name, required this.imageUrl, required this.price});
}

class AppColors {
  static const Color AppBarBackground = Color(0xFFF7DEB1); //AppBar 배경 색상
  static const Color accent = Color(0xFFF9BF7E); // BottomNavigationBar 선택된 아이템 컬러
  static const Color border = Color(0xFF8D6E63); // 선택된 태그 테두리 색상
  static const Color selectdTangBackground = Color(0xFFD2B48C); // 선택된 태그 배경색
  static const Color selectedTagText = Color(0xFF3E2723); // 선택된 태그 텍스트 색상
  static const Color unselectedTagText = Color(0xFF5D4037); // 비선택된 태그 텍스트 색상
  static const Color SearchBar = Color(0xFFFEDC180); // 검색바 배경색
  static const Color SearchBarfill = Color(0xFFF4ECDB); // 검색바 텍스트 배경 색상
  static const Color Page = Color(0XFFFAE7C6); // 페이지 배경색
  static const Color Banner = Color(0XFFD5A5A2); // 배너의 어딘가인데 어딜까요
  static const Color BannerCardBackground = Color(0xFF3F575B); // 배너 배경색
  static const Color CategoryBackground = Color(0xFFF7E4D0); // 카테고리 배경색
  static const Color CategoryAppBarBackground = Color(0xFFF5DFC4); // 카테고리 AppBar 배경색
  static const Color Button = Color(0xFFD6B69E); // 버튼 배경색
}