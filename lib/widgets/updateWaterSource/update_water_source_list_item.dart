import 'package:daily_water/models/water_source.dart';
import 'package:flutter/material.dart';

class UpdateWaterSourceListItem extends StatefulWidget {
  final WaterSource waterSource;
  const UpdateWaterSourceListItem({super.key, required this.waterSource});

  @override
  State<UpdateWaterSourceListItem> createState() =>
      _UpdateWaterSourceListItem();
}

class _UpdateWaterSourceListItem extends State<UpdateWaterSourceListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.waterSource.title),
          subtitle: Text(
              "Enter the water intake from ${widget.waterSource.title} in liters"),
          trailing: const SizedBox(
            width: 100.0,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Value',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
          ),
        ),
        const Divider(height: 1)
      ],
    );
  }
}
