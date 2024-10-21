import 'dart:convert';

import '../constants/config.dart';
import '../model/product.dart';
import 'package:http/http.dart' as http;

class ProductRepository{
  static Future<List<Product>> getProducts()async{
    final response = await http.get(Uri.parse('${Config.baseUrl}products'));
    if(response.statusCode == 200){
      final List<dynamic> decoded = jsonDecode(response.body);
      final List<Product> products = decoded.map((e) => Product.fromJson(e)).toList();
      return products;
    }
    else{
      throw Exception('Failed to load products');
    }
  }
}