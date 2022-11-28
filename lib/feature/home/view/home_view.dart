import 'package:carousel_slider/carousel_slider.dart';
import 'package:edipo/core/extension/context_extension.dart';
import 'package:edipo/feature/location/view/location_view.dart';
import 'package:edipo/product/widgets/bottom_sheet.dart';
import 'package:edipo/product/widgets/card/place_card.dart';
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: context.height * 0.05),
            const Padding(padding: EdgeInsets.symmetric(vertical:15.0), child: TopBarMenu()),
            Padding(
              padding: EdgeInsets.zero,
              child: buildSlider(),
            ),
            SizedBox(height: context.height * 0.05),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Yakınımdakiler',
                  style: Theme.of(context).textTheme.headline1),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        const PlaceCard(),
                        SizedBox(height: context.height * 0.01),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            customBottomSheet(context, LocationPage());
          },
          child: Text('+', style: Theme.of(context).textTheme.headline1)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: _notchedValue,
        shape: const CircularNotchedRectangle(),
        child: _myTabView(),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
        //labelColor: Colors.black,
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        controller: _tabController,
        tabs: MyTabViews.values.map((e) => Tab(icon: e.iconName)).toList());
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

class TopBarMenu extends StatefulWidget {
  const TopBarMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<TopBarMenu> createState() => _TopBarMenuState();
}

class _TopBarMenuState extends State<TopBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset('assets/images/pp_mini.png'),
      SizedBox(width: context.width * 0.01),
      Row(
        children: [
          RichText(
            text: const TextSpan(
              text: 'Merhaba\n',
              style: TextStyle(color: Colors.grey),
              children: <TextSpan>[
                TextSpan(
                    text: 'Yusuf Şafak',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          )
        ],
      ),
      const Spacer(),
    ]);
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
}
