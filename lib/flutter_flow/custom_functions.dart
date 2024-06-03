import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

int stringToInt(String stringNumber) {
  // string to int
  return int.parse(stringNumber);
}

DateTime? stringToDateTime(String? dateString) {
  // parse string to datetime
  DateTime? dateTime;
  try {
    dateTime = DateTime.parse(dateString ?? "");
  } catch (e) {
    dateTime = null;
  }

  return dateTime;
}

String? stringToGetStaffId(dynamic text) {
  // Parse the JSON string into a Map
  Map<String, dynamic> jsonMap = jsonDecode(text['staff']);

  // Extract the value corresponding to the "id" key
  String idValue = jsonMap['id'];

  // Return the value
  return idValue;
}

String? dangerouslySetInnerHTMLtoString(String htmlString) {
  String plainText =
      htmlString.replaceAll(RegExp(r'<[^>]*>', multiLine: true), '');
  return plainText;
}

dynamic stringToJson(String text) {
  Map<String, dynamic> jsonData = json.decode(text);

  return jsonData;
}

String datetimeToString(String datetime) {
  // convert datetime to string
  final parsedDatetime = DateTime.parse(datetime);
  final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  return formatter.format(parsedDatetime);
}

String? jsontoString(dynamic data) {
  // json to program string
  return json.encode(data);
}

List<dynamic> stringArraytoJson(
  String? data,
  String name,
  String type,
) {
  if (data == '') {
    return [];
  } else if (data == null) {
    return [];
  } else if (data == 'null') {
    return [];
  } else {
    // input string Satisfied decode , ouput format
    Map<String, dynamic> jsonMap = {};
    if (type == 'object') {
      jsonMap = jsonDecode(data!) as Map<String, dynamic>;

      if (data.contains(name)) {
        var streetsFromJson = jsonMap[name];
        List<dynamic> streetsList = new List<dynamic>.from(streetsFromJson);
        return (streetsList);
      } else {
        return [];
      }
    } else {
      jsonMap = jsonDecode(json.decode(data!)) as Map<String, dynamic>;

      final keys = jsonMap[name] == null ? null : '123';
      if (keys == null) {
        return [];
      } else {
        var streetsFromJson = jsonMap[name];
        List<dynamic> streetsList = new List<dynamic>.from(streetsFromJson);

        return (streetsList);
      }
    }
    // Truy cập các thuộc tính trong đối tượng JSON
    // final departments = jsonMap['departments'];
    // final staffs = jsonMap['staffs'];
  }
}

String limitPublished(
  String type,
  List<String>? list,
) {
  String up = "";

  // 1: day
  // 2: week
  // 3: month
  if (list != null) {
    String listUp = list.join(',');
    if (type == '1') {
      up = "00 00 01-31 * *";
      return up;
    } else if (type == '2') {
      List<String> numbers = [];
      for (String day in list) {
        switch (day) {
          case 'Thứ Hai':
            numbers.add('1');
            break;
          case 'Thứ Ba':
            numbers.add('2');
            break;
          case 'Thứ Tư':
            numbers.add('3');
            break;
          case 'Thứ Năm':
            numbers.add('4');
            break;
          case 'Thứ Sáu':
            numbers.add('5');
            break;
          case 'Thứ Bảy':
            numbers.add('6');
            break;
          case 'Chủ Nhật':
            numbers.add('7');
            break;
          // Thêm các trường hợp cho các ngày còn lại
        }
      }

      String listUpWeek = numbers.join(',');

      up = '00 00 * * $listUpWeek';
      return up;
    } else if (type == '3') {
      up = '00 00 $listUp * *';
      return up;
    } else {
      return "null";
    }
  } else if (type == '1') {
    up = "00 00 01-31 * *";
    return up;
  } else {
    return "null";
  }
}

dynamic groupTasksByWorkflowImplement(String jsonData) {
  var parsedData = jsonDecode(jsonData);

  var tasksList = parsedData['data']
      .expand((workflow) => workflow['steps'])
      .expand((step) => step['tasks'])
      .toList();

  var groupedTasks = <String, Map<int, List<Map<String, dynamic>>>>{};

  for (var task in tasksList) {
    String workflowId = task['workflow_id'];
    int publishedCount = task['published_count'];

    groupedTasks.putIfAbsent(workflowId, () => {});
    groupedTasks[workflowId]!.putIfAbsent(publishedCount, () => []);
    groupedTasks[workflowId]![publishedCount]!.add(
        {"id": task['id'], "name": task['name'], "status": task['status']});
  }

  var result = {
    "data": groupedTasks.entries.map((entry) {
      var workflowId = entry.key;
      var publishedCountGroups = entry.value.entries.map((groupEntry) {
        var publishedCount = groupEntry.key;
        var tasks = groupEntry.value;
        return {"published_count": publishedCount, "tasks": tasks};
      }).toList();

      int totalDone = 0;
      for (var groupEntry in entry.value.entries) {
        if (groupEntry.value.every((task) => task['status'] == 'done')) {
          totalDone += 1;
        }
      }

      return {
        "workflow_id": workflowId,
        "total_done": totalDone,
        "published_count_group": publishedCountGroups
      };
    }).toList()
  };

  return result;
}

