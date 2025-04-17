import 'dart:math';

import 'package:intl/intl.dart';

// import 'package:timeago/timeago.dart' as timeago;

class TimeManager {
  //MY CUSTOM FUNCTION TO GET & CONVERT THE TIMESTAMP
  // String myTimestamp(int timestamp) {
  //   //1579096362834 //365days ago
  //   // 1610402362834
  //   // 1610407362834
  //   // 1610502362834
  //   // 1610620579043
  //   final now = DateTime.now();

  //   // int time = 1610207362834;

  //   DateTime d = DateTime.fromMillisecondsSinceEpoch(timestamp);

  //   // List<String> myDate2 = d.toString().split(' ');
  //   // List<String> myDate = myDate2[0].toString().split('-');
  //   // int year = int.parse(myDate[0]);
  //   // int month = int.parse(myDate[1]);
  //   // int day = int.parse(myDate[2]);

  //   int year = int.parse(DateFormat.y().format(d));
  //   int month = int.parse(DateFormat.M().format(d));
  //   int day = int.parse(DateFormat.d().format(d));

  //   DateTime date = DateTime(year, month, day);
  //   int diff = now.difference(date).inDays;
  //   int diffHrs = now.difference(date).inHours;

  //   // print(diff);

  //   //jm //MMMEd //yMMMEd
  //   if (diff == 0) {
  //     return (timeago
  //         .format(DateTime.fromMillisecondsSinceEpoch(timestamp))
  //         .toString());
  //   } else if (diffHrs >= 24 && diffHrs <= 48) {
  //     return ('Yesterday, ${DateFormat.jm().format(d)}');
  //   } else if (diff == 2) {
  //     return ('${timeago.format(DateTime.fromMillisecondsSinceEpoch(timestamp))} ${DateFormat.jm().format(d)}');
  //   } else if (diff == 3) {
  //     return ('${timeago.format(DateTime.fromMillisecondsSinceEpoch(timestamp))} ${DateFormat.jm().format(d)}');
  //   } else if (diff > 3 && diff <= 364) {
  //     return ('${DateFormat.MMMd().format(d)}, ${DateFormat.jm().format(d)}');
  //   } else {
  //     return (DateFormat.yMMMd().format(d).toString());
  //   }
  // }

  String get_chat_date(int timestamp) {
    final now = DateTime.now();

    // int time = 1610207362834;

    DateTime d = DateTime.fromMillisecondsSinceEpoch(timestamp);

    // List<String> myDate2 = d.toString().split(' ');
    // List<String> myDate = myDate2[0].toString().split('-');
    // int year = int.parse(myDate[0]);
    // int month = int.parse(myDate[1]);
    // int day = int.parse(myDate[2]);

    int year = int.parse(DateFormat.y().format(d));
    int month = int.parse(DateFormat.M().format(d));
    int day = int.parse(DateFormat.d().format(d));

    DateTime date = DateTime(year, month, day);
    // int diff = now.difference(date).inDays;
    int diffHrs = now.difference(date).inHours;
    if (diffHrs <= 24) {
      return "Today";
    } else if (diffHrs > 24 && diffHrs <= 48) {
      return "Yesterday";
    } else {
      return (DateFormat.yMMMd().format(d).toString());
    }
  }

  //1658370201297
  //July 21, 2022
  String date_from_timestamp(int timestamp) {
    var date2 = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    String d = date2.toString().split(" ")[0];
    List<String> s = d.split("-");
    String month = getMonthString(int.parse(s[1]));
    month = month.substring(0, 3);
    // print("$month ${s[2]}, ${s[0]}");
    return "$month ${s[2]}, ${s[0]}";
  }

  //1658370201297
  //3:23AM
  String time_from_timestamp(int timestamp) {
    String? noon;
    int? hour24;
    String? hour;
    String? minute;

    var date2 = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    // print(date2);
    String d2 = date2.toString().split(" ")[1];
    List<String> d = d2.split(":");
    hour24 = int.parse(d[0]);
    minute = d[1];

    if (hour24 > 12) {
      int hour12 = hour24 - 12;
      hour = hour12.toString();
      noon = 'PM';
    } else {
      hour = hour24.toString();
      print(hour24.toString());
      noon = 'AM';
    }

    return ('$hour:$minute $noon');
  }

  String dateFromTimestamp(int timestamp) {
    var date2 = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    String d = date2.toString().split(" ")[0];
    List<String> s = d.split("-");
    String year = s[0].toString().substring(2, 4);
    // String month = getMonthString(int.parse(s[1]));
    // print("${s[2]}/${s[1]}/${s[0]}");
    return "${s[2]}/${s[1]}/${year}";
  }

//receives a month as int and returns the month in full String e.g April
  String getMonthString(int month) {
    if (month == 1) {
      return 'January';
    } else if (month == 2) {
      return 'February';
    } else if (month == 3) {
      return 'March';
    } else if (month == 4) {
      return 'April';
    } else if (month == 5) {
      return 'May';
    } else if (month == 6) {
      return 'June';
    } else if (month == 7) {
      return 'July';
    } else if (month == 8) {
      return 'August';
    } else if (month == 9) {
      return 'September';
    } else if (month == 10) {
      return 'October';
    } else if (month == 11) {
      return 'November';
    } else {
      return 'December';

      // 'January',
      // 'February',
      // 'March',
      // 'April',
      // 'May',
      // 'June',
      // 'July',
      // 'August',
      // 'September',
      // 'October',
      // 'November',
      // 'December',
    }
  }

  String get_day_of_week_from_timestamp(int timestamp) {
    // Convert timestamp to DateTime object
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    // Get the day of the week
    int dayOfWeek = dateTime.weekday;

    // Convert day of week to a string representation
    String dayOfWeekString = _getDayOfWeekString(dayOfWeek);

    return dayOfWeekString;
  }

  String _getDayOfWeekString(int dayOfWeek) {
    switch (dayOfWeek) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Unknown';
    }
  }

  //THIS WILL HELP TO GENERATE A SPECIFIC SET OF RANDOM NUMBER DIGITS
  //4 digits will be generated in this case
  String generateDigitRandomNumber() {
    var rand = '';
    var r = Random();
    for (var i = 0; i < 4; i++) {
      rand = rand + r.nextInt(9).toString();
    }
    return (rand);
  }

  //TO GET THE DATE AND TIME A USER CREATED ACCOUNT
  //IN A FORMAT LIKE: 202007181239
  //AND USE IN SORTING USERS CHRONOLOGICALLY, BASED ON THE DAY AND TIME THEY CREATED AN ACCOUNT
  int getDateTime() {
    DateTime d = DateTime.now(); //GET CURRENT DATE AND TIME IN FULL
    List<String> datetime =
        d.toString().split(' '); //SPLIT THEM TO ITEMS IN A LIST

    String date = datetime[0];
    String time = datetime[1];

    String finalDate =
        date.split('-').join(); //REMOVING THE - SPLITING THE DATE AND MERGING

    String ntime =
        time.split(':').join(); //REMOVING THE : SPLITTING THE TIME (first)

    List<String> fullTime = ntime.split('.'); //REMOVING THE .milliseconds PART
    String nnTime = fullTime[0]; //EXTRACTING JUST THE H:M:S PART OF THE TIME
    String finalTime = nnTime.substring(
        0, 4); //EXTRATING JUST THE H:M PART (because of the limit of int)

    // print('todays date is $finalDate');
    // print('current time now is $finalTime');
    return int.parse('$finalDate$finalTime');
  }
}
