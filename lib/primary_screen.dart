import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/TopIconContainer.dart';
import 'package:bmi_calculator/CustomContainer.dart';
import 'package:bmi_calculator/constants.dart';

import 'bottom_container.dart';

enum Gender { male, female }

class PrimaryScreen extends StatefulWidget {
  @override
  _PrimaryScreenState createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  Gender gender;
  int currentSliderValue = 120;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomContainer(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    colour: gender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: TopIconContainer(
                        icon: FontAwesomeIcons.mars, label: "Male"),
                  ),
                ),
                Expanded(
                  child: CustomContainer(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    colour: gender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: TopIconContainer(
                      icon: FontAwesomeIcons.venus,
                      label: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomContainer(
              colour: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        currentSliderValue.toString(),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color(0xFFFFFFFF),
                        inactiveTrackColor: Colors.grey,
                        thumbColor: kOrangeColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 16),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 35),
                        overlayColor: Color(0x45EB1555)),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      value: currentSliderValue.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          currentSliderValue = value.floor();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BottomContainer(
                    variable: weight,
                    type: 'Weight',
                    onInc: () {
                      setState(() {
                        weight++;
                      });
                    },
                    onDec: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: BottomContainer(
                    variable: age,
                    type: 'Age',
                    onInc: () {
                      setState(() {
                        age++;
                      });
                    },
                    onDec: () {
                      setState(() {
                        age--;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain brain =
                  CalculatorBrain(height: currentSliderValue, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(
                          bmiResult: brain.calculateBmi(),
                          resultText: brain.getResult(),
                          interpretation: brain.getInterpretation(),
                        )),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'Calculate',
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: kOrangeColor,
              margin: EdgeInsets.only(top: 10),
              height: kBottomButtonHeight,
              padding: EdgeInsets.only(bottom: 10),
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
