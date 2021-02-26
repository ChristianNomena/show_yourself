import 'package:flutter/material.dart';

const buttonSize = 200.0;
const buttonTextStyle = TextStyle(
  fontSize: 35.0,
  fontWeight: FontWeight.w700,
);

class RoundButton extends StatelessWidget {
  const RoundButton({Key key, @required this.onPressed}) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 15.0,
      onPressed: onPressed,
      child: Text(
        "Show",
        style: buttonTextStyle,
      ),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: buttonSize,
        height: buttonSize,
      ),
      fillColor: Color(0xFF67AE18),
    );
  }
}
