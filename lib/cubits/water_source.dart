import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/water_source.dart';

class WaterSourceCubit extends Cubit<WaterSourceState> {
  final List<WaterSource> waterSources = [
    WaterSource(
        id: 1,
        description: 'Test descriptions',
        intakeValue: 10.2,
        title: 'Tea',
        value: true),
    WaterSource(
        id: 1,
        description: 'Test descriptions 2',
        intakeValue: 10.2,
        title: 'Bottle',
        value: false)
  ];

  WaterSourceCubit() : super(WaterSourceInitialState([]));

  void getWaterSources() {
    emit(WaterSourceLoadedState(waterSources));
  }

  void addNewWaterSource(WaterSource source) {
    waterSources.add(source);
    emit(WaterSourceAddedState(waterSources));
  }

  void updateNewWaterSource(WaterSource source) {
    for (var i = 0; i < waterSources.length; i++) {
      if (waterSources[i].id == source.id) {
        waterSources[i] = source;
      }
    }
    emit(WaterSourceUpdateState(waterSources));
  }

  double getTotalIntake() {
    double totalIntake = 0;
    for (var i = 0; i < waterSources.length; i++) {
      totalIntake = totalIntake + waterSources[i].intakeValue;
    }
    return totalIntake;
  }
}

class WaterSourceState {}

class WaterSourceInitialState extends WaterSourceState {
  final List<WaterSource> waterSources;

  WaterSourceInitialState(this.waterSources);
}

class WaterSourceLoadedState extends WaterSourceState {
  final List<WaterSource> waterSources;

  WaterSourceLoadedState(this.waterSources);
}

class WaterSourceAddedState extends WaterSourceState {
  final List<WaterSource> waterSources;

  WaterSourceAddedState(this.waterSources);
}

class WaterSourceUpdateState extends WaterSourceState {
  final List<WaterSource> waterSources;

  WaterSourceUpdateState(this.waterSources);
}

class WaterSourceDeleteState extends WaterSourceState {}
