import 'package:daily_water/widgets/theme/theam_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/theme.dart';
import '../daily_water_drawer.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      drawer: DailyWaterDrawer(key: key),
      body: ThemeList(),
    );
  }
}
