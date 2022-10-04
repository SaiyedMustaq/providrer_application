import 'package:flutter/material.dart';

class AddToCartIcon extends StatelessWidget {
  AddToCartIcon({Key? key, required this.isInCart, required this.onCardAdd})
      : super(key: key);
  bool isInCart = false;
  Function onCardAdd;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isInCart
          ? const Icon(Icons.shopping_cart_outlined)
          : const Icon(Icons.shopping_cart_sharp),
      color: Colors.white,
      onPressed: () => onCardAdd(),
    );
  }
}
