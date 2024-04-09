import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyColors {
  static Color primaryColor = Colors.white;
  static Color secondaryColor = Colors.black;
  static Color blue = const Color(0xff2E5CAA);
  static Color lightBlue = const Color(0xff6495ED);
  static Color veryLightBlue = const Color(0xff91C4F2);
  static Color dullBlue = const Color(0xffE2ECFF);
  static Color greyShadow = const Color(0x668E8E8E);
  static Color dullWhite = const Color(0xffFAFAFA);
  static Color white = Colors.white;
  static Color black = Colors.black;
}

AndroidNotificationDetails androidChannel = AndroidNotificationDetails(
    '1', 'Events',
    importance: Importance.high,
    icon: '@mipmap/ic_launcher',
    color: MyColors.blue,
    styleInformation: BigTextStyleInformation(''));

NotificationDetails platformChannel =
    NotificationDetails(android: androidChannel);
