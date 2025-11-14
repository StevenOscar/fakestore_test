import '../../data/models/product_model.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final Category category;
  final String image;
  final double rating;
  final int ratingCount;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.ratingCount,
  });

  factory Product.fromModel(ProductModel model) {
    return Product(
      id: model.id ?? 0,
      title: model.title ?? 'No title',
      price: model.price ?? 0,
      description: model.description ?? '',
      category: model.category ?? Category.ELECTRONICS,
      image: model.image ?? '',
      rating: model.rating?.rate ?? 0,
      ratingCount: model.rating?.count ?? 0,
    );
  }
}
