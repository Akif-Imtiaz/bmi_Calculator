
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class Reusable_widget extends StatelessWidget {
  Reusable_widget({required this.colour, required this.cardChild, this.onPress});
  final Color colour;
  final Widget cardChild;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPress(),
      onTap: onPress != null ? () => onPress!() : null, 
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

