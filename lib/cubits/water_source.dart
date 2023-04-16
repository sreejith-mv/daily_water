import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/water_source.dart';
import '../repository/water_source.dart';

class WaterSourceCubit extends Cubit<WaterSourceState> {
  WaterSourceCubit() : super(WaterSourceInitialState([]));

  WaterSourceRepository repo = WaterSourceRepository();

  void getWaterSources() {
    List<WaterSource> waterSources = repo.getWaterSources();
    emit(WaterSourceLoadedState(waterSources));
  }

  void addNewWaterSource(WaterSource source) {
    List<WaterSource> waterSources = repo.addWaterSource(source);
    emit(WaterSourceAddedState(waterSources));
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
