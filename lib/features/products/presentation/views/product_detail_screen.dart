import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore_test/core/styles/app_color.dart';
import 'package:fakestore_test/core/styles/app_text_styles.dart';
import 'package:fakestore_test/core/utils/capitalize_string.dart';
import 'package:fakestore_test/features/products/data/models/product_model.dart';
import 'package:fakestore_test/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String id = '/product_detail';
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final categoryName = CapitalizeString.capitalize(
      categoryValues.reverse[product.category] ?? '-',
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.darkGrey,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Product Detail',
          style: AppTextStyles.heading4(fontWeight: FontWeight.w600, color: AppColors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  height: 260,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => SizedBox(
                    height: 200,
                    child: Center(
                      child: Icon(Icons.image_not_supported, size: 60, color: AppColors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Chip(
              label: Text(
                categoryName,
                style: AppTextStyles.body5(fontWeight: FontWeight.w500, color: AppColors.white),
              ),
              backgroundColor: AppColors.darkGrey,
            ),
            const SizedBox(height: 12),
            Text(
              product.title,
              style: AppTextStyles.heading3(
                fontWeight: FontWeight.w700,
                color: AppColors.black,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: AppTextStyles.heading3(
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(width: 24),
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  product.rating.toStringAsFixed(1),
                  style: AppTextStyles.body4(fontWeight: FontWeight.w600, color: AppColors.black),
                ),
                const SizedBox(width: 4),
                Text(
                  '(${product.ratingCount} reviews)',
                  style: AppTextStyles.body4(fontWeight: FontWeight.w400, color: AppColors.grey),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: AppColors.grey.withValues(alpha: 0.3), thickness: 1),
            const SizedBox(height: 8),
            Text(
              'Description',
              style: AppTextStyles.heading4(fontWeight: FontWeight.w600, color: AppColors.black),
            ),
            const SizedBox(height: 4),
            Text(
              product.description,
              style: AppTextStyles.body3(
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Product ID: ${product.id}',
              style: AppTextStyles.body5(fontWeight: FontWeight.w400, color: AppColors.darkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
