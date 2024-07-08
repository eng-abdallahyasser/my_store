import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/data/model/Product.dart';

class DetailesScreenController extends GetxController {
  int selectedColor = 0;
  Product product;
  int numberOfItems = 1;
  int selectedImage = 0;
  late List<Uint8List?> images;
  late List<bool> isImagesLoaded =
      List<bool>.filled(product.imagesUrl.length, false);
  bool isCoverImageLoaded = false;

  DetailesScreenController({required this.product});

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  void selectColorIndex(int selectedColorIndex) {
    selectedColor = selectedColorIndex;
    update();
  }

  void selectImageIndex(int selectedImageIndex) {
    selectedImage = selectedImageIndex;
    update();
  }

  void addOneItem() {
    numberOfItems++;
    update();
  }

  void removeOneItem() {
    if (numberOfItems > 1) {
      numberOfItems--;
      update();
    }
  }

  void onAddToFavouritesTap() {
    if (!favouriteProducts.contains(product)) {
      favouriteProducts.add(product);
    } else {
      favouriteProducts.remove(product);
    }
    update();
  }

  void fetchImages() async {
    // for (int index = 0; index < product.imagesUrl.length; index++) {
    //   try {
    //     images[index] = await Repo.getProductImageUrl(product.imagesUrl[index]);
    //     isImagesLoaded[index] = true;
    //   } catch (e) {
    //     isImagesLoaded[index] = false;
    //   }
    //   update();
    //   print("fetchImage $index done");
    // }
    images = await Future.wait(
        product.imagesUrl.map((url) => Repo.getProductImageUrl(url)).toList());
    isCoverImageLoaded = true;
    update();
  }
}
