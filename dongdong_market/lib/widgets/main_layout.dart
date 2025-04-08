import 'package:flutter/material.dart';
import 'package:dongdong_market/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final Function(int) onTap;
  final Color? backgroundColor;

  const MainLayout({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/basket_icon.png', width: 40, height: 40),
                const SizedBox(width: 10),
                const Text(
                  '동동시장',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B2E0F),
                  ),
                ),
              ],
            ),
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.menu,
                color: Color(0xFFDDB072),
                size: 40, // 원하는 크기로 조절 (기본은 24)
              ),
              onSelected: (value) async {
                if (value == 'logout') {
                  final prefs = await SharedPreferences.getInstance();
                  print('🔑토큰삭제');
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
        backgroundColor: Color(0xFFDDB072), // 👈 여기서 배경색 지정
        currentIndex: currentIndex,
        onTap: (index) {
          final routes = ['/author_list_page', '/cart', '/payment'];
          Navigator.pushNamed(context, routes[index]);
        },
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
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
