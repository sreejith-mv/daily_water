import 'package:daily_water/cubits/user_settings.dart';
import 'package:daily_water/cubits/user_water_Intake.dart';
import 'package:daily_water/cubits/water_source.dart';
import 'package:daily_water/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/theme.dart';
import 'cubits/water_intake.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => WaterSourceCubit()),
          BlocProvider(create: (context) => WaterIntakeCubit()),
          BlocProvider(create: (context) => UserSettingsCubit()),
          BlocProvider(create: (context) => UserWaterIntakeCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, state) {
            return MaterialApp(
              theme: state,
              routes: routes,
              initialRoute: '/',
            );
          },
        ));
  }
}
