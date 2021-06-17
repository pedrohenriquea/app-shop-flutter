import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/widgets/product_item.dart';
import '../widgets/app_drawer.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final productItems = productsData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerencia Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.itemsCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              ProductItem(productItems[i]),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
