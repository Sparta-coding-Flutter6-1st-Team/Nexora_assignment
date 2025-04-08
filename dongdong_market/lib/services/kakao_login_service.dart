// lib/services/kakao_login_service.dart
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginService {
  static Future<bool> isLoggedIn() async {
    try {
      await UserApi.instance.accessTokenInfo();
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<void> login() async {
    try {
      bool installed = await isKakaoTalkInstalled();
      OAuthToken token =
          installed
              ? await UserApi.instance.loginWithKakaoTalk()
              : await UserApi.instance.loginWithKakaoAccount();

      print('✅ 로그인 성공: ${token.accessToken}');

      final user = await UserApi.instance.me();
      print('사용자 이름: ${user.kakaoAccount?.profile?.nickname}');
    } catch (e) {
      print('❌ 로그인 실패: $e');
    }
  }

  static Future<void> logout() async {
    try {
      await UserApi.instance.logout();
      print('🧼 로그아웃 완료');
    } catch (e) {
      print('❌ 로그아웃 실패: $e');
    }
  }
}
