import 'package:flutter/material.dart';
import 'pages/product_detail_page.dart';
import 'pages/cart_list_page.dart';
import 'pages/payment_info_page.dart';
import 'pages/product_list_page.dart';
import 'pages/intro_page.dart';
import 'pages/category_screen.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'cc36c9a63b47fd7724a5f01e03cf3d72');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '쇼핑앱',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const DongdongIntroPage(),
        '/intro': (context) => const DongdongIntroPage(),
        '/cart': (context) => const CartListPage(),
        '/payment': (context) => const PaymentInfoPage(),
        '/category': (context) => const CategoryScreen(),
      },
    );
  }
}
