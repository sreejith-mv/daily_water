import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/water_source.dart';

class UserWaterIntakeCubit extends Cubit<UserWaterIntakeState> {
  List<WaterSource> waterSources = [];
  UserWaterIntakeCubit() : super(UserWaterIntakeInitialState([]));

  updateWaterIntake(WaterSource source, double value) {
    for (var i = 0; i < waterSources.length; i++) {
      if (waterSources[i].id == source.id) {
        waterSources[i] = WaterSource(
            id: waterSources[i].id,
            description: waterSources[i].description,
            intakeValue: value,
            title: waterSources[i].title);
      }
    }
    emit(UserWaterIntakeUpdateState(waterSources));
  }

  addWaterSourceToUser(WaterSource source) {
    waterSources.add(source);
    emit(UserWaterIntakeUpdateState(waterSources));
  }

  removeWaterSourceToUser(int sourceId) {
    waterSources.removeWhere((item) => item.id == sourceId);
    emit(UserWaterIntakeUpdateState(waterSources));
  }

  List<WaterSource> getUserWaterSources() {
    return waterSources;
  }
}

abstract class UserWaterIntakeState {}

class UserWaterIntakeInitialState extends UserWaterIntakeState {
  final List<WaterSource> waterSources;

  UserWaterIntakeInitialState(this.waterSources);
}

class UserWaterIntakeUpdateState extends UserWaterIntakeState {
  final List<WaterSource> waterSources;

  UserWaterIntakeUpdateState(this.waterSources);
}
