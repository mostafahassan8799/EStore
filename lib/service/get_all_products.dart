import 'dart:convert';
import 'package:estore/helper/ApiHelper.dart';
import 'package:estore/models/product_model.dart';
import 'package:http/http.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await ApiHelper().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJason(data[i]));
    }
    return productList;
  }
}
