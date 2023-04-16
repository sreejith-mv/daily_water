import 'package:daily_water/cubits/water_intake.dart';
import 'package:daily_water/widgets/daily_water_drawer.dart';
import 'package:daily_water/widgets/home/water_sources_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../cubits/user_settings.dart';
import '../../models/settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: DailyWaterDrawer(key: key),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/update-water-source'),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<WaterIntakeCubit, WaterIntakeState>(
              builder: (context, state) {
                double waterIntake = 0;
                if (state is WaterIntakeInitialState) {
                  waterIntake = 0;
                } else if (state is WaterIntakeUpdateState) {
                  waterIntake = state.waterIntake;
                }

                return Padding(
                    padding: const EdgeInsets.all(16),
                    child: BlocBuilder<UserSettingsCubit, UserSettingsState>(
                      builder: (context, userState) {
                        UserSetting userSetting =
                            UserSetting(totalIntake: 100, unit: 'liters');
                        if (userState is UserSettingsUpdateState) {
                          userSetting = userState.userSetting;
                        }
                        return CircularPercentIndicator(
                          radius: 100.0,
                          animation: true,
                          animationDuration: 1200,
                          lineWidth: 20.0,
                          percent: (waterIntake / userSetting.totalIntake),
                          center: Text(
                            waterIntake.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 30.0,
                              color: Colors.blue[700],
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Theme.of(context).primaryColor,
                        );
                      },
                    ));
              },
            ),
            const Expanded(child: WaterSourcesList())
          ],
        ),
      ),
    );
  }
}
