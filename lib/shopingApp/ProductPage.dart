// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_application/shopingApp/addToFavourit.dart';
import 'package:provider_application/shopingApp/card_model.dart';

import 'ListItemProvider.dart';
import 'addToCartIcon.dart';
import 'favPage.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ItemViewModel itemViewModel;
  @override
  void initState() {
    itemViewModel = Provider.of(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shop, color: Colors.black),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavouritePage()));
              },
              icon: const Icon(
                Icons.favorite_sharp,
                color: Colors.black,
              ))
        ],
      ),
      body: Consumer<ItemViewModel>(
        builder: (context, value, child) => ListView.builder(
          itemCount: itemViewModel.itemList.length,
          itemBuilder: (_, index) {
            print("Consumer Call");
            return Provider<ProductModel>.value(
              value: itemViewModel.itemList[index],
              child: CartView(onClick: () => itemViewModel.addToCart(index)),
            );
          },
        ),
      ),
      // body: Consumer<ListItemProvider>(
      //   builder: (context, provider, child) {
      //     return ListView.builder(
      //       shrinkWrap: true,
      //       itemCount: provider.itemList.length,
      //       itemBuilder: (context, index) {
      //         ProductModel singleModel = provider.itemList[index];
      //         return Stack(
      //           children: [
      //             Image.asset(singleModel.url.toString(),
      //                 height: 300, fit: BoxFit.cover),
      //             Positioned(
      //               bottom: 0.0,
      //               height: 60,
      //               left: 0.0,
      //               right: 0.0,
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                     color: Colors.black.withOpacity(0.7),
      //                     borderRadius: const BorderRadius.only(
      //                         topLeft: Radius.circular(20.0),
      //                         topRight: Radius.circular(20.0))),
      //                 height: 20,
      //                 child: Row(
      //                   children: [
      //                     const SizedBox(width: 50),
      //                     Text(
      //                       "Rs.${singleModel.price}",
      //                       style: const TextStyle(
      //                           color: Colors.white,
      //                           fontSize: 16.0,
      //                           fontWeight: FontWeight.bold,
      //                           fontStyle: FontStyle.italic),
      //                     ),
      //                     const Spacer(),
      //                     AddToCartIcon(
      //                       isInCart: !singleModel.isInCard,
      //                       onCardAdd: () {
      //                         provider.addToCart(index);
      //                       },
      //                     ),
      //                     AddToFavourite(
      //                       isInCart: !singleModel.isInFav,
      //                       onFavAdd: () {
      //                         provider.addToFav(index);
      //                       },
      //                     ),
      //                     const SizedBox(width: 20)
      //                   ],
      //                 ),
      //               ),
      //             )
      //           ],
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}

class CartView extends StatelessWidget {
  CartView({Key? key, required this.onClick});
  Function onClick;

  @override
  Widget build(BuildContext context) {
    print("Consumer Call Item Call");
    final _item = Provider.of<ProductModel>(context);
    return ListTile(
      trailing: IconButton(
          onPressed: () => onClick(),
          icon: _item.isInCard
              ? const Icon(Icons.shopping_bag)
              : const Icon(Icons.shop_outlined)),
    );
  }
}
