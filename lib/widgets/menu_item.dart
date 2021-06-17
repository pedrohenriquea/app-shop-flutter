import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final Color color;

  MenuItem(this.title, this.color);

  void _selectMenu(BuildContext context) {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMenu(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.center,
        child: Text(title, style: Theme.of(context).textTheme.headline6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
