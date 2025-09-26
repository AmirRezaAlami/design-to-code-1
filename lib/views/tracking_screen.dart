import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_ui/view_models/day_view_model.dart';
import '../others/utils/ui_overlay.dart';
import 'package:task_management_app_ui/others/constants/colors.dart';
import 'package:task_management_app_ui/others/widgets/days_row_widget.dart';
import 'package:task_management_app_ui/others/widgets/months_row_widget.dart';
import 'package:task_management_app_ui/others/widgets/task_board_widget.dart';

import '../view_models/month_view_model.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getSystemUi(Colors.transparent, Brightness.dark,
          Palette.startBackGround, Brightness.dark),
      child: Scaffold(
        body: SizedBox.expand(
          child: DecoratedBox(
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
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
          ),
          _getTopBar(context, screenHeight, screenWidth),
          SizedBox(height: screenHeight * 0.026),
          _getCalendarSection(screenHeight, screenWidth),
          _getOngoingSection(context, screenHeight, screenWidth),
        ],
      ),
    );
  }

  Widget _getTopBar(
    BuildContext context,
    double screenHeight,
    double screenWidth,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.0465,
        right: screenHeight * 0.0465,
        left: screenWidth * 0.083,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: screenWidth * 0.095,
            height: screenWidth * 0.095,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  enableFeedback: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(color: Colors.black26)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                size: screenWidth * 0.066,
              ),
            ),
          ),
          Container(
            width: screenWidth * 0.116,
            height: screenWidth * 0.116,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Palette.cardColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCalendarSection(double screenHeight, double screenWidth) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MonthViewmodel(),
        ),
        ChangeNotifierProxyProvider<MonthViewmodel, DayViewmodel>(
          create: (_) => DayViewmodel(),
          update: (_, monthVM, dayVM) => dayVM!..injectMonth(monthVM),
        ),
      ],
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.070),
            child: MonthsRowWidget(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.013),
            child: DaysRowWidget(),
          ),
        ],
      ),
    );
  }

  Widget _getOngoingSection(
      BuildContext context, double screenHeight, double screenWidth) {
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.055, right: screenWidth * 0.02),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 0.125 * screenWidth,
                child: Text(
                  'Ongoing',
                  style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: MediaQuery.textScalerOf(context).scale(20),
                    fontWeight: FontWeight.bold,
                    color: Palette.textColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.52,
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 14,
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: List.generate(15, (index) {
                          return Container(
                            height: screenHeight * 0.071,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${(index + 9) % 24} ",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  ((index + 9) % 24) < 12 ? 'AM' : 'PM',
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 86,
                    fit: FlexFit.loose,
                    child: _getTasksList(screenHeight, screenWidth),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTasksList(double screenHeight, double screenWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: screenHeight * 0.0125,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0416),
          child: TaskBoardWidget(
            title: "Mobile App Design",
            people: "Mike & Anita",
            time: "Now",
          ),
        ),
        SizedBox(
          height: screenHeight * 0.0250,
        ),
        _getRedIndicator(screenWidth),
        SizedBox(
          height: screenHeight * 0.0225,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0416),
          child: TaskBoardWidget(
            title: "Software Testing",
            people: "Anita & David",
            time: "Now",
          ),
        ),
        SizedBox(
          height: screenHeight * 0.0100,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0416),
          child: TaskBoardWidget(
            title: "Web Development",
            people: "Mike & Anita",
            time: "Now",
          ),
        ),
      ],
    );
  }

  Widget _getRedIndicator(double screenWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: screenWidth * 0.022,
          child: Icon(
            Icons.circle,
            color: Colors.red,
            size: screenWidth * 0.022,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.red,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
