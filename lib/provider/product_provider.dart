import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/product.dart';
import 'package:http/http.dart' as http;

import '../repository/product_repository.dart';
part 'product_provider.g.dart';

@riverpod
Future<List<Product>> getProducts(GetProductsRef ref)async{
   return ProductRepository.getProducts();
}