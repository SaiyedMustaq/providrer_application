import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_application/shopingApp/ListItemProvider.dart';

import 'bottomNav/bottom_nav.dart';
import 'bottomNav/bottom_navigation_bar_provider.dart';
import 'shopingApp/ProductPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemViewModel()),
        ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ProductPage(),
        //home: const BottomNavPage()
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
