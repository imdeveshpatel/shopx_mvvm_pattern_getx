import 'package:shopx_mvvm_pattern/refrence/singleton_refrence.dart';
import 'package:shopx_mvvm_pattern/repository/product_repository.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ProductServices with ProductRepository {
  late List<Product> productModel;
  var url = 'https://fakestoreapi.com/products';
  @override
  Future<List<Product>> fetchProducts() async {
    try {
      var getStorage = SingletonClass().getstorage;
      var dbData = getStorage.read("productdatabox") ?? "noData";
      if (dbData != "noData") {
        productModel = productFromJson(dbData);
      } else {
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          productModel = productFromJson(response.body);
          await insertProductDb(productModel);

          return productModel;
        } else {
          return Future.error('List not Fetch');
        }
      }
    } catch (e) {
      return Future.error(e.toString());
    }
    return productModel;
  }

  @override
  Future insertProductDb(List<Product> model) async {
    var getStorage = SingletonClass().getstorage;
    // String modelToString = productToJson(model);
    return getStorage.write("productdatabox", model);
  }
}
