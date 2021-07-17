import 'package:first_project/Constrain.dart';
import 'package:first_project/Widget_Function.dart';
import 'package:first_project/screens/descriptionScreen.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({Key? key, required this.text, required this.icon, required this.width}) : super(key: key);

  final String text;
  final IconData icon;
  final double width;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(
        splashColor: COLOR_WHITE.withAlpha(50),
        color: COLOR_DARK_BLUE,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>descriptionScreen()));
        },
        child: Row(
          children: [
            Icon(icon,color: COLOR_WHITE,),
            addHorizontalSpace(10),
            Text(text,style: TextStyle(color: COLOR_WHITE),)
          ],
        ),
      ),
    );
  }
}
