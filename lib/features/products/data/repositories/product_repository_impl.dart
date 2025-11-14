
import 'package:fakestore_test/features/products/data/datasources/product_remote_data_source.dart';
import 'package:fakestore_test/features/products/data/models/product_model.dart';
import 'package:fakestore_test/features/products/domain/entities/product.dart';
import 'package:fakestore_test/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remote;

  ProductRepositoryImpl(this._remote);

  @override
  Future<List<Product>> getProducts() async {
    final List<ProductModel> models = await _remote.getProducts();
    return models.map((m) => Product.fromModel(m)).toList();
  }
}
