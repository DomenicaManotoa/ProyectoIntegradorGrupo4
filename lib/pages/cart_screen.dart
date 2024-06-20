// screens/cart_screen.dart

import 'package:flutter/material.dart';
import 'package:lbp/services/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compra'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            leading: Image.asset(item.productImage),
            title: Text(item.productName),
            subtitle: Text('\$${item.price.toStringAsFixed(2)} x ${item.quantity}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                cart.removeItem(item);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${cart.getTotal().toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implementa la navegación para proceder al pago u otra acción
                },
                child: const Text('Proceder al Pago'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


