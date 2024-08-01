import 'package:_calculator/botom.dart';
import 'package:_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'Reusable_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({required this.bmiResult,required this.resultIndex, required this.Interpretation});

  final String bmiResult;
  final String resultIndex;
  final String Interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'your Result',
                
                style: ktitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Reusable_widget(
                colour: kinactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultIndex.toUpperCase(),
                      style: kresultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMItextStyle,
                    ),
                    Text(
                      Interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
          Botom(CALCULATOR: 'Re-Calculate', onTap: () {
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}
