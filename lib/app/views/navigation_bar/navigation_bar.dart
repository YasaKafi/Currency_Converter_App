import 'package:currency_converter/helpers/themes.dart';
import 'package:currency_converter/app/views/bookmark_page/view/bookmark_page.dart';
import 'package:currency_converter/app/views/home_page/view/home_page.dart';
import 'package:currency_converter/app/views/list_page/view/list_page.dart';
import 'package:currency_converter/app/views/profile_page/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';



class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: const <Widget>[
          HomePage(email: '', name: '', phoneNumber: ''),
          ListPage(),
          BookMarkPage(),
          ProfilePage(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        controller: _controller,
        items: const [
          RollingBottomBarItem(Icons.currency_exchange, label: 'Convert'),
          RollingBottomBarItem(Icons.list_rounded, label: 'List'),
          RollingBottomBarItem(Icons.bookmark_add_sharp, label: 'Book Mark'),
          RollingBottomBarItem(Icons.person, label: 'profile'),
        ],
        enableIconRotation: false,
        activeItemColor: primaryColor,
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}