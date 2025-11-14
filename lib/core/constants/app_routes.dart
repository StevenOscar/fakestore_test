import 'package:fakestore_test/features/products/presentation/views/product_list_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    ProductListScreen.id: (context) => ProductListScreen(),
  };
}
