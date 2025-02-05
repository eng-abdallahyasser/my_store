// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/data/model/product.dart';
import 'package:my_store/view/global%20widget/product_card.dart';
import 'package:my_store/view/global%20widget/section_title.dart';

class ProductList extends StatelessWidget {
  final String title;
  const ProductList({
    super.key,
    this.title = "not titled",
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: title == "Popular Products"
            ? Repo.getPopularProducts()
            : Repo.getProductsByCategory(title),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error..."),
            );
          }
          if (snapshot.hasData) {
            var products = snapshot.data as List<Product>;
            if (products.isEmpty) {
              return const SizedBox.shrink();
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SectionTitle(
                    title: title,
                    press: () {},
                  ),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        products.length,
                        (index) {
                          if (title == "Popular Products") {
                            if (products[index].isPopular) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: ProductCard(
                                  product: products[index],
                                ),
                              );
                            }
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ProductCard(
                                product: products[index],
                              ),
                            );
                          }
                          return const SizedBox
                              .shrink(); // here by default width and height is 0
                        },
                      ),
                    )),
              ],
            );
          }
          return const SizedBox.shrink();
        });
  }
}
