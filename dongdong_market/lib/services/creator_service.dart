// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String _baseUrl = 'http://112.168.254.204:8002'; // 서버 주소로 바꿔줘

  static Future<List<dynamic>?> fetchCreators() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt');

      if (token == null) {
        print('❌ JWT 토큰 없음');
        return null;
      }

      final response = await http.get(
        Uri.parse('$_baseUrl/creators'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        return json.decode(decodedBody);
      } else {
        print('❌ API 응답 실패: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('⚠️ 네트워크 오류: $e');
      return null;
    }
  }
}
