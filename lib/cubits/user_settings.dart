import 'package:daily_water/models/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSettingsCubit extends Cubit<UserSettingsState> {
  UserSettingsCubit()
      : super(UserSettingsInitialState(
            UserSetting(totalIntake: 100, unit: 'liters')));

  updateIntakeValue(UserSetting value) {
    emit(UserSettingsUpdateState(value));
  }
}

abstract class UserSettingsState {}

class UserSettingsInitialState extends UserSettingsState {
  final UserSetting userSetting;

  UserSettingsInitialState(this.userSetting);
}

class UserSettingsUpdateState extends UserSettingsState {
  final UserSetting userSetting;

  UserSettingsUpdateState(this.userSetting);
}
