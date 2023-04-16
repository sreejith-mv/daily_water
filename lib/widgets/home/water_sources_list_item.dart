import 'package:daily_water/models/water_source.dart';
import 'package:flutter/material.dart';

class WaterSourceListItem extends StatefulWidget {
  final WaterSource waterSource;
  const WaterSourceListItem({super.key, required this.waterSource});

  @override
  State<WaterSourceListItem> createState() => _WaterSourceListItemState();
}

class _WaterSourceListItemState extends State<WaterSourceListItem> {
  _WaterSourceListItemState();
  @override
  Widget build(BuildContext context) {
    final TextEditingController textFieldController =
        TextEditingController(text: widget.waterSource.intakeValue.toString());
    bool? isEnabled;
    return Column(
      children: [
        ListTile(
          title: Text(widget.waterSource.title),
          subtitle: Text(widget.waterSource.description),
          leading: Checkbox(
            value: isEnabled,
            onChanged: (value) {
              setState(() {
                isEnabled = value;
              });
            },
          ),
          trailing: SizedBox(
            width: 100.0,
            height: 60,
            child: isEnabled ?? false
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
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


// Row(
//           children: [
//             Checkbox(
//               value: enabled,
//               onChanged: (value) {
//                 print(value);
//                 // setState(() {
//                 //   enabled = value!;
//                 // });
//               },
//             ),
//             Expanded(child: Text(widget.waterSource.title)),
//             SizedBox(
//               width: 100.0,
//               height: 60,
//               child: enabled
//                   ? Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         controller: textFieldController,
//                         textAlign: TextAlign.center,
//                         keyboardType: TextInputType.number,
//                         decoration: const InputDecoration(
//                           hintText: 'Value',
//                           border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(5))),
//                         ),
//                       ),
//                     )
//                   : Container(),
//             ),
//           ],
//         ),