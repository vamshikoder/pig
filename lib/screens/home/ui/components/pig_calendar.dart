import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../config/config.dart';

class PigCalendar extends StatefulWidget {
  const PigCalendar({
    Key? key,
  }) : super(key: key);

  @override
  _PigCalendarState createState() => _PigCalendarState();
}

class _PigCalendarState extends State<PigCalendar> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final double _sHeight = _size.height;
    // final double _sWidth = _size.width;
    return LimitedBox(
      maxHeight: _sHeight * 0.40,
      child: SfCalendar(
        // headerHeight: 5.0,
        viewHeaderHeight: 20.0,
        view: CalendarView.month,
        headerStyle: const CalendarHeaderStyle(
          textStyle: TextStyle(
            color: primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.5,
          ),
        ),
        onViewChanged: (_) {},
        selectionDecoration: BoxDecoration(
          boxShadow: lightBoxShadow,
          color: primaryColor.withOpacity(0.2),
          border: Border.all(
            color: primaryColor,
          ),
          shape: BoxShape.circle,
        ),
        monthViewSettings: const MonthViewSettings(
          showAgenda: true,
          appointmentDisplayCount: 2,
          appointmentDisplayMode: MonthAppointmentDisplayMode.none,
          agendaViewHeight: 50.0,
        ),
        cellBorderColor: transparent,
        todayHighlightColor: primaryColor,
        todayTextStyle: const TextStyle(
          color: white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
