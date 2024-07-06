import 'package:get/get.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/data/model/Product.dart';

class DetailesScreenController extends GetxController {
  int selectedColor = 0;
  Product product;
  int numberOfItems = 1;
  int selectedImage = 0;

  DetailesScreenController({required this.product});

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
}
