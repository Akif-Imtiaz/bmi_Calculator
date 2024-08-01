import 'package:_calculator/botom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'Reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

enum genderType { Male, Female } //i used enums here anjella part 12 video 7

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  genderType? gender;
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  // void updateColor(genderType gender) {

  //   // if (gender == genderType.Male) {
  //   //   if (maleCardColor == inactiveCardColor) {
  //   //     maleCardColor = color;
  //   //   } else {
  //   //     maleCardColor = inactiveCardColor;
  //   //     femaleCardColor = color;
  //   //   }
  //   // } else if (gender == genderType.Female) {
  //   //   if(femaleCardColor == inactiveCardColor){
  //   //     femaleCardColor = color;
  //   //   }
  //   //   else{
  //   //     femaleCardColor = inactiveCardColor;
  //   //     maleCardColor = color;
  //   //   }
  //   // }
  // }
  int Height = 180;
  int Weight = 80;
  int Age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        // backgroundColor: Theme.of(context).primaryColor, // Not needed if appBarTheme is set
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable_widget(
                    onPress: () {
                      setState(() {
                        gender = genderType.Male;
                        // updateColor(genderType.Male);
                      });
                    },
                    colour:
                        gender == genderType.Male ? kcolor : kinactiveCardColor,
                    cardChild: Icon_content(
                      icon: FontAwesomeIcons.mars,
                      text: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable_widget(
                    onPress: () {
                      setState(() {
                        gender = genderType.Female;
                        // updateColor(genderType.Male);
                      });
                    },
                    colour: gender == genderType.Female
                        ? kcolor
                        : kinactiveCardColor,
                    cardChild: Icon_content(
                      icon: FontAwesomeIcons.venus,
                      text: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusable_widget(
              colour: kcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: labeltextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline
                        .alphabetic, //to male centimeter on the line
                    children: [
                      Text(Height.toString(), style: heavyFont),
                      Text(
                        'cm',
                        style: labeltextstyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of( context ).copyWith(
                      inactiveTrackColor:  Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),//increase the shape of thumb 
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                       trackHeight: 2.0,
                    ),
                    child: Slider(
                        value: Height.toDouble(),
                        min: 120,
                        max: 220,
                        
                        // inactiveColor: Color(0xFF8D8E98),
                        
                        onChanged: (double newValue) {
                          setState(() {
                            Height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable_widget(
                    colour: kcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: labeltextstyle,
                        ),
                        Text(
                          Weight.toString(),
                          style: heavyFont,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.plus, 
                            onPressed: (){
                                setState(() {
                                  Weight++;
                                });
                            },),
                            SizedBox(
                              width: 10.0,
                            ),
                             RoundIconButton(icon: FontAwesomeIcons.minus,
                             onPressed:(){
                              setState(() {
                                  Weight--;
                                });
                             },),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable_widget(
                    colour: kcolor,
                    cardChild:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: labeltextstyle,
                        ),
                        Text(
                          Age.toString(),
                          style: heavyFont,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.plus, 
                            onPressed: (){
                                setState(() {
                                  Age++;
                                });
                            },),
                            SizedBox(
                              width: 10.0,
                            ),
                             RoundIconButton(icon: FontAwesomeIcons.minus,
                             onPressed:(){
                              setState(() {
                                  Age--;
                                });
                             },),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Botom(CALCULATOR: 'Calculato', onTap: (){

            CalculatorBrain calc = CalculatorBrain(height: Height,weight: Weight);

                
         Navigator.push(context, MaterialPageRoute(builder: (context){
        return ResultPage(
          bmiResult: calc.calculateBMI(),
          resultIndex: calc.getResult(),
          Interpretation: calc.getInterpretation(),
        );

      }
      ),
      );
    
          },),
        ],
      ),
    );
  }
}

// class Botom extends StatelessWidget {
//   const Botom({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//          Navigator.push(context, MaterialPageRoute(builder: (context){
//         return ResultPage();
//       }
//       ),
//       );
//     },
      
//       child: Container(
//         child: Center(child: Text('Calculate' , style: klargeButtonText,)),
//         color: kbuttonColor,
//         padding:EdgeInsets.only(bottom: 20.0),
//         height: kBottomContainerHeight,
//         width: double.infinity,
//         margin: EdgeInsets.only(top: 10.0),
//       ),
//     );
//   }
// }

class RoundIconButton extends StatelessWidget {
   RoundIconButton({required this.icon,required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      child :Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      
    );
  }
}