int timeToMinute(
  String hour,
  String second,
  String? day,
) {
  if (day == 'null') {
    // Chuyển đổi string sang số
    int hours = int.parse(hour);
    int minutes = int.parse(second);

    // Tính toán tổng số giây
    int seconds = hours * 60 + minutes;
    return seconds;
  } else if (day == null) {
    // Chuyển đổi string sang số
    int hours = 0;
    int minutes = 0;
    if (hour == '') {
      hours = 0;
    } else {
      hours = int.parse(hour);
    }
    if (minutes == '') {
      minutes = 0;
    } else {
      minutes = int.parse(second);
    }

    // Tính toán tổng số giây
    int seconds = hours * 60 + minutes;
    return seconds;
  } else {
    // Chuyển đổi string sang số
    int days = int.parse(day);
    int hours = int.parse(hour);
    int minutes = int.parse(second);

    // Tính toán tổng số giây
    int seconds = days * 1440 + hours * 60 + minutes;
    return seconds;
  }
}

List<String> cronToType(String cron) {
  if (cron == null) {
    return [''];
  } else if (cron == 'null') {
    return [''];
  } else {
    List<String> cronParts = cron.split(' ');
    String checkWeek = cronParts[4];
    if (checkWeek == "*") {
      // xác định là lặp ngày qua ngày hay tháng
      String daysRange = cronParts[2];
      if (cronParts[2] == '01-31') {
        return [''];
      } else {
        List<String> month = cronParts[2].split(',');
        return month;
      }
    } else {
      List<String> week = cronParts[4].split(',');
      List<String> weekTitle = [];
      for (String day in week) {
        switch (day) {
          case '1':
            weekTitle.add('Thứ Hai');
            break;
          case '2':
            weekTitle.add('Thứ Ba');
            break;
          case '3':
            weekTitle.add('Thứ Tư');
            break;
          case '4':
            weekTitle.add('Thứ Năm');
            break;
          case '5':
            weekTitle.add('Thứ Sáu');
            break;
          case '6':
            weekTitle.add('Thứ Bảy');
            break;
          case '7':
            weekTitle.add('Chủ Nhật');
            break;
          // trường hợp bị lỗi thêm các trường khác là ""
          default:
            weekTitle.add("");
        }
      }
      return weekTitle;
    }
  }
}

String checkTypeCron(String cron) {
  if (cron == null) {
    return '0';
  } else if (cron == 'null') {
    return '0';
  } else {
    List<String> cronParts = cron.split(' ');
    String checkWeek = cronParts[4];
    if (checkWeek == "*") {
      // xác định là lặp ngày qua ngày hay tháng
      String daysRange = cronParts[2];
      if (cronParts[2] == '01-31') {
        return '1';
      } else {
        return '3';
      }
    } else {
      return '2';
    }
  }
}

int totalLimitPublished(
  String timeEnd,
  List<String> listCheck,
  String type,
) {
  // date now
  DateTime now = DateTime.now();
  List<int> timeNow = [now.day, now.month, now.year];

  // date end
  List<String> dateParts = timeEnd.split("/");

  // List<int> dateList = [year, month, day];
  DateTime targetDate = DateTime(int.parse(dateParts[2]),
      int.parse(dateParts[1]), int.parse(dateParts[0]) + 1);

  if (type == '3') {
    int count = 0;

    // số ngày lặp kkhoong can thiet
    List<String> filteredNumbers = listCheck
        .where((number) => int.parse(number) > int.parse(dateParts[0]))
        .toList();

    // tính sau ngày hiện tại
    now = DateTime(now.year, now.month, now.day + 1);

    while (now.isBefore(targetDate)) {
      var day1 = now.day;
      var dayCheck = now.day < 10 ? '0$day1'.toString() : now.day.toString();
      if (listCheck.contains(dayCheck)) {
        count++;
      }
      ;
      now = DateTime(now.year, now.month, now.day + 1);
    }

    return count;
  } else if (type == '2') {
    now = DateTime(now.year, now.month, now.day + 1);
    final daysRemaining = targetDate.difference(now).inDays;

    List<int> weekCheck = [];
    // String listCheck(String dayNumber) {
    //   switch (dayNumber) {
    //     case "Thứ Hai":
    //       weekCheck.add("monday");
    //       return "monday";
    //     case "Thứ Ba":
    //       weekCheck.add('tuesday');
    //       return "tuesday";
    //     case "Thứ Tư":
    //       weekCheck.add('wednesday');
    //       return "wednesday";
    //     case "Thứ Năm":
    //       weekCheck.add('thursday');
    //       return "thursday";
    //     case "Thứ Sáu":
    //       weekCheck.add('friday');
    //       return "friday";
    //     case "Thứ Bảy":
    //       weekCheck.add('saturday');
    //       return "saturday";
    //     case "Chủ Nhật":
    //       weekCheck.add('sunday');
    //       return "sunday";
    //     default:
    //       return '';
    //   }
    // }

    for (String day in listCheck) {
      switch (day) {
        case 'Thứ Hai':
          weekCheck.add(1);
          break;
        case 'Thứ Ba':
          weekCheck.add(2);
          break;
        case 'Thứ Tư':
          weekCheck.add(3);
          break;
        case 'Thứ Năm':
          weekCheck.add(4);
          break;
        case 'Thứ Sáu':
          weekCheck.add(5);
          break;
        case 'Thứ Bảy':
          weekCheck.add(6);
          break;
        case 'Chủ Nhật':
          weekCheck.add(7);
          break;
        // trường hợp bị lỗi thêm các trường khác là ""
      }
    }
    // tính tổng
    int tuesdayCount = 0;
    for (int i = 0; i < daysRemaining; i++) {
      final currentDate = now.add(Duration(days: i));
      for (int week1 in weekCheck) {
        if (currentDate.weekday == week1) {
          tuesdayCount++;
        }
      }
    }
    return tuesdayCount;
  } else if (type == '1') {
    final daysRemainingDay = targetDate.difference(now).inDays;
    return daysRemainingDay;
  } else {
    return 0;
  }

  // return count;
}

