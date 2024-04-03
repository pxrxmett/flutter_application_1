import 'package:flutter/material.dart';
import 'shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom FREAK',
      price: '236',
      imagePath: 'lib/images/ZoomFreak.png',
      description: 'The forward-thinking design of his latest signature shoe.',
    ),
    Shoe(
      name: 'Air Jordans',
      price: '220',
      imagePath: 'lib/images/AirJordan.png',
      description:
          'You\'ve got the hops and the speed—lace up in shoes that enhance what you bring to the court.',
    ),
    Shoe(
      name: 'KD Treys',
      price: '240',
      imagePath: 'lib/images/KDTREY.png',
      description:
          'A secure midfoot strap is suited for scoring binges and defensive stands, so that you can lock in and keep winning.',
    ),
    Shoe(
      name: 'Kyrie 6',
      price: '190',
      imagePath: 'lib/images/Kyrie.png',
      description:
          'Bouncy cushioning is paired with soft yet supportive foam for responsiveness and smooth heel-to-toe transitions.',
    ),
  ];

  // overall list of items in users cart
  List<Shoe> userCart = [];

  // get list of items for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
