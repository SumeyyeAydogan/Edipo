import 'package:carousel_slider/carousel_slider.dart';
import 'package:edipo/feature/location/view/location_view.dart';
import 'package:edipo/feature/profile/view/profile_view.dart';
import 'package:edipo/product/widgets/bottom_sheet.dart';
import "package:flutter/material.dart";

import '../home/view/home_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;
  final photoList = [
    "assets/images/page1.png",
    "assets/images/page2.png",
    "assets/images/page3.png",
    "assets/images/page4.png",
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myTabBarView(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            customBottomSheet(context, LocationPage());
          },
          child: Text('+', style: Theme.of(context).textTheme.headline1)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: _notchedValue,
        shape: const CircularNotchedRectangle(),
        child: _myTabBar(),
      ),
    );
  }

  TabBar _myTabBar() {
    return TabBar(
        //labelColor: Colors.black,
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        controller: _tabController,
        tabs: MyTabViews.values.map((e) => Tab(icon: e.iconName)).toList());
  }
  TabBarView _myTabBarView() {
    return TabBarView(
        controller: _tabController,
        children: MyTabViews.values.map((e) => Tab(child: e.route)).toList());
  }

  CarouselSlider buildSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true, autoPlay: true, viewportFraction: 1),
      items: photoList.map<Widget>((index) {
        return Builder(
          builder: (BuildContext context) {
            return Image.asset(
              index.toString(),
            );
          },
        );
      }).toList(),
    );
  }
}


enum MyTabViews { home, profile }

extension _MyTabViewsExtension on MyTabViews {
  Icon get iconName {
    switch (this) {
      case MyTabViews.home:
        return const Icon(Icons.home_outlined);
      case MyTabViews.profile:
        return const Icon(Icons.person_outlined);
      default:
        return const Icon(Icons.abc_outlined);
    }
  }
  Widget get route{
    switch (this) {
      case MyTabViews.home:
        return const HomePage();
      case MyTabViews.profile:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}


