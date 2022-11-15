import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qrsystem/common/constants.dart';
import 'package:http/http.dart' as http;
import '../common/util.dart';
import '../model/meeting_model.dart';

/**
 * 참고 블로그
 * https://geekconfig.com/tutorial/how-to-load-ondemand-appointments-using-web-service-in-flutter-event-calendar
 *
 */
class MeetingRepository {
  Future<List<Meeting>> getMeetingData() async {
    var uri = Constants.PF_API_BASEURL;
    var response = await http.post(Uri.parse(uri));

    List<Meeting> meetingData = [];
    final Random random = new Random();

    meetingData = _getTempMeetingList();
    return meetingData;

    /*
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      for(var data in body){
        Meeting meetings = Meeting(
          eventName: data['eventName'],
          from: _convertDateFromString(data['StartTime']),
          to: _convertDateFromString(data['EndTime']),
          background: appointmentColor[random.nextInt(9)],
        );
        meetingData.add(meetings);
      }
    }else{

    }
     */
  }
}

DateTime _convertDateFromString(String date) {
  return DateTime.parse(date);
}

List<Meeting> _getTempMeetingList() {
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  final List<Meeting> meetings = <Meeting>[
    Meeting(eventName: 'Conference', from: startTime, to: endTime, background: appointmentColor[0]),
    Meeting(eventName: 'teset1', from: DateTime(today.day - 1), to: today, background: appointmentColor[1]),
  ];
  return meetings;
}
