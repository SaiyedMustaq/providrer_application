import 'package:flutter/material.dart';

class AddToFavourite extends StatelessWidget {
  AddToFavourite({Key? key, required this.isInCart, required this.onFavAdd})
      : super(key: key);
  bool isInCart = false;
  Function onFavAdd;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isInCart
          ? const Icon(Icons.favorite_border)
          : const Icon(Icons.favorite_sharp),
      color: isInCart ? Colors.white : Colors.red,
      onPressed: () => onFavAdd(),
    );
  }
}
