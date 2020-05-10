import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding/secoundpage.dart';
import 'package:page_transition/page_transition.dart';

import 'onboarding.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor:Colors.transparent),
    );
    return MaterialApp(
      title: 'intoduction boarding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoarding(),
      onGenerateRoute: (settings){
        switch (settings.name) {
          case '/secound' :
            return PageTransition(
              child: SecondPage(),
              type: PageTransitionType.scale,
              settings: settings,
            );
         
         break;
          default:
            return null;
        }

      },
    );
  }
}

