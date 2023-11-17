// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ListItemProvider.dart';
import 'card_model.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ItemViewModel>(
        builder: (context, itemProvider, child) => ListView.builder(
          itemCount: itemProvider.favList.length,
          itemBuilder: (context, index) {
            ProductModel favModel = itemProvider.favList[index];
            return Container(
              margin: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 10, left: 20),
              height: 100,
              child: Row(
                children: [
                  Image.asset(
                    favModel.url!,
                    height: 100,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${favModel.name}"),
                      Text(
                        "${favModel.price}",
                        style: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.favorite))
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
