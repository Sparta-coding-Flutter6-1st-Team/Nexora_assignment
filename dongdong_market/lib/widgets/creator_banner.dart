import 'package:flutter/material.dart';
import '../models/creator.dart';
import '../services/product_service.dart';

class CreatorBanner extends StatelessWidget {
  final Creator creator;
  final Color backgroundColor;

  const CreatorBanner({
    super.key,
    required this.creator,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print("📢 클릭한 작가: ${creator.name}, 주소: ${creator.address}");

        final products = await ProductService.fetchProductsByCreator(
          creator.id.toString(),
        );

        if (products != null) {
          Navigator.pushNamed(
            context,
            '/ProductListPage',
            arguments: {'creator': creator, 'products': products},
          );
        } else {
          print("❌ 상품 목록 불러오기 실패");
          // 실패 토스트 등도 가능
        }
      },
      child: Container(
        color: backgroundColor,
        padding: EdgeInsets.zero, // 패딩 제거
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(creator.profileImage),
            radius: 30,
          ),
          title: Text(
            creator.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            creator.address, // "주소:" 제거
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
