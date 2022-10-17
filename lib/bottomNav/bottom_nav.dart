import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_bar_provider.dart';
import 'favourite_sceern.dart';
import 'home_screen.dart';
import 'inbox_screen.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int selectedPage = 0;

  final _pageOptions = const [HomeScreen(), InboxScreen(), FavouriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<BottomNavigationBarProvider>(
          builder: (context, value, child) {
            if (value.selectedIndex == 0) {
              return const HomeScreen();
            }
            if (value.selectedIndex == 1) {
              return const InboxScreen();
            }
            return const FavouriteScreen();
          },
        ),
        bottomNavigationBar: Consumer<BottomNavigationBarProvider>(
          builder: (context, bottomNavProvider, child) => BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mail, size: 30),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, size: 30),
                label: 'Account',
              ),
            ],
            selectedItemColor: Colors.green,
            elevation: 5.0,
            unselectedItemColor: Colors.green[900],
            currentIndex: bottomNavProvider.selectedIndex,
            backgroundColor: Colors.white,
            onTap: (index) {
              bottomNavProvider.currentIndex = index;
            },
          ),
        ));
  }
}
