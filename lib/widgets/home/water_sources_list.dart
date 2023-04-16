import 'package:daily_water/cubits/user_water_Intake.dart';
import 'package:daily_water/cubits/water_intake.dart';
import 'package:daily_water/models/water_source.dart';
import 'package:daily_water/widgets/home/water_sources_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/water_source.dart';

class WaterSourcesList extends StatelessWidget {
  const WaterSourcesList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WaterSourceCubit>().getWaterSources();
    return BlocBuilder<WaterSourceCubit, WaterSourceState>(
        builder: (BuildContext context, WaterSourceState state) {
      List<WaterSource> waterSources = [];
      if (state is WaterSourceLoadedState) {
        waterSources = state.waterSources;
      } else if (state is WaterSourceUpdateState) {
        waterSources = state.waterSources;
      }
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: waterSources.length,
              itemBuilder: (context, item) {
                final waterSource = waterSources[item];
                return WaterSourceListItem(waterSource: waterSource);
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                List<WaterSource> waterSources =
                    context.read<UserWaterIntakeCubit>().getUserWaterSources();
                context
                    .read<WaterIntakeCubit>()
                    .updateIntakeValue(waterSources);
              },
              child: const Text('Save'))
        ],
      );
    });
  }
}
