import 'package:daily_water/models/water_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaterIntakeCubit extends Cubit<WaterIntakeState> {
  WaterIntakeCubit() : super(WaterIntakeInitialState(0.0));

  void updateIntakeValue(value) {
    emit(WaterIntakeUpdateState(value));
  }

  void getTotalIntake(List<WaterSource> waterSources) {
    double totalIntake = 0;
    for (var i = 0; i < waterSources.length; i++) {
      totalIntake = totalIntake + waterSources[i].intakeValue;
    }
    emit(WaterIntakeUpdateState(totalIntake));
  }
}

abstract class WaterIntakeState {}

class WaterIntakeInitialState extends WaterIntakeState {
  final double waterIntake;

  WaterIntakeInitialState(this.waterIntake);
}

class WaterIntakeUpdateState extends WaterIntakeState {
  final double waterIntake;

  WaterIntakeUpdateState(this.waterIntake);
}
