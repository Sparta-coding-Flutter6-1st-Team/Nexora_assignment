import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  static const String _baseUrl = 'http://112.168.254.204:8002';

  static Future<List<dynamic>?> fetchProductsByCreator(String creatorId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt');

      final response = await http.get(
        Uri.parse('$_baseUrl/creators/$creatorId/products'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        final productjsonData = json.decode(decodedBody);
        print('📦 받아온 상품 리스트: $productjsonData'); // ✅ 여기!
        return productjsonData;
      } else {
        print('❌ 상품 API 실패: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('⚠️ 네트워크 오류: $e');
      return null;
    }
  }
}
