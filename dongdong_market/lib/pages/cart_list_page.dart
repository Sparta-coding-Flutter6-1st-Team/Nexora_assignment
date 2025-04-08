import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import '../models/cart_item.dart';
import '../widgets/main_layout.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CartItem> items = CartService.cartItems;

    return MainLayout(
      currentIndex: 1,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/author_list_page');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/cart');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/payment');
        }
      },
      child: Column(
        children: [
          Expanded(
            child:
                items.isEmpty
                    ? const Center(child: Text('장바구니가 비었습니다.'))
                    : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return ListTile(
                          leading: Image.network(
                            item.imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.image_not_supported,
                                size: 48,
                                color: Colors.grey,
                              );
                            },
                          ),
                          title: Text(item.name),
                          subtitle: Text(
                            '수량: ${item.quantity}개 / ${item.price}원',
                          ),
                          trailing: Text('합계: ${item.quantity * item.price}원'),
                        );
                      },
                    ),
          ),
          if (items.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        CartService.clearCart();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('🧹 장바구니를 비웠습니다!')),
                        );
                        Navigator.pushReplacementNamed(context, '/cart');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                      ),
                      child: const Text('장바구니 초기화'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/payment');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          253,
                          253,
                          253,
                        ),
                      ),
                      child: const Text('결제하기'),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
