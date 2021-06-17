import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/tab_app.dart';
import 'package:shop/widgets/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ProductGrid(Provider.of<TabApp>(context).isOnlyFavorites),
    );
  }
}
