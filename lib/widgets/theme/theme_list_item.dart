import 'package:daily_water/cubits/theme.dart';
import 'package:daily_water/models/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeListItem extends StatelessWidget {
  final AppTheme appTheme;
  const ThemeListItem({super.key, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(appTheme.name),
          onTap: () {
            context.read<ThemeCubit>().toggleTheme(appTheme.id);
          },
          leading: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: appTheme.color,
                borderRadius: const BorderRadius.all(Radius.circular(40))),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
