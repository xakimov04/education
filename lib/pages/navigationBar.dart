import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBarHome extends StatefulWidget {
  const NavigationBarHome({Key? key});

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarHome> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: _pageIndex,
      onTap: (index) {
        setState(() {
          _pageIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home, size: 25),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.square_list, size: 25),
          label: 'Headline',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings, size: 25),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person, size: 25),
          label: 'Profile',
        ),
      ],
    );
  }
}
