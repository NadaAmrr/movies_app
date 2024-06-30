

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
    WatchListTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => HomeScreenProvider(),
    builder: (context, child) {
      var provider = Provider.of<HomeScreenProvider>(context);
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              unselectedLabelStyle: const TextStyle(color: Colors.white),
              selectedLabelStyle: const TextStyle(color: Color(0xffFFB224)),
              selectedItemColor: const Color(0xffFFB224),
              unselectedItemColor: Colors.white,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xff1A1A1A),
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
