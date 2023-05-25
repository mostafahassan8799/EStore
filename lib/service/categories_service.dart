import 'package:estore/models/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helper/ApiHelper.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await ApiHelper()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJason(data[i]));
    }
    return productList;
  }
}
