import 'package:dongdong_market/models/models.dart';
import 'package:flutter/material.dart';
import '../data/dummy_products.dart';
import '../widgets/main_layout.dart';
import 'dart:math'; // 랜덤 색상 생성을 위해 필요

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentIndex: 0,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/cart');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/payment');
            break;
        }
      },

      // 🔽 여기 Container로 감싸서 전체 배경색 적용
      child: Container(
        color: AppColors.Page, // ✅ 페이지 배경색
        child: Column(
          children: [
            // 🔍 검색바
            Center(
              child: Container(
                width: 902,
                height: 82,
                color: AppColors.SearchBar,
                padding: const EdgeInsets.all(10),
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

            // 🎉 커스텀 배너
            const BannerCard(),

            // 📦 상품 리스트
            Expanded(
              child: ListView.builder(
                itemCount: dummyProducts.length,
                itemBuilder: (context, index) {
                  final product = dummyProducts[index];
                  return ListTile(
                    leading: Image.network(
                      product.imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          size: 60,
                          color: Colors.grey,
                        );
                      },
                    ),
                    title: Text(product.name),
                    subtitle: Text('${product.price}원'),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite_border), // 빈 하트 아이콘
                      color: Colors.red,
                      onPressed: () {
                        // TODO: 즐겨찾기 상태 저장 로직 추가 예정
                        print('${product.name} 즐겨찾기!');
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> bgColors = [
      AppColors.Banner,
      AppColors.BannerCardBackground,
    ];
    final Color randomBgColor = bgColors[Random().nextInt(bgColors.length)];

    return Container(
      height: 100,
      color: randomBgColor,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.storefront, size: 40, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '동동상회',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '서울특별시 동작구 어딘가 123',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
