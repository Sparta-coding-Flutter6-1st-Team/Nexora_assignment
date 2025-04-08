import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './backend_auth_service.dart'; // ✅ 백엔드 인증 서비스 임포트

class KakaoLoginService {
  // 로그인 상태 확인
  static Future<bool> isLoggedIn() async {
    try {
      await UserApi.instance.accessTokenInfo(); // 자동으로 토큰 유효성 검증 및 갱신
      return true;
    } catch (_) {
      return false;
    }
  }

  // 로그인 로직
  static Future<bool> login() async {
    bool isKakaoInstalled = await isKakaoTalkInstalled();

    try {
      OAuthToken token;

      if (isKakaoInstalled) {
        try {
          token = await UserApi.instance.loginWithKakaoTalk();
          print('✅ 카카오톡으로 로그인 성공');
        } catch (error) {
          print('❌ 카카오톡으로 로그인 실패: $error');
          if (error is PlatformException && error.code == 'CANCELED') {
            print('👤 사용자가 로그인 취소');
            return false;
          }
          token = await UserApi.instance.loginWithKakaoAccount();
          print('✅ 카카오계정으로 로그인 성공');
        }
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
        print('✅ 카카오계정으로 로그인 성공');
      }

      print('🪪 AccessToken: ${token.accessToken}');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', token.accessToken);

      final user = await UserApi.instance.me();
      print('👤 사용자 이름: ${user.kakaoAccount?.profile?.nickname}');

      // ✅ 백엔드에 카카오 access token 전송
      final backendSuccess =
          await BackendAuthService.authenticateWithKakaoToken(
            token.accessToken,
          );
      if (!backendSuccess) {
        print('❌ 백엔드 인증 실패');
        return false;
      }

      print('🔐 백엔드 인증 및 JWT 저장 완료');
      return true;
    } catch (e) {
      print('❌ 로그인 전체 실패: $e');
      return false;
    }
  }

  // 로그아웃
  static Future<void> logout() async {
    try {
      await UserApi.instance.logout();
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('accessToken');
      await prefs.remove('jwt'); // ✅ JWT도 제거
      print('🧼 로그아웃 완료 및 저장된 토큰 제거');
    } catch (e) {
      print('❌ 로그아웃 실패: $e');
    }
  }
}