List<ProcedurePublishedStepTaskStruct> sortArrayStepWorkflowResuftWoflow(
    List<ProcedurePublishedStepTaskStruct> data) {
  if (data.length > 0) {
    data.sort((a, b) => a.number.compareTo(b.number));
    return data;
  } else {
    return data;
  }
}

List<WorkflowsStepCreateStruct> sortArrayStepList(
    List<WorkflowsStepCreateStruct> data) {
  if (data.length > 0) {
    data.sort((a, b) => a.number.compareTo(b.number));
    // In mảng đã sắp xếp
    return data;
  } else {
    return data;
  }
}

List<StepsStruct> sortArrayStepWorkflows(List<StepsStruct> data) {
  if (data.length > 0) {
    data.sort((a, b) => a.number.compareTo(b.number));
    return data;
  } else {
    return data;
  }
}

String formatHtml(String apiHtml) {
  String processedHtml = apiHtml.replaceAll(r'\"', '"');
  return processedHtml;
}

String checkFileLast(String text) {
  if (text == 'null') {
    return '1';
  } else {
    List<String> pptx = [
      'pptx',
      'pptm',
      'ppt',
      'potx',
      'potm',
      'pot',
      'ppsx',
      'pps'
    ];
    List<String> img = [
      'png',
      'jpg',
      'jpeg',
      'gif',
      'tiff',
      'psd',
      'eps',
      'heic',
      'raw',
      'svg'
    ];
    List<String> exc = ['xls', 'xlsm', 'xlsx', 'xlt'];
    List<String> word = ['docx', 'doc', 'docm', 'dot'];
    List<String> pdf = ['pdf'];
    List<String> video = [
      'mpeg-4',
      'mpeg-2',
      'hevc',
      'mp4',
      'avi',
      'mov',
      'flv',
      'wmv'
    ];
    if (pptx.contains(text)) {
      return 'pptx';
    } else if (exc.contains(text)) {
      return 'exc';
    } else if (img.contains(text)) {
      return 'img';
    } else if (word.contains(text)) {
      return 'word';
    } else if (pdf.contains(text)) {
      return 'pdf';
    } else if (video.contains(text)) {
      return 'video';
    } else {
      return '1';
    }
  }
}

String aDayInThePast(DateTime today) {
  DateTime pastDateTime = today.subtract(Duration(days: 7));
  String formattedPastDate = DateFormat('yyyy-MM-dd').format(pastDateTime);

  return formattedPastDate;
}

bool isTokenExpired(int lastTokenDate) {
  int currentTimetamp = (DateTime.now().microsecondsSinceEpoch / 1000).round();

  bool check = (lastTokenDate - currentTimetamp) > 15000;
  return check;
}

String? fileName(FFUploadedFile? file) {
  // Return the file's name if available, otherwise return null.
  return file?.name?.toString();
}

double? newCaculator(List<dynamic>? list) {
  if (list is List<dynamic>) {
    double totalPercentCorrect = 0.0;
    for (var item in list) {
      if (item is Map && item.containsKey('percent_correct')) {
        totalPercentCorrect +=
            double.tryParse(item['percent_correct'].toString()) ?? 0.0;
      }
    }
    return totalPercentCorrect;
  }
  return null;
}

int countJobDone(dynamic workflowItemJson) {
  var tasksList = (workflowItemJson['steps'] as List)
      .expand((step) => (step['tasks'] as List))
      .toList();

  Map<int, List<dynamic>> tasksGroupedByPublishedCount = {};
  tasksList.forEach((task) {
    int publishedCount = task['published_count'];
    tasksGroupedByPublishedCount[publishedCount] ??= [];
    tasksGroupedByPublishedCount[publishedCount]!.add(task);
  });

  int completedJobs = 0;
  tasksGroupedByPublishedCount.forEach((publishedCount, tasks) {
    bool allTasksCompleted = tasks.every((task) => task['status'] == 'done');
    if (allTasksCompleted) {
      completedJobs++;
    }
  });

  return completedJobs;
}
