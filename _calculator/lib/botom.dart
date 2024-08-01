import 'package:_calculator/constants.dart';
import 'package:_calculator/result_page.dart';
import 'package:flutter/material.dart';

class Botom extends StatelessWidget {
  const Botom({required this.CALCULATOR ,required this.onTap });

  final Function onTap;
  final String CALCULATOR;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => onTap(),
      
      child: Container(
        child: Center(child: Text( CALCULATOR , style: klargeButtonText,)),
        color: kbuttonColor,
        padding:EdgeInsets.only(bottom: 20.0),
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}