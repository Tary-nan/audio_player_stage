import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/header.dart';
import 'components/stack_pages_route.dart';
import 'Screens/from_section_primary.dart';

class MainAnnonce extends StatefulWidget {
  @override
  _MainAnnonceState createState() => _MainAnnonceState();
}

class SharedFormState {
  Map<String, String> valuesByName = {};
  SharedFormState();
}

class _MainAnnonceState extends State<MainAnnonce> {

  GlobalKey<NavigatorState> navKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Header(),
        Provider<SharedFormState>(
          create: (_) => SharedFormState(),
          //Use WillPopScope intercep les retour
          child: WillPopScope(
            onWillPop: _handleBackPop,
            child: Navigator(
              key: navKey,
              onGenerateRoute: (route) {
                return StackPagesRoute(previousPages: [], enterPage: FirstStepAnnonce());
              },
            ),
          ),
        ),
      ], 
    );
  }

  Future<bool> _handleBackPop() async {
    if (navKey.currentState.canPop()) {
      return false;
      // return !navKey.currentState.pop();
    }
    return true;
  }
}