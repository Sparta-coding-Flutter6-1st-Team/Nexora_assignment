import 'package:dongdong_market/models/cart_item.dart';

class CartService {
  static final List<CartItem> _cartItems = [];

  static List<CartItem> get cartItems => _cartItems;

  static void addToCart(CartItem item) {
    final index = _cartItems.indexWhere((e) => e.id == item.name);
    if (index != -1) {
      _cartItems[index].quantity += item.quantity;
    } else {
      _cartItems.add(item);
    }
  }

  static void removeFromCart(String id) {
    _cartItems.removeWhere((e) => e.id == id);
  }

  static void clearCart() {
    _cartItems.clear();
  }
}
