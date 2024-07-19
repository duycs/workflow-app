// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarUser extends StatefulWidget {
  const CalendarUser({
    super.key,
    this.width,
    this.height,
    this.action,
    this.date,
    this.json,
  });

  final double? width;
  final double? height;
  final Future Function(String? date)? action;
  final DateTime? date;
  final List<dynamic>? json;

  @override
  State<CalendarUser> createState() => _CalendarUserState();
}

class _CalendarUserState extends State<CalendarUser> {
  late Map<DateTime, List<dynamic>> _events;
  late List<dynamic> _selectedEvents;
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  final Map<String, Color> statusColors = {
    "0": Color(0xFFE0E3E7),
    "1": Color(0xFF4B39EF),
    "2": Color(0xFF39D2C0),
    "3": Color(0xFFEE8B60),
    "4": Color(0xFFFF5963),
    "5": Color(0xFF57636C),
  };

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = widget.date ?? DateTime.now();
    _events = _decodeEvents(widget.json ?? []);
    _selectedEvents = _getEventsForDay(_selectedDay);
  }

  Map<DateTime, List<dynamic>> _decodeEvents(List<dynamic> json) {
    Map<DateTime, List<dynamic>> events = {};
    for (var item in json) {
      DateTime date = DateTime.parse(item['date_created']).toLocal();
      if (!events.containsKey(date)) {
        events[date] = [];
      }
      events[date]!.add(item);
    }
    return events;
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _focusedDay,
      firstDate: DateTime.utc(1),
      lastDate: DateTime.utc(9999),
      locale: Locale('vi', 'VN'),
    );
    if (picked != null && picked != _focusedDay) {
      setState(() {
        _selectedDay = picked;
        _focusedDay = picked;
        _selectedEvents = _getEventsForDay(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  setState(() {
                    _focusedDay = DateTime(
                      _focusedDay.year,
                      _focusedDay.month - 1,
                    );
                  });
                },
              ),
              Text(
                DateFormat('MM-yyyy', 'vi').format(_focusedDay),
                style: TextStyle(fontSize: 16.0),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.today),
                    onPressed: () => _selectDate(context),
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      setState(() {
                        _focusedDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month + 1,
                        );
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: TableCalendar(
            locale: 'vi_VN',
            firstDay: DateTime.utc(1),
            lastDay: DateTime.utc(9999),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => false,
            eventLoader: _getEventsForDay,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedEvents = _getEventsForDay(selectedDay);
              });

              String formattedDate =
                  DateFormat('dd/MM/yyyy').format(selectedDay);
              if (widget.action != null) {
                widget.action!(formattedDate);
              }
            },
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(color: Colors.black),
              weekendTextStyle: TextStyle(color: Colors.black),
              outsideTextStyle: TextStyle(color: Colors.black),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
              ),
              markerDecoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronVisible: false,
              rightChevronVisible: false,
              formatButtonShowsNext: false,
              titleTextFormatter: (date, locale) => '',
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle().copyWith(color: Colors.red),
              weekdayStyle: TextStyle().copyWith(color: Colors.black),
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, _) {
                List<dynamic> events = _getEventsForDay(date);
                if (events.isNotEmpty && events.first is Map) {
                  Map<String, dynamic> event =
                      events.first as Map<String, dynamic>;
                  String status = event['status'];
                  Color? color = statusColors[status];
                  return Container(
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }
              },
              todayBuilder: (context, date, _) {
                List<dynamic> events = _getEventsForDay(date);
                if (events.isNotEmpty && events.first is Map) {
                  Map<String, dynamic> event =
                      events.first as Map<String, dynamic>;
                  String status = event['status'];
                  Color? color = statusColors[status];
                  return Container(
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
