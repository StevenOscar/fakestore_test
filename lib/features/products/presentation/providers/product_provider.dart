import 'package:dio/dio.dart';
import 'package:fakestore_test/core/env/env.dart';
import 'package:fakestore_test/features/products/data/datasources/product_remote_data_source.dart';
import 'package:fakestore_test/features/products/data/repositories/product_repository_impl.dart';
import 'package:fakestore_test/features/products/domain/entities/product.dart';
import 'package:fakestore_test/features/products/domain/repositories/product_repository.dart';
import 'package:fakestore_test/features/products/domain/usecases/get_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productListNotifierProvider = AsyncNotifierProvider<ProductListNotifier, List<Product>>(
  () => ProductListNotifier(),
);

final Dio _dio = Dio(
  BaseOptions(
    baseUrl: Env.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ),
);

final ProductRemoteDataSource _remoteDataSource = ProductRemoteDataSourceImpl(_dio);
final ProductRepository _productRepository = ProductRepositoryImpl(_remoteDataSource);
final GetProducts _getProductsUsecase = GetProducts(_productRepository);

class ProductListNotifier extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    return _getProductsUsecase();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getProductsUsecase());
  }
}
