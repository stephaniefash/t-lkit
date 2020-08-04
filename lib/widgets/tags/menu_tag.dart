import 'package:flutter/cupertino.dart';

class MenuTag extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color containerColor;

  MenuTag(this.text, this.textColor, this.containerColor);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: containerColor,
          ),
        ),
      ],
    );
  }
}
