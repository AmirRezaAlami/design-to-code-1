import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../others/utils/ui_overlay.dart';
import 'package:task_management_app_ui/others/constants/colors.dart';
import 'package:task_management_app_ui/views/home_screen.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getSystemUi(
        Colors.transparent,
        Brightness.dark,
        Palette.startBackGround,
        Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Palette.startBackGround,
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Palette.startBackGround,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.4],
            ),
          ),
          child: _getBody(context),
        ),
      ),
    );
  }

  SafeArea _getBody(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getDecoreImage(screenHeight, screenWidth),
          SizedBox(
            height: screenHeight * 0.055,
          ),
          _getDescriptionTexts(context, screenHeight, screenWidth),
          SizedBox(
            height: screenHeight * 0.055,
          ),
          _getButton(context, screenHeight, screenWidth),
        ],
      ),
    );
  }

  Widget _getDecoreImage(double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.06,
        horizontal: screenWidth * 0.125,
      ),
      child: SizedBox(
        height: screenHeight * 0.4,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(screenWidth * 0.42),
          ),
          child: Image(
            image: AssetImage("assets/images/decore.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _getDescriptionTexts(
      BuildContext context, double screenHeight, double screenWidth) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: screenWidth * 0.125),
            Flexible(
              child: Text(
                "Manage your\ndaily tasks",
                style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: MediaQuery.textScalerOf(context).scale(32),
                  fontWeight: FontWeight.w700,
                  color: Palette.textColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.0225,
        ),
        Row(
          children: [
            SizedBox(width: screenWidth * 0.125),
            Flexible(
              child: Text(
                "Team & Project management with\nsolution providing App",
                style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: MediaQuery.textScalerOf(context).scale(14),
                  color: Palette.textColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getButton(
      BuildContext context, double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.140),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenWidth * 0.160,
              width: screenWidth * 0.160,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(2, 6),
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: screenWidth * 0.04),
              child: Center(
                child: Text(
                  "Get",
                  style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: MediaQuery.textScalerOf(context).scale(19),
                    fontWeight: FontWeight.bold,
                    color: Palette.textColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
            Text(
              "Started ",
              style: TextStyle(
                fontFamily: "poppins",
                fontSize: MediaQuery.textScalerOf(context).scale(19),
                fontWeight: FontWeight.bold,
                color: Palette.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
