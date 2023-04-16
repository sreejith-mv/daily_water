import 'package:daily_water/cubits/user_water_Intake.dart';
import 'package:daily_water/models/water_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaterSourceListItem extends StatefulWidget {
  final WaterSource waterSource;
  const WaterSourceListItem({super.key, required this.waterSource});

  @override
  State<WaterSourceListItem> createState() => _WaterSourceListItemState();
}

class _WaterSourceListItemState extends State<WaterSourceListItem> {
  _WaterSourceListItemState();
  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    final TextEditingController textFieldController =
        TextEditingController(text: widget.waterSource.intakeValue.toString());
    return Column(
      children: [
        ListTile(
          title: Text(widget.waterSource.title),
          subtitle: Text(widget.waterSource.description),
          leading: Checkbox(
            value: isEnabled,
            onChanged: (value) {
              setState(() {
                isEnabled = value!;
                if (isEnabled) {
                  context
                      .read<UserWaterIntakeCubit>()
                      .addWaterSourceToUser(widget.waterSource);
                } else {
                  context
                      .read<UserWaterIntakeCubit>()
                      .removeWaterSourceToUser(widget.waterSource.id);
                }
              });
            },
          ),
          trailing: SizedBox(
            width: 100.0,
            height: 60,
            child: isEnabled
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        context.read<UserWaterIntakeCubit>().updateWaterIntake(
                            widget.waterSource,
                            double.parse(textFieldController.text.trim()));
                      },
                      controller: textFieldController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Value',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                    ),
                  )
                : Container(),
          ),
        ),
        const Divider(height: 1)
      ],
    );
  }
}
