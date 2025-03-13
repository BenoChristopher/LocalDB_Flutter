import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  void Function()? onPressed;
  //final Color color;
  final String buttonName;

  MyButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 400,
      child: MaterialButton(
        //elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        color: Colors.amberAccent,
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: GoogleFonts.blinker(fontSize: 16),
        ),
      ),
    );
  }
}
