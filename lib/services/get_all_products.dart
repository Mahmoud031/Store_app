import 'package:store_app/Helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProducts() async {
    //make the request
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productsList = []; //list to store products in it
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
