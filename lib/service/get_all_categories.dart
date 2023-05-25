import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helper/ApiHelper.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await ApiHelper()
        .get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
