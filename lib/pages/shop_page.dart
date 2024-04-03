import 'package:modernlogintute/components/message_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user, shoe successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text(
          'Successfully added!',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        content: const Text(
          'Check your cart',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          // message
          MessageTile(),

          // hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Hot Picks 🔥",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(color: Color.fromARGB(255, 133, 128, 171)),
                )
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(bottom: 25),
              itemCount: value.getShoeList().length,
              itemBuilder: (context, index) {
                // get the individual shoe from shop
                Shoe individualShoe = value.getShoeList()[index];

                // create shoe tile with shoe
                return ShoeTile(
                  imagePath: individualShoe.imagePath,
                  shoeName: individualShoe.name,
                  price: individualShoe.price,
                  description: individualShoe.description,
                  onTap: () => addShoeToCart(individualShoe),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              color: Colors.white,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
