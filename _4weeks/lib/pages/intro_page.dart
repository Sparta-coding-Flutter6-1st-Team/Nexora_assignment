import 'package:flutter/material.dart';

class DongdongIntroPage extends StatelessWidget {
  const DongdongIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9DEB4), // 연노랑 배경
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // 1. 로고 Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/basket_icon.png', width: 32, height: 32),
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

            const SizedBox(height: 16),

            // 2. 서브 타이틀 박스
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF3B95F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '조선시대 감성의 온라인 마켓',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4B2E0F),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 3. 소개글
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                '동동시장은 조선의 따스한 골목 정취를 담아,\n'
                '물품을 짓는 이와 사는 이가\n'
                '서로 믿고 나눌 수 있는 장터를 베풀고자 하옵니다🌿',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Color(0xFF4B2E0F),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 24),

            // 4. 이미지 + 버튼을 Column으로
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(
                        'assets/mainimages.jpg',
                        fit: BoxFit.contain, // 이미지 비율 유지
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // 버튼 누르면 다음 페이지 이동 등 추가 가능
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF3B95F),
                      elevation: 4,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      '바로입장',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF4B2E0F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
