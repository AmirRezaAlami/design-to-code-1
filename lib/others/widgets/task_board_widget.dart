import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TaskBoardWidget extends StatelessWidget {
  final String title;
  final String people;
  final String time;

  const TaskBoardWidget({
    super.key,
    required this.title,
    required this.people,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.14,
      decoration: BoxDecoration(
        color: Palette.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 10,
            color: Colors.black12,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.013,
        horizontal: screenWidth * 0.055,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.textScalerOf(context).scale(16),
              fontFamily: "poppins",
            ),
          ),
          Text(
            people,
            style: TextStyle(
              color: Colors.white70,
              fontSize: MediaQuery.textScalerOf(context).scale(11.4),
              fontFamily: "poppins-light",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.013,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: screenHeight * 0.0425,
                    height: screenHeight * 0.0425,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(
                      child: CircleAvatar(
                        radius: screenHeight * 0.0190,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.070),
                    width: screenHeight * 0.0425,
                    height: screenHeight * 0.0425,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(
                      child: CircleAvatar(
                        radius: screenHeight * 0.0190,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                time,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: MediaQuery.textScalerOf(context).scale(10),
                  fontFamily: "poppins-light",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
