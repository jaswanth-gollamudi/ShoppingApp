import 'package:flutter/material.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';
class ProductGrid extends StatelessWidget {
  final bool showFavs;

  ProductGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
   final productsData= Provider.of<Products>(context);
   final products = showFavs? productsData.favoriteItems: productsData.items;

    return GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem( ),
        ));
  }
}