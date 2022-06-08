import 'package:get/get.dart';
import 'package:shopx_mvvm_pattern/model/product_model.dart';
import 'package:shopx_mvvm_pattern/repository/product_services.dart';

class Productcontroller extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() {
    isLoading(true);
    ProductServices().fetchProducts().then((value) {
      productList.addAll(value);
      Future.delayed(
        const Duration(seconds: 1),
        () {
          isLoading(false);
        },
      );
    });
  }
}
