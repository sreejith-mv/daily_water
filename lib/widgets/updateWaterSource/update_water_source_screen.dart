import 'package:flutter/material.dart';
import '../../models/water_source.dart';
import '../daily_water_drawer.dart';

class UpdateWaterSourceScreen extends StatelessWidget {
  final List<WaterSource> waterSources = [];

  UpdateWaterSourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        drawer: DailyWaterDrawer(key: key),
        body: const Placeholder());
  }
}
