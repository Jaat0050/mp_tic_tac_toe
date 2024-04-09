import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyColors {
  static Color bgColor = const Color.fromRGBO(16, 13, 34, 1);
  static Color blue = const Color(0xff2E5CAA);
}

AndroidNotificationDetails androidChannel = AndroidNotificationDetails(
    '1', 'Events',
    importance: Importance.high,
    icon: '@mipmap/ic_launcher',
    color: MyColors.blue,
    styleInformation: const BigTextStyleInformation(''));

NotificationDetails platformChannel =
    NotificationDetails(android: androidChannel);

//-------------------------------------------------toast-------------------------------------------------//

void toastMsg(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: MyColors.blue,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
