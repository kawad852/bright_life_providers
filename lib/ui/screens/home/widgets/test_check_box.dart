import 'package:flutter/material.dart';

import '../../../../utils/base/colors.dart';

class StatusListTile extends StatefulWidget {
  final String title;
  final Function(bool? value) onChanged;
  final bool value;

  const StatusListTile({
    Key? key,
    required this.onChanged,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  State<StatusListTile> createState() => _StatusListTileState();
}

class _StatusListTileState extends State<StatusListTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          Checkbox(
            value: widget.value,
            onChanged: widget.onChanged,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              side: BorderSide(color: MyColors.grey070),
            ),
            fillColor: MaterialStateProperty.all(MyColors.grey070),
          ),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
