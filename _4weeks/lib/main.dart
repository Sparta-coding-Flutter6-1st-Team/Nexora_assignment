import 'package:flutter/material.dart';
import 'pages/product_detail_page.dart';
import 'pages/cart_list_page.dart';
import 'pages/payment_info_page.dart';
import 'pages/product_list_page.dart';

void main() {
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
        '/': (context) => const ProductListPage(),
        '/cart': (context) => const CartListPage(),
        '/payment': (context) => const PaymentInfoPage(),
      },
    );
  }
}
