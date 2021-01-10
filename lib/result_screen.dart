import 'package:bmi_calculator/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

const kResultHeadingStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

class ResultScreen extends StatelessWidget {
  String bmiResult;
  String resultText;
  String interpretation;

  ResultScreen(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: kResultHeadingStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomContainer(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'Re-Calculate',
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
