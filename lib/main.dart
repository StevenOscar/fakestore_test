import 'package:fakestore_test/core/constants/app_routes.dart';
import 'package:fakestore_test/core/constants/assets_fonts.dart';
import 'package:fakestore_test/features/products/presentation/views/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fakestore test',
      routes: AppRoutes.routes,
      theme: ThemeData(
        textTheme: TextTheme(),
        fontFamily: AssetsFonts.encodeSans,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: ProductListScreen.id,
    );
  }
}
