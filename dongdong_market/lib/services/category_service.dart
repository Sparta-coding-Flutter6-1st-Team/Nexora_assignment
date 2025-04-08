import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CategoryService {
  static Future<bool> sendSelectedCategories(List<String> categories) async {
    const String url =
        'http://112.168.254.204:8002/categories'; // 여기에 실제 API 주소

    try {
      final prefs = await SharedPreferences.getInstance();
      final jwt = prefs.getString('jwt');

      if (jwt == null) {
        print('JWT 토큰 없음');
        return false;
      }

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $jwt',
        },
        body: jsonEncode({'categories': categories}),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('서버 오류: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('요청 실패: $e');
      return false;
    }
  }
}
