// lib/pages/dongdong_intro_page.dart
import 'package:flutter/material.dart';
import '../services/kakao_login_service.dart';

class DongdongIntroPage extends StatelessWidget {
  const DongdongIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9DEB4),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // 로고
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

            // 서브타이틀
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

            // 소개글
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

            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset('assets/main_images.jpg'),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 카카오 로그인 버튼
                  TextButton.icon(
                    onPressed: () async {
                      final result = await KakaoLoginService.login();

                      if (result) {
                        // 로그인 성공 시: 메인 페이지로 이동

                        Navigator.pushReplacementNamed(context, '/category');
                      } else {
                        // 로그인 실패 시: 에러 메시지 출력
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('로그인에 실패했습니다. 다시 시도해주세요'),
                          ),
                        );
                      }
                    },
                    label: const Text(
                      '카카오로 시작하기',
                      style: TextStyle(
                        color: Color(0xFF4B2E0F),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFEE500),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
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
