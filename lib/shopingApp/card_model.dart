class ProductModel {
  int? id;
  String? name;
  String? url;
  double? price;
  bool isInCard;
  bool isInFav;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.url,
    this.isInCard = false,
    this.isInFav = false,
  });
}
