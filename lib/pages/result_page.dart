import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation})
      : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    "Your Result",
                    style: titleTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                activeCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: resultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: bmiTextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: bodyTextStyle,
                    ),
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
                    "RE-CALCULATE",
                    style: largwButtonTextStyle,
                  ),
                ),
                color: bottomContainerColor,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: bottomContainerHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
