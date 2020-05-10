import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'homepage.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.push(
        context,
        PageTransition(
            curve: Curves.bounceOut,
            type: PageTransitionType.rotate,
            alignment: Alignment.topCenter,
            child: HomePage()));

    // Navigator.push(
    //   context,
    //   // MaterialPageRoute(builder: (_) => HomePage()),
    // );
  }

  Widget _buildImage(String assetName) {
    return Align(
        child: Image.asset(
          'assets/$assetName.jpg',
          width: 350.0,
        ),
        alignment: Alignment.bottomCenter);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 20.0);
    const pageDecoration = const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        bodyTextStyle: bodyStyle,
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero);

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
            title: "Sukaraya IT",
            body: "Menaikan Skill koding untuk bisnis mu",
            image: _buildImage('img1'),
            decoration: pageDecoration),
        PageViewModel(
            title: "Lern More",
            body: "ini adalaha page 1 dari onboarding",
            image: _buildImage('img2'),
            decoration: pageDecoration),
        PageViewModel(
            title: "page 1",
            body: "ini adalaha page 1 dari onboarding",
            image: _buildImage('img1'),
            decoration: pageDecoration),
        PageViewModel(
          title: "page 1",
          body: "ini adalaha page 1 dari onboarding",
          image: _buildImage('img2'),
          decoration: pageDecoration,
          footer: RaisedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            child: const Text(
              'foo button',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        PageViewModel(
            title: " the last page",
            bodyWidget: Row(
              children: const [
                Text("Click on ", style: bodyStyle),
                Icon(Icons.edit),
                Text(" to edit a post", style: bodyStyle),
              ],
            ),
            image: _buildImage('img1'),
            decoration: pageDecoration),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('skip'),
      next: const Icon(Icons.arrow_right),
      done: const Text(
        "Done",
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 12.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)))),
    );
  }
}
