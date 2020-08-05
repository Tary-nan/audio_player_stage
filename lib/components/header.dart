import 'package:flutter/material.dart';

import '../styles.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: Scaffold(
        body: Container(
          height: screenSize.height * .25,
          width: screenSize.width,
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     Styles.baseColor,
            //     Colors.teal
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight

            // )
              image: DecorationImage(
                  image: AssetImage('assets/images/cho.png'),
                  // image: AssetImage('assets/ecole.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.white60, BlendMode.screen))
                  ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('MyProf'.toUpperCase(), style: Styles.appTitle1),
                  Text('Annonce', style: Styles.appTitle2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}