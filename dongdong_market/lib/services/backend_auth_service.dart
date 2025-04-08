import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BackendAuthService {
  static const String backendUrl =
      'http://112.168.254.204:8000/login/kakao'; // ← 주소 수정 필요!

  static Future<bool> authenticateWithKakaoToken(String accessToken) async {
    try {
      final response = await http.post(
        Uri.parse(backendUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'access_token': accessToken}),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final jwt = responseBody['jwt']; // 백엔드가 jwt로 응답한다고 가정

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt', jwt);

        print('✅ JWT 저장 완료');
        return true;
      } else {
        print('❌ 백엔드 응답 실패: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('❌ 백엔드 요청 에러: $e');
      return false;
    }
  }
}
