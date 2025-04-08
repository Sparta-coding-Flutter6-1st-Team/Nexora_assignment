import 'package:dongdong_market/models/product.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Layout layout;

  const MainLayout({super.key, required this.layout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7DEB1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.shopping_cart, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  '동동시장',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('메뉴 버튼 클릭됨')));
              },
            ),
          ],
        ),
        elevation: 4,
      ),
      body: layout.child, // ✅ 페이지 내용
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: layout.currentIndex,
        onTap: layout.onTap,
        selectedItemColor: const Color(0xFFE9BF7E),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list), 
            label: '상품'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '장바구니',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment), 
            label: '결제'),
        ],
      ),
    );
  }
}
