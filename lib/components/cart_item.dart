// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({
    super.key,
    required this.shoe,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart
  void removeItemFromCart() {
    // remove it!
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);

    // alert the user, shoe successfully removed item
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text(
          'Removed from your cart!',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        content: const Text(
          '',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          widget.shoe.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('\$${widget.shoe.price}'),
        leading: Image.asset(widget.shoe.imagePath),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => removeItemFromCart(),
        ),
      ),
    );
  }
}
