import 'package:shopx_mvvm_pattern/model/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
  Future<void> insertProductDb(List<Product> model);
}
