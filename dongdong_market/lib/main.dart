import 'package:flutter/material.dart';
import 'pages/cart_list_page.dart';
import 'pages/payment_info_page.dart';
import 'pages/intro_page.dart';
import 'pages/category_screen.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: '727e6320b93d138e91413bd891cf48da');

  bool isLoggedIn = false;

  try {
    await UserApi.instance.accessTokenInfo(); // 토큰 유효 확인
    isLoggedIn = true;
    print('✅ 자동 로그인 성공');
  } catch (e) {
    print('❌ 자동 로그인 실패: $e');

    // 저장된 토큰 삭제 (선택 사항이지만 추천)
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    print('🧼 오래된 토큰 제거 완료');
  }

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '쇼핑앱',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: isLoggedIn ? '/category' : '/', // 여기 OK
      routes: {
        '/': (context) => const DongdongIntroPage(),
        '/intro': (context) => const DongdongIntroPage(),
        '/cart': (context) => const CartListPage(),
        '/payment': (context) => const PaymentInfoPage(),
        '/category': (context) => const CategoryScreen(),
      },
    );
  }
}
