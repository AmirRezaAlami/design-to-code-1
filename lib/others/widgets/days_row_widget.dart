import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/day_view_model.dart';
import '../../view_models/month_view_model.dart';
import '../constants/colors.dart';

class DaysRowWidget extends StatelessWidget {
  const DaysRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final dayVM = context.watch<DayViewmodel>();
    final monthVM = context.watch<MonthViewmodel>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
        child: Row(
          children: List.generate(monthVM.getNumberOfDays, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.022,
                  vertical: screenHeight * 0.010),
              child: _getSingleDayContainer(
                  index, context, dayVM, monthVM, screenHeight, screenWidth),
            );
          }),
        ),
      ),
    );
  }

  Widget _getSingleDayContainer(
      int index,
      BuildContext context,
      DayViewmodel dayVM,
      MonthViewmodel monthVM,
      double screenHeight,
      double screenWidth) {
    return GestureDetector(
      onTap: () => dayVM.selectDayContainer(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: screenHeight * 0.117,
        width: screenWidth * 0.166,
        decoration: BoxDecoration(
          color: dayVM.selectedDayIndex == index
              ? Palette.gradientDark
              : Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 1,
              color: Colors.black12,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.008),
            Text(
              (index + 1).toString(),
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(24),
                fontFamily: "poppins",
                fontWeight: FontWeight.bold,
                color: dayVM.selectedDayIndex == index
                    ? Colors.white
                    : Palette.gradientLight,
              ),
            ),
            SizedBox(height: screenHeight * 0.0055),
            Text(
              dayVM.daysOfWeek[(index + monthVM.getStartingDay) % 7],
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(10),
                fontFamily: "poppins",
                color: dayVM.selectedDayIndex == index
                    ? Colors.white
                    : Palette.gradientDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
