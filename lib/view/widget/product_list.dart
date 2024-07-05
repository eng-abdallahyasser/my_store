import 'package:flutter/material.dart';
import 'package:my_store/data/model/product.dart';
import 'package:my_store/view/widget/item_card.dart';
import 'package:my_store/view/widget/section_title.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SectionTitle(
        title: "Popular Products",
        press: () {},
      ),
    ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            demoProducts.length,
            (index) {
              if (demoProducts[index].isPopular) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ProductCard(
                    product: demoProducts[index],
                    onPress: () {},
                  ),
                );
              }
    
              return const SizedBox
                  .shrink(); // here by default width and height is 0
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
    )
          ],
        );
  }
}