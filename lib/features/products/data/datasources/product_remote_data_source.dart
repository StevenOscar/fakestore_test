import 'package:dio/dio.dart';
import 'package:fakestore_test/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSourceImpl(this._dio);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      print(_dio.options.baseUrl);
      final response = await _dio.get('/products');
      final data = response.data as List;
      return data.map((e) => ProductModel.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
