
import 'package:fakestore_test/features/products/domain/entities/product.dart';
import 'package:fakestore_test/features/products/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call() {
    return repository.getProducts();
  }
}
