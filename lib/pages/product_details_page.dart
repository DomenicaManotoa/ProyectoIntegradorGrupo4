// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:lbp/components/cart.dart';
import 'package:lbp/model/cart_item.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productName;
  final String productImage;
  final double productPrice;

  ProductDetailsPage({
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              productImage,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Precio: \$${productPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Agregar lógica para agregar al carrito
                cart.addItem(
                  CartItem(
                    productName: productName,
                    quantity: 1, // Puedes ajustar la cantidad como necesites
                    price: productPrice, // Usar directamente productPrice
                    image: productImage, productImage: '', // Usar la imagen del producto
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Producto agregado al carrito'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Agregar al Carrito'),
            ),
          ],
        ),
      ),
    );
  }
}


