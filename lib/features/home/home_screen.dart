

import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_images.dart';
import 'package:movies/features/home/home_screen_provider.dart';
import 'package:movies/features/tabs/browse_tab.dart';
import 'package:movies/features/tabs/home_tab.dart';
import 'package:movies/features/tabs/search_tab.dart';
import 'package:movies/features/tabs/watchList_tab.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Widget> tabs = const [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchlistTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => HomeScreenPovider(),
    builder: (context, child) {
      var provider = Provider.of<HomeScreenPovider>(context);
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              unselectedLabelStyle: TextStyle(color: Colors.white),
              selectedLabelStyle: TextStyle(color: Color(0xffFFB224)),
              selectedItemColor: Color(0xffFFB224),
              unselectedItemColor: Colors.white,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xff1A1A1A),
              iconSize: 25,
              currentIndex: provider.selectedIndex,
              onTap: provider.getIndexTab,
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(AppImages.iconHome),
                    ),
                    label: "HOME"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(AppImages.iconSearch),
                    ),
                    label: "SEARCH"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(AppImages.iconBrowser),
                    ),
                    label: "Browse"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(AppImages.iconWishlist),
                    ),
                    label: "Watchlist"),
              ]),
          body: tabs[provider.selectedIndex]);
    });
  }
}
