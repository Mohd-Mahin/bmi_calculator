import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.iconChild, this.action});
  final IconData iconChild;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color(0xFF4C4F5E),
      onPressed: action,
      textColor: Colors.white,
      child: Icon(
        iconChild,
        size: 23,
      ),
      shape: CircleBorder(),
      height: 56,
      minWidth: 56,
    );
  }
}
