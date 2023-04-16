import 'package:daily_water/cubits/user_settings.dart';
import 'package:daily_water/models/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:select_form_field/select_form_field.dart';

import '../daily_water_drawer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final List<Map<String, dynamic>> _items = [
      {
        'value': 'ounces',
        'label': 'Ounces',
      },
      {
        'value': 'liters',
        'label': 'Liters',
      },
    ];

    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        drawer: DailyWaterDrawer(key: key),
        body: BlocBuilder<UserSettingsCubit, UserSettingsState>(
          builder: (context, state) {
            UserSetting userSetting =
                UserSetting(totalIntake: 0, unit: 'liters');
            if (state is UserSettingsInitialState) {
              userSetting = state.userSetting;
            } else if (state is UserSettingsUpdateState) {
              userSetting = state.userSetting;
            }

            final unitCtrl = TextEditingController(text: userSetting.unit);
            final intakeGoalCtrl =
                TextEditingController(text: userSetting.totalIntake.toString());

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: intakeGoalCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Daily water intake goal',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Daily water intake goal is required';
                        } else if (!RegExp(r'^-?[0-9]+$').hasMatch(value!)) {
                          return 'Daily water intake goal should a numeric value';
                        }
                        return null;
                      },
                    ),
                    SelectFormField(
                      controller: unitCtrl,
                      type: SelectFormFieldType.dropdown,
                      labelText: 'Select Unit',
                      items: _items,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<UserSettingsCubit>().updateIntakeValue(
                                UserSetting(
                                  totalIntake:
                                      double.parse(intakeGoalCtrl.text.trim()),
                                  unit: unitCtrl.value.text,
                                ),
                              );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data Saved Successfully'),
                            ),
                          );
                        }
                      },
                      child: const Text('Save'),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
