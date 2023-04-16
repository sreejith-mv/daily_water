import 'package:daily_water/models/water_source.dart';
import 'package:flutter/material.dart';

import 'update_water_source_list_item.dart';

class UpdateWaterSourcesList extends StatelessWidget {
  final List<WaterSource> waterSources;
  const UpdateWaterSourcesList({super.key, required this.waterSources});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: waterSources.length,
      itemBuilder: (context, item) {
        final waterSource = waterSources[item];
        return UpdateWaterSourceListItem(waterSource: waterSource);
      },
    );
  }
}
