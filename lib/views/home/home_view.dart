import 'package:ecommerce/views/home/account_view.dart';
import 'package:ecommerce/views/home/cart_view.dart';
import 'package:ecommerce/views/home/explore_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> bodyList = [ExploreView(), CartView(), AccountView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("assets/explore_icon.png"),
                activeIcon: Image.asset("assets/explore.png"),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset("assets/cart_icon.png"),
                activeIcon: Image.asset("assets/cart.png"),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Image.asset("assets/account_icon.png"),
                activeIcon: Image.asset("assets/account.png"),
                label: "Account"),
          ]),
    );
  }
}
