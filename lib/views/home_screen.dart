import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_management_app_ui/others/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../others/utils/ui_overlay.dart';
import '../others/widgets/bottom_navigation.dart';
import '../others/widgets/task_board_widget.dart';
import 'tracking_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getSystemUi(Colors.transparent, Brightness.light,
          Palette.gradientDark, Brightness.light),
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Palette.gradientLight,
                Palette.gradientDark,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.4],
            ),
          ),
          child: _getBody(context),
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          _getTopBar(screenHeight, screenWidth),
          SizedBox(height: screenHeight * 0.050),
          _getDashboard(context, screenHeight, screenWidth),
          SizedBox(height: screenHeight * 0.025),
          _getStats(context, screenHeight, screenWidth),
        ],
      ),
    );
  }

  Widget _getTopBar(double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.0425,
        right: screenWidth * 0.10,
        left: screenWidth * 0.07,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: screenWidth * 0.135,
            width: screenWidth * 0.135,
            child: SvgPicture.asset(
              'assets/SVGs/sort-lines.svg',
            ),
          ),
          Container(
            width: screenWidth * 0.125,
            height: screenWidth * 0.125,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Palette.startBackGround,
                radius: screenWidth * 0.058,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getDashboard(
      BuildContext context, double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.03),
                child: Text(
                  "Hi AmirReza",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.textScalerOf(context).scale(25.2),
                    fontFamily: "poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.033),
                child: Text(
                  "6 Tasks are pending",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: MediaQuery.textScalerOf(context).scale(14.4),
                    fontFamily: "poppins-light",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.04),
          TaskBoardWidget(
            title: "Mobile App Design",
            people: "Mike & Anita",
            time: "Now",
          ),
        ],
      ),
    );
  }

  Widget _getStats(
      BuildContext context, double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.035),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Monthly Review",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "poppins",
                      fontSize: MediaQuery.textScalerOf(context).scale(18),
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    enableFeedback: true,
                    elevation: 5,
                    backgroundColor: Palette.navColor,
                    shape: CircleBorder(),
                    minimumSize: Size(screenWidth * 0.115, screenWidth * 0.115),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrackingPage(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                    size: screenWidth * 0.06,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
            child: SizedBox(
              height: screenHeight * 0.33,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 6,
                          child: _getCards("22", "Done", context),
                        ),
                        SizedBox(
                          height: screenHeight * 0.030,
                        ),
                        Expanded(
                          flex: 4,
                          child: _getCards("10", "Ongoing", context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.055),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: _getCards("12", "In progress", context),
                        ),
                        SizedBox(
                          height: screenHeight * 0.030,
                        ),
                        Expanded(
                          flex: 6,
                          child: _getCards("7", "Waiting for review", context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCards(String number, String text, context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Palette.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.textScalerOf(context).scale(28),
              fontFamily: "poppins",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.0066,
            width: double.infinity,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white70,
              fontSize: MediaQuery.textScalerOf(context).scale(12.4),
              fontFamily: "poppins-light",
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
