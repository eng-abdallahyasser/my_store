import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/data/model/product.dart';
import 'package:my_store/data/model/cart_item.dart';

class DetailesScreenController extends GetxController {
  int selectedColor = 0;
  Product product;
  int numberOfItems = 1;
  int selectedImage = 0;
  List<Uint8List?> images = [];
  List<bool> isImagesLoaded = [false, false, false, false, false];
  bool isCoverImageLoaded = false;
  int favouriteCount = 0;

  DetailesScreenController({required this.product, this.favouriteCount = 0});

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
    if (!Repo.favouriteProducts.contains(product.id)) {
      Repo.favouriteProducts.add(product.id);
      favouriteCount++;
      Repo.addToFavorites(product.id);
    } else {
      favouriteCount--;
      Repo.favouriteProducts.remove(product.id);
      Repo.removeFromFavorites(product.id);
    }
    update();
  }

  Future<void> fetchImages() async {
    // for (int index = 0; index < product.imagesUrl.length; index++) {
    //   try {
    //     images[index] = await Repo.getProductImageUrl(product.imagesUrl[index]);

    //     isImagesLoaded[index] = true;

    //     update();
    //     print("fetchImage $index done");
    //   } catch (e) {
    //     isImagesLoaded[index] = false;
    //     print("error ${e.toString()} ");
    //   }
    // }
    images = await Future.wait(
        product.imagesUrl.map((url) => Repo.getProductImageUrl(url)).toList());
    isCoverImageLoaded = true;
    update();
  }

  void addToCart() {
    Repo.demoCarts.add(CartItem(numOfItem: numberOfItems, product: product));
  }
}
