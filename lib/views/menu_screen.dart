import 'package:flutter/material.dart';
import 'package:shop/widgets/menu_item.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        MenuItem('Cultura', Theme.of(context).primaryColor),
        MenuItem('Cultivo', Theme.of(context).primaryColor),
        MenuItem('Lote', Theme.of(context).primaryColor),
        MenuItem('Meus Lotes', Theme.of(context).primaryColor)
      ],
    );
  }
}
