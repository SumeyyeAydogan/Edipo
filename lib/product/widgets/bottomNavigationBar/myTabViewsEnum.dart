/* import 'package:edipo/feature/home/view/home_view.dart';
import 'package:edipo/feature/profile/view/profile_view.dart';
import 'package:flutter/material.dart';

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
} */
