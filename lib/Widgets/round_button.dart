import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key, required this.title, required this.onTap}) : super(key: key);
 final String title;
 final VoidCallback  onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color:Colors.teal[300],
          borderRadius: BorderRadius.circular(10),

        ),
        child: Center(
          child: /*loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,):*/
          Text(title,style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
