import 'package:daily_water/widgets/addWaterSource/add_water_source.dart';
import 'package:daily_water/widgets/theme/theme_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/home/home_screen.dart';
import 'widgets/settings/setting_screen.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => const HomeScreen(),
  '/settings': (BuildContext context) => const SettingScreen(),
  '/theme': (BuildContext context) => const ThemeScreen(),
  '/update-water-source': (BuildContext context) => AddWaterSource(),
};
