import 'package:audio_player_stage/styles.dart';
import 'package:flutter/material.dart';

class ButtonUpload extends StatelessWidget {
  VoidCallback _onPressed;
  String _title;
  ButtonUpload({Key key, VoidCallback onPressed,String title}):
      _onPressed = onPressed,
      _title = title,
      super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 35,
      child: RaisedButton(
        color: Color(0xfff1f1f1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: _onPressed,
        child: Row(
          children: [
            Icon(Icons.camera_alt, size: 20,),
            Text(_title, style: TextStyle(color: Colors.black, fontSize: 14),),
          ],
        ),
      ),
    );
  }
}