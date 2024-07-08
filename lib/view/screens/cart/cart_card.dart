import 'package:flutter/material.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/data/model/cart_item.dart';
import 'package:my_store/view/global%20widget/rounded_icon_btn.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.cart,
    required this.add,
    required this.remove,
  });

  final CartItem cart;
  final Function() add;
  final Function() remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.imagesUrl[0]),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: "\$${cart.product.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: MyColors.elsie),
                children: [
                  TextSpan(
                      text: "  x${cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            )
          ],
        ),
        const Spacer(),
        Column(children: [
          RoundedIconBtn(icon: Icons.add, press: add),
          const SizedBox(height: 4),
          RoundedIconBtn(icon: Icons.remove, press: remove),
        ])
      ],
    );
  }
}
