import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/data/model/Product.dart';
import 'package:my_store/view/screens/details/details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  });

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: () {
          Get.to(() => DetailsScreen(product: product));
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
                    future: product.initializeCoverImage(),
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
                              image: MemoryImage(snapshot.data!.coverImageUnit8List!),
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
              product.title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: MyColors.elsie,
                  ),
                ),
                LoveCountBtn(count: product.favouritecount, isFavourite: true)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LoveCountBtn extends StatefulWidget {
  const LoveCountBtn(
      {super.key, required this.count, required this.isFavourite});
  final int count;
  final bool isFavourite;

  @override
  State<LoveCountBtn> createState() => _LoveCountBtnState();
}

class _LoveCountBtnState extends State<LoveCountBtn> {
  int count = 12;
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    count = widget.count;
    isFavourite = widget.isFavourite;
  }

  void _onTabe() async {
    isFavourite = !isFavourite;
    if (isFavourite) {
      count = count + 1;
    } else {
      count = count - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTabe();
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        height: 24,
        decoration: BoxDecoration(
          color: isFavourite // favouriteProducts.contains(widget.product)
              ? MyColors.elsie.withOpacity(0.2)
              : MyColors.matteCharcoal.withOpacity(0.07),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${count} ",
              style: const TextStyle(fontSize: 12),
            ),
            SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              colorFilter: ColorFilter.mode(
                  isFavourite // favouriteProducts.contains(widget.product)
                      ? const Color(0xFFFF4848)
                      : MyColors.elsieLite,
                  BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
