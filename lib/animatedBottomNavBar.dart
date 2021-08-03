import 'package:flutter/material.dart';
import 'package:flutter_widgets/animatedBarItem.dart';

import 'barItem.dart';

class AnimatedBottomNavBar extends StatefulWidget {
  AnimatedBottomNavBar({Key? key}) : super(key: key);

  final List<BarItem> _barItems = [
    BarItem(
        label: "Home", icon: Icons.home_outlined, text: "This is Home Screen"),
    BarItem(
        label: "Favourite",
        icon: Icons.favorite_outline,
        text: "This is Favourite Screen"),
    BarItem(
        label: "Edit", icon: Icons.edit_outlined, text: "This is Edit Screen"),
    BarItem(
        label: "Settings",
        icon: Icons.settings_outlined,
        text: "This is Settings Screen"),
  ];

  @override
  _AnimatedBottomNavBarState createState() => _AnimatedBottomNavBarState();
}

class _AnimatedBottomNavBarState extends State<AnimatedBottomNavBar> {
  int selectedTab = 0; //for index of selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            widget._barItems[selectedTab].text,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ), //now complete the screen
      //let's create another class for animated bar
      bottomNavigationBar: AnimatedBarItem(
        barItems: widget._barItems, //let's create bar items
        duration: Duration(
            milliseconds:
                500), //this is the duration for animation, set to 0.5 second
        onTap: (currentIndex) {
          setState(() {
            selectedTab = currentIndex; //update the current index
          });
        }, //this is the onTap function when press on the icon button on thr bottom navigation bar
      ),
    );
  }
}
