import 'package:audio_player_stage/styles.dart';
import 'package:flutter/material.dart';

class ButtonUploadDiplome extends StatelessWidget {
  VoidCallback _onPressed;
  String _title;
  ButtonUploadDiplome({Key key, VoidCallback onPressed,String title}):
      _onPressed = onPressed,
      _title = title,
      super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: RaisedButton(
        color: Styles.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: _onPressed,
        child: Row(
          children: [
            Icon(Icons.file_upload, size: 20, color: Colors.white,),
            Text(_title, style: TextStyle(color: Colors.white, fontSize: 14),),
          ],
        ),
      ),
    );
  }
}