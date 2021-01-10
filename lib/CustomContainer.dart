import "package:flutter/material.dart";

class CustomContainer extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onTap;

  CustomContainer({@required this.colour, this.cardChild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: this.colour,
        ),
      ),
    );
  }
}
