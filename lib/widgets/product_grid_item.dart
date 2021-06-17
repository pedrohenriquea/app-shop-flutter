import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/utils/app_routes.dart';

import 'badge.dart';

class ProductGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context);
    final Cart cart = Provider.of<Cart>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            child: Text('Nunca muda'),
            builder: (ctx, product, child) => IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toggleFavorite();
              },
              color: Colors.white,
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
          trailing: Badge(
            value: product.numProductSendingCart.toString(),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Produto adicionado com sucesso!'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                      label: 'DESFAZER',
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                        product.removeItem(1);
                      }),
                ));
                product.addItem();
                cart.addItem(product);
              },
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
