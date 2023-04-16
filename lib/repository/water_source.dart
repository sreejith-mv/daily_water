import 'package:daily_water/models/water_source.dart';

class WaterSourceRepository {
  List<WaterSource> waterSources = [
    WaterSource(
      id: 1,
      title: 'Tea',
      description: 'Team description',
      intakeValue: .5,
    ),
    WaterSource(
      id: 2,
      title: 'Bottle Water',
      description: 'description',
      intakeValue: 1,
    ),
    WaterSource(
      id: 3,
      title: 'Milk',
      description: 'description',
      intakeValue: .2,
    )
  ];

  void addWaterSource(WaterSource waterSource) {
    waterSources.add(waterSource);
  }

  List<WaterSource> getWaterSources() {
    return waterSources;
  }

  void updateWaterIntakeAtSource(WaterSource waterSource, double intakeValue) {
    int index = waterSources.indexOf(waterSource);
    WaterSource source = WaterSource(
      id: waterSource.id,
      title: waterSource.title,
      description: waterSource.description,
      intakeValue: intakeValue,
    );

    waterSources[index] = source;
  }
}
