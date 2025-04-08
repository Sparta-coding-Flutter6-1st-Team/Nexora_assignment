import 'package:flutter/material.dart';
import '../models/creator.dart';

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
      onTap: () {
        print("📢 클릭한 작가: ${creator.name}, 주소: ${creator.address}");
        // 필요하면 Navigator.push(...) 로 상세페이지도 연결 가능
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
