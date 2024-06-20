// model/cart_item.dart

class CartItem {
  final String productName;
  final String productImage;
  final double price;
  int quantity;

  CartItem({
    required this.productName,
    required this.productImage,
    required this.price,
    this.quantity = 1, required String image, // Inicializado con una cantidad predeterminada de 1
  });
}

