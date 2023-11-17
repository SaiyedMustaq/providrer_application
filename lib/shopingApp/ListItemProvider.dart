// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider_application/constant/imageAsset.dart';

import 'card_model.dart';

class ItemViewModel extends ChangeNotifier {
  List<ProductModel> itemList = [
    ProductModel(id: 01, name: "", price: 100.0, url: ImageAsset.image1),
    ProductModel(id: 02, name: "", price: 150.0, url: ImageAsset.image2),
    // ProductModel(id: 03, name: "", price: 214.0, url: ImageAsset.image3),
    // ProductModel(id: 04, name: "", price: 145.0, url: ImageAsset.image4),
    // ProductModel(id: 05, name: "", price: 200.0, url: ImageAsset.image5),
    // ProductModel(id: 06, name: "", price: 325.0, url: ImageAsset.image6),
    // ProductModel(id: 07, name: "", price: 254.0, url: ImageAsset.image7),
    // ProductModel(id: 08, name: "", price: 487.0, url: ImageAsset.image8),
    // ProductModel(id: 09, name: "", price: 257.0, url: ImageAsset.image9),
    // ProductModel(id: 01, name: "", price: 654.0, url: ImageAsset.image10),
    // ProductModel(id: 11, name: "", price: 651.0, url: ImageAsset.image11),
    // ProductModel(id: 12, name: "", price: 358.0, url: ImageAsset.image12),
    // ProductModel(id: 13, name: "", price: 947.0, url: ImageAsset.image13),
    // ProductModel(id: 14, name: "", price: 278.0, url: ImageAsset.image14),
    // ProductModel(id: 15, name: "", price: 568.0, url: ImageAsset.image15),
    // ProductModel(id: 16, name: "", price: 485.0, url: ImageAsset.image16),
    // ProductModel(id: 17, name: "", price: 547.0, url: ImageAsset.image17),
    // ProductModel(id: 18, name: "", price: 874.0, url: ImageAsset.image18),
  ];
  List<ProductModel> cartList = [];
  List<ProductModel> favList = [];

  bool isLoading = true;
  bool cardIn = false;

  void loadinDisable() {
    Future.delayed(const Duration(seconds: 1), () {
      isLoading = false;
      notifyListeners();
    });
  }

  void upadteValue(index) {
    notifyListeners();
  }

  void addToCart(index) {
    itemList[index].isInCard = !itemList[index].isInCard;
    print("Card-->${itemList[index].isInCard}");
    notifyListeners();
    // if (itemList[index].isInCard) {
    //   cartList.add(ProductModel(
    //       id: itemList[index].id,
    //       name: itemList[index].name,
    //       price: itemList[index].price,
    //       url: itemList[index].url,
    //       isInCard: itemList[index].isInCard,
    //       isInFav: itemList[index].isInFav));
    // } else {
    //   cartList.remove(ProductModel(
    //       id: itemList[index].id,
    //       name: itemList[index].name,
    //       price: itemList[index].price,
    //       url: itemList[index].url,
    //       isInCard: itemList[index].isInCard,
    //       isInFav: itemList[index].isInFav));
    // }
  }

  void addToFav(index) {
    if (!itemList[index].isInCard) {
      favList.add(ProductModel(
          id: itemList[index].id,
          name: itemList[index].name,
          price: itemList[index].price,
          url: itemList[index].url,
          isInCard: itemList[index].isInCard,
          isInFav: itemList[index].isInFav));
    } else {
      favList.remove(ProductModel(
          id: itemList[index].id,
          name: itemList[index].name,
          price: itemList[index].price,
          url: itemList[index].url,
          isInCard: itemList[index].isInCard,
          isInFav: itemList[index].isInFav));
    }
    favList;
    itemList[index].isInFav = !itemList[index].isInFav;
    notifyListeners();
  }
}
