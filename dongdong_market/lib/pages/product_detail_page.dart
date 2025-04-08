import 'package:flutter/material.dart';
import '../widgets/main_layout.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      backgroundColor: const Color(0xFFF9DEB4),
      currentIndex: 0,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/author_list_page');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/cart');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/payment');
        }
      },
      child: const Center(child: Text('여기는 상품 상세 페이지입니다.')),
    );
  }
}
