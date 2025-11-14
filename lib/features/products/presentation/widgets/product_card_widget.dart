import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore_test/core/styles/app_color.dart';
import 'package:fakestore_test/core/styles/app_text_styles.dart';
import 'package:fakestore_test/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatefulWidget {
  final Product product;
  final bool isShort;

  const ProductCardWidget({super.key, required this.product, required this.isShort});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Container(
                color: AppColors.lightGrey,
                child: CachedNetworkImage(
                  height: widget.isShort ? 200 : 250,
                  width: double.infinity,
                  imageUrl: product.image,
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.image_not_supported, size: 50)),
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: AppTextStyles.body4(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      height: 1.45,
                      letterSpacing: 0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: AppTextStyles.body3(
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                          height: 1.5,
                          letterSpacing: 0,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          SizedBox(width: 2),
                          Text(
                            "${product.rating} (${product.ratingCount})",
                            style: AppTextStyles.body4(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              height: 1.5,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
