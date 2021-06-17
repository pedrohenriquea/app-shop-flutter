import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  int numItems = 0;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void addItem(){
    numItems++;
    notifyListeners();
  }

  void removeItem(int quantity){
    numItems -= quantity;

    if(numItems < 0){
      numItems = 0;
    }

    notifyListeners();
  }

  int get numProductSendingCart{
    return numItems;
  }

  void setNumItems(int value){
    numItems = value;
  }


}
