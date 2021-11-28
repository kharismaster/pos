import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos/models/products_model.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem(
  //     {Key? key, required this.id, required this.title, required this.imageUrl})
  //     : super(key: key);

  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context)
            //     .pushNamed('/product-detail', arguments: product.id);
          },

          // PRODUCT IMAGE
          /* child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ), */
          child: CachedNetworkImage(imageUrl: product.imageUrl, fit: BoxFit.cover,),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,

          // FAVORITE ICON
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              onPressed: () {
                // product.toogleFavoriteStatus();
              },
              icon: const Icon(
                // product.isFavorite ? Icons.favorite : Icons.favorite_border,
                Icons.favorite,
              ),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // PRODUCT TITLE
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),

          // CART ICON
          trailing: IconButton(
            onPressed: () {
              // cart.addItem(product.id, product.price, product.title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} Added to cart!',
                      textAlign: TextAlign.center),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // cart.removeSingleItem(product.id);
                    },
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}