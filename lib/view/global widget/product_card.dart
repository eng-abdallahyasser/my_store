import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/data/model/Product.dart';
import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/view/screens/details/details_screen.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  });

  final double width, aspectRetio;
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: GestureDetector(
        onTap: () {
          Get.to(() => DetailsScreen(product: widget.product));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.matteCharcoal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: FutureBuilder(
                    future: Repo.getProductImageNumber(widget.product.id, 0),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/product_placeholder.jpg",
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(snapshot.data!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${widget.product.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: MyColors.elsie,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    if (!favouriteProducts.contains(widget.product)) {
                      favouriteProducts.add(widget.product);
                    } else {
                      favouriteProducts.remove(widget.product);
                    }
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 24,
                    decoration: BoxDecoration(
                      color: favouriteProducts.contains(widget.product)
                          ? MyColors.elsie.withOpacity(0.15)
                          : MyColors.matteCharcoal.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.product.favouritecount}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          colorFilter: ColorFilter.mode(
                              favouriteProducts.contains(widget.product)
                                  ? const Color(0xFFFF4848)
                                  : MyColors.elsieLite.withOpacity(0.5),
                              BlendMode.srcIn),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
