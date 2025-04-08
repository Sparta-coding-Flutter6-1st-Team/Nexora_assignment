import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/cart_list_page.dart';
import 'pages/payment_info_page.dart';
import 'pages/intro_page.dart';
import 'pages/category_screen.dart';
import 'pages/author_list_page.dart';
import 'pages/product_list_page.dart';
import 'services/backend_auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: '727e6320b93d138e91413bd891cf48da');

  bool isLoggedIn = false;

  try {
    await UserApi.instance.accessTokenInfo(); // ✅ 카카오 accessToken 유효 확인
    print('✅ 카카오 accessToken 유효함');

    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    if (accessToken != null) {
      // ✅ 백엔드 인증 시도
      final backendSuccess =
          await BackendAuthService.authenticateWithKakaoToken(accessToken);
      if (backendSuccess) {
        print('🔐 백엔드 인증 성공 - JWT 저장됨');
        isLoggedIn = true;
      } else {
        print('❌ 백엔드 인증 실패');
        await prefs.remove('accessToken');
      }
    }
  } catch (e) {
    print('❌ 자동 로그인 실패: $e');
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
      initialRoute: isLoggedIn ? '/category' : '/',
      routes: {
        '/': (context) => const DongdongIntroPage(),
        '/intro': (context) => const DongdongIntroPage(),
        '/cart': (context) => const CartPage(),
        '/payment': (context) => const PaymentInfoPage(),
        '/category': (context) => const CategoryScreen(),
        '/author_list_page': (context) => const AuthorListPage(),
        '/ProductListPage': (context) => const ProductListPage(),
      },
    );
  }
}
