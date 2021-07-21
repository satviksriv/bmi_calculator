import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/model/calculator.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text("BMI CALCULATOR"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      IconContent("MALE", FontAwesomeIcons.mars),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      IconContent(
                        "FEMALE",
                        FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              activeCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
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
                  child: ReusableCard(
                    activeCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              constraints: BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                              elevation: 0,
                              shape: CircleBorder(),
                              fillColor: Color(0xff4c4f5e),
                            ),
                            SizedBox(width: 10),
                            RawMaterialButton(
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              constraints: BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                              elevation: 0,
                              shape: CircleBorder(),
                              fillColor: Color(0xff4c4f5e),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    activeCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              constraints: BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                              elevation: 0,
                              shape: CircleBorder(),
                              fillColor: Color(0xff4c4f5e),
                            ),
                            SizedBox(width: 10),
                            RawMaterialButton(
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              constraints: BoxConstraints.tightFor(
                                width: 56,
                                height: 56,
                              ),
                              elevation: 0,
                              shape: CircleBorder(),
                              fillColor: Color(0xff4c4f5e),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator calc = Calculator(height, weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  "CALCULATE",
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
    );
  }
}
