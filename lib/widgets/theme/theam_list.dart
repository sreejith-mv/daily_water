import 'package:daily_water/data/theme_data.dart';
import 'package:daily_water/models/app_theme.dart';
import 'package:daily_water/widgets/theme/theme_list_item.dart';
import 'package:flutter/material.dart';

class ThemeList extends StatelessWidget {
  final List<AppTheme> appTheme = themeData;

  ThemeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appTheme.length,
      itemBuilder: (context, item) {
        final theme = appTheme[item];
        return ThemeListItem(appTheme: theme);
      },
    );
  }
}
