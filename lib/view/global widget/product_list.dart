import 'package:flutter/material.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/data/model/Product.dart';
import 'package:my_store/view/global%20widget/product_card.dart';
import 'package:my_store/view/global%20widget/section_title.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

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
              FutureBuilder(
                future: demoProducts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error..."),
                    );
                  }
                  if (snapshot.hasData) {
                    var products = snapshot.data as List<Product>; // Ensure you cast the data to a list of products
                    return Row(
                      children: List.generate(
                        products.length,
                        (index) {
                          if (products[index].isPopular) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ProductCard(
                                product: products[index],
                              ),
                            );
                          }
                          return const SizedBox.shrink(); // here by default width and height is 0
                        },
                      ),
                    );
                  }
                  return const SizedBox.shrink(); // In case there's no data and no error
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
