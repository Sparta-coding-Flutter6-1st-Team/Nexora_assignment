import 'package:flutter/material.dart';
import 'package:dongdong_market/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        backgroundColor: AppColors.AppBarBackground,
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
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu, color: Colors.white),
              onSelected: (value) async {
                if (value == 'logout') {
                  final prefs = await SharedPreferences.getInstance();
                  print('🔑 저장된 토큰: $prefs');
                  await prefs.remove('accessToken');
                  await prefs.remove('jwt'); // ✅ JWT도 제거
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/intro',
                    (route) => false,
                  );
                }
              },
              itemBuilder:
                  (context) => [
                    const PopupMenuItem<String>(
                      value: 'logout',
                      child: Text('로그아웃'),
                    ),
                  ],
            ),
          ],
        ),
        elevation: 4,
      ),
      body: child, // ✅ 페이지 내용
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          final routes = ['/author_list_page', '/cart', '/payment'];
          Navigator.pushNamed(context, routes[index]);
        },
        selectedItemColor: AppColors.accent,
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
