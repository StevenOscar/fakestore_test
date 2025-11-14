import 'package:fakestore_test/core/styles/app_color.dart';
import 'package:fakestore_test/core/styles/app_text_styles.dart';
import 'package:fakestore_test/core/utils/capitalize_string.dart';
import 'package:fakestore_test/features/products/data/models/product_model.dart';
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
  final List<Category> categoryList = Category.values;
  int selectedIndex = 0;
  bool isSearclicked = false;

  @override
  Widget build(BuildContext context) {
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
                  onChanged: (value) {},
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 28),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: categoryList.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: CategoryChip(
                      title: CapitalizeString.capitalize(
                        categoryValues.reverse[categoryList[index]] ?? "-",
                      ),
                      isSelected: selectedIndex == index,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Karena data yang diberikan fakestoreapi.com hanya 20 data dan tidak menerima parameter page, tidak memungkinkan menggunakan infinite scroll pagination
            MasonryGridView.count(
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              mainAxisSpacing: 16,
              padding: EdgeInsets.symmetric(horizontal: 12),
              crossAxisSpacing: 16,
              itemCount: 10,
              itemBuilder: (context, index) {
                final isShort = index % 4 == 0 || index % 4 == 3;
                return ProductCardWidget(
                  isShort: isShort,
                  product: ProductModel(
                    image: "https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_t.png",
                    price: 29.95,
                    rating: Rating(count: 340, rate: 2.9),
                    category: Category.WOMEN_S_CLOTHING,
                    title: "Lock and Love Women's Removable Hooded Faux Leather Moto Biker Jacket",
                  ),
                );
              },
            ),
            // untuk free space ketika scroll sudah habis
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
