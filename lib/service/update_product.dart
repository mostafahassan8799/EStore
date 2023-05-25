import 'package:estore/helper/ApiHelper.dart';
import 'package:estore/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required int id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    print("id = $id");
    Map<String, dynamic> data = await ApiHelper()
        .put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    });
    return ProductModel.fromJason(data);
  }
}
