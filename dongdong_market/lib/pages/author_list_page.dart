import 'package:dongdong_market/models/models.dart';
import 'package:dongdong_market/models/creator.dart';
import 'package:flutter/material.dart';
import '../widgets/main_layout.dart';
import '../services/creator_service.dart';
import '../widgets/creator_banner.dart'; // 배너 위젯 추가

class AuthorListPage extends StatefulWidget {
  const AuthorListPage({super.key});

  @override
  State<AuthorListPage> createState() => _AuthorListPageState();
}

class _AuthorListPageState extends State<AuthorListPage> {
  List<Creator> _creators = [];

  @override
  void initState() {
    super.initState();
    fetchCreatorList();
  }

  Future<void> fetchCreatorList() async {
    final creatorsJson = await ApiService.fetchCreators();
    if (creatorsJson != null) {
      print("✅ 작가 리스트 받아옴: $creatorsJson");
      setState(() {
        _creators =
            creatorsJson
                .map<Creator>((json) => Creator.fromJson(json))
                .toList();
      });
    } else {
      print("❌ 작가 리스트 요청 실패");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      backgroundColor: const Color(0xFFF9DEB4),
      currentIndex: 0,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/author_list_page');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/cart');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/payment');
        }
      },
      child: Container(
        color: AppColors.Page,
        child: Column(
          children: [
            // 검색바
            Center(
              child: Container(
                width: 902,
                height: 82,
                color: AppColors.SearchBar,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '찾고자 하는 이를 써보시오',
                    suffixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: AppColors.SearchBarfill,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 22),
                  ),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),

            // 배너 이미지
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Image.asset(
                'assets/benner.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // 🧑‍🎨 작가 리스트
            Expanded(
              child:
                  _creators.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        itemCount: _creators.length,
                        itemBuilder: (context, index) {
                          final creator = _creators[index];
                          final isEven = index % 2 == 0;
                          return CreatorBanner(
                            creator: creator,
                            backgroundColor: Color(
                              isEven ? 0xFF4A6B6F : 0xFFD9A5A3,
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
