import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/category_tag.dart';
import '../services/category_service.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final Set<String> _selectedCategories = {};
  final List<String> categories = ['활성화', '비활성화', '운동', '요리', '게임', '음악'];
  bool _isLoading = false;

  void _submitCategories() async {
    if (_selectedCategories.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('최소 한 개의 카테고리를 선택해주세요.')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final success = await CategoryService.sendSelectedCategories(
      _selectedCategories.toList(),
    );

    setState(() {
      _isLoading = false;
    });

    if (success) {
      Navigator.pushNamed(context, '/list'); // 홈 화면 또는 다음 페이지 라우트로 이동
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('카테고리 전송 실패! 다시 시도해주세요.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7E4D0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5DFC4),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
              color: Colors.brown[700],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  '관심 카테고리',
                  style: GoogleFonts.notoSansKr(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3E2723),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    '내 관심사를 프로필에 추가하여\n관심있는 대화를 시작할 수 있어요',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSansKr(
                      fontSize: 16,
                      color: const Color(0xFF5D4037),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children:
                      categories.map((category) {
                        final isSelected = _selectedCategories.contains(
                          category,
                        );
                        return CategoryTag(
                          label: category,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _selectedCategories.remove(category);
                              } else {
                                _selectedCategories.add(category);
                              }
                            });
                          },
                        );
                      }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitCategories,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD6B69E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child:
                      _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                            '계속하기',
                            style: GoogleFonts.notoSansKr(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
