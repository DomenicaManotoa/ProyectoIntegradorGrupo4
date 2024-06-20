import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color? color;

  const MyButton({super.key,
  required this.onTap,
  required this.text,
  this.color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Center(
          child: Text(text,
          style: const TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          )
          ),
        ),
      ),
    );
  }
}