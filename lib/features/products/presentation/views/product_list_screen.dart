import 'package:fakestore_test/core/styles/app_color.dart';
import 'package:fakestore_test/core/styles/app_text_styles.dart';
import 'package:fakestore_test/core/utils/capitalize_string.dart';
import 'package:fakestore_test/features/products/data/models/product_model.dart';
import 'package:fakestore_test/features/products/domain/entities/product.dart';
import 'package:fakestore_test/features/products/presentation/providers/product_provider.dart';
import 'package:fakestore_test/features/products/presentation/views/product_detail_screen.dart';
import 'package:fakestore_test/features/products/presentation/widgets/category_chip.dart';
import 'package:fakestore_test/features/products/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  static String id = "/product_list";
  const ProductListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  final TextEditingController searchController = TextEditingController();
  final List<Category?> categoryList = [null, ...Category.values];
  int selectedIndex = 0;
  bool isSearclicked = false;

  List<Product> _filterProducts(List<Product> products) {
    final Category? selectedCategory = categoryList[selectedIndex];
    final query = searchController.text.trim().toLowerCase();
    var result = products;

    if (selectedCategory != null) {
      result = result.where((p) => p.category == selectedCategory).toList();
    }

    if (query.isNotEmpty) {
      result = result.where((p) {
        final title = p.title.toLowerCase();
        final categoryName = (categoryValues.reverse[p.category] ?? '').toLowerCase();
        return title.contains(query) || categoryName.contains(query);
      }).toList();
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productListNotifierProvider);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        backgroundColor: AppColors.darkGrey,
        title: isSearclicked
            ? Container(
                padding: EdgeInsets.only(left: 12),
                height: 50,
                decoration: BoxDecoration(),
                child: TextField(
                  controller: searchController,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                    height: 1.5,
                    letterSpacing: 0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Padding(
                      padding: EdgeInsetsGeometry.only(left: 8),
                      child: Icon(Icons.search, size: 24),
                    ),
                    prefixIconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                      if (states.contains(WidgetState.focused)) {
                        return AppColors.darkGrey;
                      }
                      return AppColors.grey;
                    }),
                    fillColor: AppColors.white,
                    hintText: "Search ...",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                      height: 1.5,
                      letterSpacing: 0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.black, width: 2),
                    ),
                  ),
                  onSubmitted: (value) {
                    setState(() {});
                  },
                ),
              )
            : Text(
                "Fakestore.com",
                style: AppTextStyles.heading4(fontWeight: FontWeight.w700, color: AppColors.white),
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isSearclicked = !isSearclicked;
                  if (!isSearclicked) {
                    searchController.clear();
                  }
                });
              },
              icon: Icon(
                isSearclicked ? Icons.close : Icons.search,
                color: AppColors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: productsAsync.when(
        loading: () => Center(
          child: SizedBox(
            width: 70,
            height: 70,
            child: CircularProgressIndicator(color: AppColors.black),
          ),
        ),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Error: $err', textAlign: TextAlign.center),
          ),
        ),
        data: (products) {
          final filteredProducts = _filterProducts(products);
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 28),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: categoryList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: CategoryChip(
                          title: categoryList[index] == null
                              ? "All Items"
                              : CapitalizeString.capitalize(
                                  categoryValues.reverse[categoryList[index]] ?? "-",
                                ),
                          isSelected: selectedIndex == index,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Karena data yang diberikan fakestoreapi.com hanya 20 data dan tidak menerima parameter page, tidak memungkinkan menggunakan infinite scroll pagination
                filteredProducts.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('No product found', textAlign: TextAlign.center),
                      )
                    : MasonryGridView.count(
                        crossAxisCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        mainAxisSpacing: 16,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        crossAxisSpacing: 16,
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          final isShort = index % 4 == 0 || index % 4 == 3;
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(product: product),
                                ),
                              );
                            },
                            child: ProductCardWidget(isShort: isShort, product: product),
                          );
                        },
                      ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}
