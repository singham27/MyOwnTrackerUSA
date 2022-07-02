import 'package:flutter/material.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';


class SwitchCustom extends StatefulWidget {
  Function(bool) onChanged;

  SwitchCustom({Key? key, required this.onChanged}) : super(key: key);

  @override
  _SwitchCustomState createState() => _SwitchCustomState();
}

class _SwitchCustomState extends State<SwitchCustom> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      // onChanged: widget.onChanged,
      onChanged: (value) {
        isSwitched = value;
        setState(() {

        });

        widget.onChanged(value);
      },
      activeTrackColor: ColorStyle.secondryColor.withOpacity(.3),
      activeColor: ColorStyle.secondryColor,
    );
  }
}
