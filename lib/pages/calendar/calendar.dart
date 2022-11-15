import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrsystem/pages/calendar/datasource/meetingdatasource.dart';
import 'package:qrsystem/provider/meeting_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {

    void showAddMeetingDialog() {
      TextEditingController meetingTitleController = TextEditingController();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              title: Column(
                children: <Widget>[
                  Text("예약 추가"),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(controller: meetingTitleController, decoration: InputDecoration(labelText: '예약명')),
                  TextButton(
                      onPressed: () {
                        _pickDateDialog(context);
                      },
                      child: Text('${_dateTime.year} - ${_dateTime.month} - ${_dateTime.day}'))
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text("확인"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Test'),
      ),
      body: SfCalendar(
          view: CalendarView.month,
          allowedViews: [
            CalendarView.day,
            CalendarView.week,
            CalendarView.workWeek,
            CalendarView.month,
            CalendarView.timelineDay,
            CalendarView.timelineWeek,
            CalendarView.timelineWorkWeek
          ],
          onTap: (CalendarTapDetails details) {
            print('${details.date}');
          },
          dataSource: MeetingDataSource(getDataSource(context)),
          monthViewSettings: const MonthViewSettings(appointmentDisplayCount: 4, showAgenda: true)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddMeetingDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }



  // TODO 시작 일시 및 종료 일시 추가기능
  /**
   * 예약 일시 추가를 위한 Dialog
   */
  Future<void> _pickDateDialog(BuildContext context) async {
    final initialDate = DateTime.now();
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year + 3),
    );

    if(selectedDate == null){
      return;
    }
    _dateTime = selectedDate;
  }

  // void getDateWithPicker() {
  //   Future<DateTime?> selectedDate = showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2020),
  //       lastDate: DateTime(2024),
  //       builder: (BuildContext context, Widget? child) {
  //         return Theme(
  //           data: ThemeData.dark(),
  //           child: child!,
  //         );
  //       });
  //
  //   selectedDate.then((value) {
  //     setState(() {
  //       _dateTime = value!;
  //     });
  //   });
  // }

}
