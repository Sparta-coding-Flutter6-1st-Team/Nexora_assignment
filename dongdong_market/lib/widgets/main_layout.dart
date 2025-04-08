import 'package:flutter/material.dart';
import '../models/product.dart'; // 추가된 상수 파일 import

class MainLayout extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final Function(int) onTap;

  const MainLayout({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                kAppIcon,
                SizedBox(width: 8),
                Text(kAppBarTitle, style: kAppBarTitleStyle),
              ],
            ),
            IconButton(
              icon: kMenuIcon,
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
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: kSelectedNavColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: '상품'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '장바구니',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: '결제'),
        ],
      ),
    );
  }
}
