import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_ui/view_models/day_view_model.dart';
import '../constants/colors.dart';
import 'package:task_management_app_ui/view_models/month_view_model.dart';

class MonthsRowWidget extends StatelessWidget {
  const MonthsRowWidget({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final monthVM = context.watch<MonthViewmodel>();
    final dayVM = context.watch<DayViewmodel>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () {
            monthVM.goPrevious();
            dayVM.resetToggle();
          },
          icon: Icon(
            Icons.arrow_back,
            size: screenWidth * 0.045,
          ),
          label: Text(
            monthVM.firstLetters(monthVM.getPreviousMonth),
            style: TextStyle(
              fontFamily: "poppins-light",
              fontSize: MediaQuery.textScalerOf(context).scale(12),
              fontWeight: FontWeight.w700,
            ),
          ),
          iconAlignment: IconAlignment.start,
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
        ),
        Expanded(
          child: Center(
            child: Text(
              monthVM.getCurrentMonth,
              style: TextStyle(
                fontFamily: "poppins",
                fontSize: MediaQuery.textScalerOf(context).scale(24),
                fontWeight: FontWeight.bold,
                color: Palette.textColor,
              ),
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () {
            monthVM.goNext();
            dayVM.resetToggle();
          },
          icon: Icon(
            Icons.arrow_forward,
            size: screenWidth * 0.045,
          ),
          label: Text(
            monthVM.firstLetters(monthVM.getNextMonth),
            style: TextStyle(
              fontFamily: "poppins-light",
              fontSize: MediaQuery.textScalerOf(context).scale(12),
              fontWeight: FontWeight.bold,
            ),
          ),
          iconAlignment: IconAlignment.end,
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
        ),
      ],
    );
  }
}
