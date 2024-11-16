import 'package:store_app/Helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCatgoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url:'https://fakestoreapi.com/products/category/$categoryName');
  
    List<ProductModel> productsList = []; //list to store products in it
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
