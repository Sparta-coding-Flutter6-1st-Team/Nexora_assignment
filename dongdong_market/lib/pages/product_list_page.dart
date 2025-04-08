import 'dart:math';
import 'package:flutter/material.dart';
import '../models/creator.dart';
import '../widgets/creator_banner.dart';
import '../widgets/main_layout.dart';
import 'package:dongdong_market/models/models.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final Creator creator = args['creator'];
    final List<dynamic> products = args['products'];

    // 🎨 배경 색상 리스트
    final List<Color> bannerColors = [
      const Color(0xFF4A6B6F), // 진한 청록
      const Color(0xFFD9A5A3), // 부드러운 분홍
    ];

    // 🎲 랜덤으로 하나 선택
    final Color selectedColor =
        bannerColors[Random().nextInt(bannerColors.length)];

    return MainLayout(
      currentIndex: 0,
      onTap: (index) {
        if (index == 1) {
          Navigator.pushNamed(context, '/cart');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/payment');
        }
      },
      child: Column(
        children: [
          Center(
            child: Container(
              width: 902,
              height: 82,
              color: AppColors.SearchBar,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '찾고자 하는 이를 써보시오',
                  suffixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppColors.SearchBarfill,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 22),
                ),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          CreatorBanner(
            creator: creator,
            backgroundColor: selectedColor, // 🎯 랜덤 색상 적용!
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                int quantity = 1;

                return StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: Row(
                        children: [
                          // 이미지
                          Image.network(
                            product['image_url'],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.image_not_supported,
                                size: 80,
                              );
                            },
                          ),

                          // 정보 + 버튼
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${product['price']}원',
                                  style: const TextStyle(fontSize: 14),
                                ),

                                // 버튼
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove, size: 18),
                                      onPressed: () {
                                        if (quantity > 1)
                                          setState(() => quantity--);
                                      },
                                    ),
                                    Text(
                                      '$quantity',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add, size: 18),
                                      onPressed: () {
                                        if (quantity < 99)
                                          setState(() => quantity++);
                                      },
                                    ),
                                    const Spacer(),
                                    TextButton.icon(
                                      onPressed: () {
                                        print(
                                          '🛒 장바구니 담기: ${product['name']} (수량: $quantity)',
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.shopping_cart,
                                        size: 16,
                                      ),
                                      label: const Text(
                                        '담기',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      style: TextButton.styleFrom(
                                        foregroundColor: const Color(
                                          0xFF4A6B6F,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
