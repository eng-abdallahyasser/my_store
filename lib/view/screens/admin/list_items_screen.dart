import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/data/model/product.dart';
import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/view/screens/admin/controller/list_itmes_controller.dart';
import 'package:my_store/view/screens/home/search_feild.dart';

class ListItemsScreen extends StatelessWidget {
  final ListItmesController controller = Get.put(ListItmesController());
  ListItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SearchField(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FutureBuilder(
                    future: controller.getAllProduct(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        return _productsGrid(snapshot.data!);
                      }
                      return const Text("no items yet");
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  GridView _productsGrid(List<Product> products) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 170,
        childAspectRatio: 0.7,
        mainAxisSpacing: 20,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => _productCard(context, products[index]),
    );
  }

  Widget _productCard(BuildContext context, Product product) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {},
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
                    future: Repo.getProductImageNumber(product.id, 0),
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
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 24,
                    decoration: BoxDecoration(
                      color: MyColors.elsie.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${product.favouritecount}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          colorFilter: const ColorFilter.mode(
                              Color(0xFFFF4848), BlendMode.srcIn),
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
