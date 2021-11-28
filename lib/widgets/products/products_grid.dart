import 'package:flutter/material.dart';
import 'package:pos/models/products_model.dart';
import 'package:pos/widgets/products/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> listProduct;

  const ProductGrid( {Key? key, required this.listProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context);
    // final products = showFavs? productsData.favoriteItems : productsData.items;
    // final products = productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: listProduct.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value( //.value
        // create: (ctx) => products[i],
        value: listProduct[i],
        // child: Text('ini produk'),
        child: ProductItem(product: 
          listProduct[i]
        ),
      ),
    );
  }
}