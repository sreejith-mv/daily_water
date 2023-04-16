import 'package:daily_water/cubits/water_intake.dart';
import 'package:daily_water/cubits/water_source.dart';
import 'package:daily_water/models/water_source.dart';
import 'package:daily_water/widgets/daily_water_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWaterSource extends StatelessWidget {
  const AddWaterSource({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController intakeValue = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Water Source'),
        ),
        drawer: DailyWaterDrawer(
          key: key,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: title,
                  decoration: const InputDecoration(hintText: 'Title'),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Title value is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: description,
                  decoration: const InputDecoration(hintText: 'Description'),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Description value is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: intakeValue,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Default Value'),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Default value is required';
                    } else if (double.tryParse(value!) == null) {
                      return 'Default value should ne numeric';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<WaterSourceCubit>(context)
                            .addNewWaterSource(WaterSource(
                                id: 0,
                                title: title.text.trim(),
                                description: description.text,
                                intakeValue: double.parse(intakeValue.text)));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data Saved Successfully'),
                          ),
                        );
                      }
                    },
                    child: const Text('Add Water Source'))
              ],
            ),
          ),
        ));
  }
}
