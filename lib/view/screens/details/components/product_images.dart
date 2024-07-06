import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_store/controller/detailes_screen_controller.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/data/model/Product.dart';

class ProductImages extends StatelessWidget {
  final Product product;
  final DetailesScreenController controller;

  const ProductImages(
      {super.key, required this.product, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailesScreenController>(
      builder: (controller) {
        return Column(
          children: [
            SizedBox(
              width: 238,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(product.images[controller.selectedImage]),
              ),
            ),
            // SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  product.images.length,
                  (index) => SmallProductImage(
                    isSelected: index == controller.selectedImage,
                    press: () {
                      controller.selectImageIndex(index);
                    },
                    image: product.images[index],
                  ),
                ),
              ],
            )
          ],
        );
      }
    );
  }
}

class SmallProductImage extends StatelessWidget {
  const SmallProductImage(
      {super.key,
      required this.isSelected,
      required this.press,
      required this.image});

  final bool isSelected;
  final VoidCallback press;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: MyColors.elsie.withOpacity(isSelected ? 1 : 0)),
        ),
        child: Image.asset(image),
      ),
    );
  }
}
