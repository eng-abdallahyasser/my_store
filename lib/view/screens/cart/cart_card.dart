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
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: cart.product == null
                    ? Container()
                    : cart.product!.isInitialezed
                        ? Image.memory(cart.product!.coverImageUnit8List!,
                            fit: BoxFit.cover)
                        : FutureBuilder(
                            future:  cart.product!.initializeCoverImage(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError || snapshot.data == null) {
                                return Image.asset(
                                    "assete/images/product_placeholder.jpg",
                                    fit: BoxFit.cover);
                              }
                              return Image.memory(snapshot.data!.coverImageUnit8List!,
                                  fit: BoxFit.cover);
                            }),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product!.title,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 6),
            Text(
              cart.product!.optionDescription(),
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Text(
                  "ج.م",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: MyColors.elsie),
                ),
                Text(
                  " ${cart.product!.calculateTotalCost()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: MyColors.elsie),
                ),
                Text("  x${cart.numOfItem}",
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ],
        ),
        const Spacer(),
        Column(children: [
          RoundedIconBtn(icon: Icons.add, press: add),
          const SizedBox(height: 4),
          cart.numOfItem > 1
              ? RoundedIconBtn(icon: Icons.remove, press: remove)
              : RoundedIconBtn(icon: Icons.delete_forever, press: remove),
        ])
      ],
    );
  }
}
