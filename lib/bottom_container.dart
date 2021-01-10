import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomContainer.dart';
import 'constants.dart';

class BottomContainer extends StatelessWidget {
  final String type;
  final int variable;
  final Function onInc;
  final Function onDec;

  BottomContainer({this.type, this.variable, this.onInc, this.onDec});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      colour: kActiveCardColor,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type,
            style: kLabelTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                variable.toString(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(type == 'Weight' ? 'kg' : 'Yrs')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                iconChild: FontAwesomeIcons.minus,
                action: onDec,
              ),
              SizedBox(
                width: 10,
              ),
              RoundIconButton(
                iconChild: FontAwesomeIcons.plus,
                action: onInc,
              ),
            ],
          )
        ],
      ),
    );
  }
}
