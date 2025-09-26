import 'package:flutter/services.dart';

SystemUiOverlayStyle getSystemUi(
    Color statusBar, Brightness statusIcon, Color navBar, Brightness navIcon) {
  return SystemUiOverlayStyle(
    statusBarColor: statusBar,
    statusBarIconBrightness: statusIcon,
    systemNavigationBarColor: navBar,
    systemNavigationBarIconBrightness: navIcon,
  );
}
