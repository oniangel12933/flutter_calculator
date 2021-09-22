import 'package:flutter/material.dart';

class MathCalButton extends StatelessWidget {
  final String text;
  final String fillColor;
  final Function callback;
  const MathCalButton({Key key, this.text, this.fillColor, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ClipOval(
        child: Material(
          color: Colors.white, // button color
          child: InkWell(
            splashColor: Colors.red, // inkwell color
            child: SizedBox(
                width: 65,
                height: 65,
                child: Center(
                  child: Text(text,
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                )),
            onTap: () {
              callback(text);
            },
          ),
        ),
      ),
    );
  }
}
